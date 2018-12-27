# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: David Raymond <raymond at kestrel dot nmt dot edu>
# Contributor: Alex Suykov <axs at ukr dot net>
# Contributor: Frank Thieme <frank at fthieme dot net>

# TODO: Did I miss references or fix too many in man pages.
# TODO: Fix lpc [lpd|lpq|lprm] and other internal usages? These run the CUPS executables.
# TODO: Improve instructions for LPR only support for brand name printers.
# TODO: We shouldn't be the ones to rename the binaries. Upstream should implement EXEEXT.
# TODO: Are there better versions of these old filters?

# Renaming cups binaries has race conditions where binaries are bogus or missing for a short time.

set -u

_opt_SSL10=1

_primarylpr=0 # Can be changed between installs
# 0 - cups  binaries with original name lp lpr lpq, alternate names for lprng
# 1 - lprng binaries with original name lp lpr lpq, alternate names for cups
# Final test: install 0 twice, install 1 twice, install cups, install 0 twice

# suffix for conflicting binaries: lpr -> lprng so tab completion will find it
# Can be changed between installs.
if [ "${_primarylpr}" -eq 0 ]; then
  _sfx='ng' # sources contain EXEEXT but I couldn't get it to do anything.
else
  _sfx='cups'
fi

# Need: Web based printcap editor, LPInfo?

# https://github.com/apple/cups/issues/5269

# CUPS plans to drop '-o raw' support. raw 9100 is the *only* useful
# way to print for a large swath of industrial printers, Zebra label
# printers in particular for which the ZPL and EPL print software will never
# be rewritten to output a CUPS compatible format.
# CUPS is needed for a large swath of WinPrinters
# and for automatic printing of PCL, PXL, PostScript and PDF. Neither
# raw nor CUPS is going away so I fixed lprng to coexist with CUPS.

# printcap is also a lot easier to manage than CUPS. Text FTW!

# Gentoo solves this with a use flag that leaves out the lpr binaries from the cups package
# https://packages.gentoo.org/useflags/lprng-compat
# Debian/Ubuntu solves this with the conflicting binaries in a separate cups-bsd package.
# Unfortunately neither of these solutions allows using both cups and lprng command line tools.

# Here we can rename either the cups binaries or the lprng binaries, whichever is easier to fix scripting.

# As of Dec 2018 CUPS raw can be considered as already gone.
# CUPS has two show stopper raw bugs that probably won't be fixed.

# Bug 1:
# https://github.com/apple/cups/issues/4782
# Bug reappeared yet again
#   lp -d lp -o raw file1 file2
# 2 files queued, file1 prints, file2 does not

# Bug 2:
# Some instances of piping stdin '|lp -o raw' or '|lpr -o raw' crash with
#   lp:  Error - unable to queue from stdin - Success.
#   lpr: Error - unable to queue from stdin - Broken pipe.
# lp and lpr are breaking the pipe, not the source. Capturing
# stdin to a file and printing with 'lpr -r -o raw file' works.

# This might be a not yet found bug from glib 2.28 breaking filters.
# https://bugs.archlinux.org/task/60044
# https://github.com/OpenPrinting/cups-filters/issues/58
# https://github.com/apple/cups/issues/5396

# cups-lpr cups-lpd also has some faults

# CUPS printers must be shared to be accessed by the locally running cups-lpr.
# CUPS sharing pollutes the network with unwanted printers.

# -o raw does not work with cups-lpd. It can be tricked into working but
# eventually it will not work.

# https://lists.cups.org/pipermail/cups/2009-August/047481.html Adam Tauno Williams [cups.general] Remote raw printing via cups-lpd s
# https://marc.info/?l=cups&m=125084903028064&w=2
# The solution is to use different switches with systemd or xinetd
# This can be applied to systemd with
#   systemctl edit org.cups.cups-lpd@.service
# [Service]
# ExecStart=
# ExecStart=-/usr/lib/cups/daemon/cups-lpd -o job-sheets=none -o document-format=application/vnd.cups-raw

_spooldir='/var/spool/lpd'
_printcap='/etc/lprng/printcap'
_service='lpd.service'

pkgname='lprng'
pkgver='3.8.C'
pkgrel='1'
pkgdesc='an enhanced, extended, and portable implementation of the Berkeley LPR lpd print spooler functionality'
if [ ! -z "${_sfx}" ]; then
  pkgname+='-cups'
  pkgdesc+=' that coexists with CUPS'
fi
arch=('i686' 'x86_64')
url='http://lprng.sourceforge.net'
license=('custom:Artistic')
depends=('bash' 'file' 'grep' 'sed')
if [ "${_opt_SSL10}" -ne 0 ]; then
  depends+=('openssl-1.0')
fi
optdepends=(
  'poppler: pdf to ps conversion in filters (gsfilter)' # formerly xpdf
  'ghostscript: convert ps to device language in filters (gsfilter)'
  'enscript: text to ps conversion in filters (gsfilter,psfilter)'
  'foomatic-filters-lprng: foomatic-rip in filters (foofilter)'
  'hplip: drivers for HP printers'
  'ifhp: filters for many printers'
)
if [ ! -z "${_sfx}" ]; then
  provides=("lprng=${pkgver}") # a rather specious claim since we don't provide the binaries with the same name
  conflicts=('lprng')
  optdepends+=(
    'lprng: install this instead for standard BSD binaries lp lpr lpq without cups'
  )
  if [ "${_primarylpr}" -ne 0 ]; then
    depends+=('cups')
  else
    optdepends+=(
      'cups: standard BSD binaries lp lpr lpq'
    )
  fi
else
  conflicts=('cups')
  _primarylpr=0
fi
backup=(
  'etc/lprng/lpd/lpd.conf'
  'etc/lprng/lpd/lpd.perms'
  "${_printcap#/}"
)
_mans=(
  'man1/cancel.1'
  'man1/lp.1'
  'man1/lpq.1'
  'man1/lpr.1'
  'man1/lprm.1'
  'man1/lpstat.1'
  'man8/lpc.8'
)
if [ "${_primarylpr}" -ne 0 ]; then
  _bins=("${_mans[@]##*/}")
  _bins=("${_bins[@]%%.*}")
  _binscups=("${_bins[@]/#/usr\/bin/}")
  _binscups=("${_binscups[@]/%/${_sfx}}")
  backup+=("${_binscups[@]}") # minimize race conditions with cups binaries. Race conditions for man pages are of no concern.
  unset _binscups
fi
options=('!strip')
install="${pkgname%%-*}.install"
_srcdir="lprng-${pkgver}"
source=(
  "http://sourceforge.net/projects/lprng/files/lprng/lprng-${pkgver}.tar.gz"
  '0000-lprng-help-website.patch'
  'lpd.service'
  'gsfilter'
  'psfilter'
  'foofilter'
  'printcap_remote'
  'printcap_server'
  'README'
  'lpd.conf'
  'lpd.perms'
)
md5sums=('5901bed95e61d2bea3ba3056056af432'
         'c9c774d21fe1304c69a62dfe8c7f77ee'
         'a59c448b0e37db80422175b7a1a2c304'
         '2a45ea95fc86bf9ae61f932aaac9d214'
         'd6c523f275bb63f68bf17d5ca02e4814'
         'd8390a6cb0126dabf029fdd2c9dc07c8'
         '496dfbb160f2a0308b7847541b03c8db'
         '422ad79bda6ae9d2990fdef55240e569'
         '1768d2f81d6d14c22686293ca60528c1'
         '3ef9f91dc0de273da1f5f1b20d49cd17'
         '3f861c75c2d68c0e45b4095ab39ba1c8')
sha256sums=('694a1747a96385b89e93f43343bf35cee5c8c73353a83814106911c99f09de10'
            'dc219daa8dccd6e02039568e54fa15bc0dd993f99eb2a79a1336d1212a831b71'
            '3b546e8dd8f7ef3a1025d7d59ed8187fa21a9b9cf839a9bbda9821733da046e1'
            '78b9b6a30ab53f55407b873cbc23df3a129dcd22a2d55557b9e7ac3dc13b8c19'
            'f1a8a318f210cfc3814d234cb98a3de0c7a161c0e0c5671fe1c266ee03e351ec'
            'a13fb767cbd142100e8020aac5b0f091f50a42602768665b8e2595f74fa31c4d'
            'be383447b74cf9b86666adeaf35f844b394c222abbcda7f5cd7fc64f79373b82'
            'fc94245b58b23c9498a10c64aed20b6120595c6c3e1412bb419126ca78123a94'
            'a4c261f5754b380ff85c454249a152cb67baf9bbf10dc95cd16026f90bacb620'
            'faf52cf982eaa66a475344a5647a80a761d10402ccb9de263c70dc15ccc85c29'
            '47b48ab7fa15ae9226463c98d6c8fce9ee9b602c3a9f96907fcd84e50902b2cc')

prepare() {
  set -u
  cd "${_srcdir}"

  # Clean outdated info from help files
  #cp -rp "../${_srcdir}"{,.orig}; echo "diff -Naru3 ${_srcdir}{.orig,} > 'new-0000-lprng-help-website.patch'"; false
  patch -Nup1 -i "${srcdir}/0000-lprng-help-website.patch"
  sed -e 's:/var/spool/LPD:/var/spool/lpd:g' -i 'man/lpd.n'

  # Clean up sbin
  sed -e 's:/usr/local/sbin/:/usr/bin/:g' -i $(grep -lrFe '/usr/local/sbin/' .)
  sed -e 's:/usr/sbin/:/usr/bin/:g' -i $(grep -lrFe '/usr/sbin/' .)
  sed -e '/FILTER_PATH/ s@/usr/sbin:@@g' -i 'src/vars.c'

  # Clean up /usr/local
  sed -e 's:/usr/local/libexec/:/usr/lib/:g' -i $(grep -lrFe '/usr/local/libexec/' .)
  sed -e 's:/usr/local/bin:/usr/bin:g' -i $(grep -lrFe '/usr/local/bin' .)
  sed -e 's:/usr/local/:/usr/:g' -i 'src/pclbanner.in'

  # Fix ifhp path in printcap
  sed -e 's:/usr/libexec/filters/ifhp:/usr/lib/filters/ifhp:g' -i 'conf/printcap'

  # Check filters
  local _f
  for _f in "${srcdir}"/*filter; do
    bash -n "${_f}"
  done
  set +u
}

build() {
  set -u
  cd "${_srcdir}"

  if [ ! -s 'Makefile' ]; then
    local _conf=(
      -q
      --libexecdir='/usr/lib/lprng'
      --localstatedir='/var'
      --mandir='/usr/share/man'
      --sbindir='/usr/bin'
      --sysconfdir="${_printcap%/*}"
      --with-groupid='lp'
      --with-spooldir="${_spooldir}"
      --with-userid='daemon'
      --prefix='/usr'
    )
    local _lf=''
    local _cf=' -Wno-unused-result -s'
    if [ "${_opt_SSL10}" -ne 0 ]; then
      _cf+=' -I/usr/include/openssl-1.0'
      _lf+=' -L/usr/lib/openssl-1.0'
      _conf+=(--enable-ssl)
    fi
    set -x
    CFLAGS="${CFLAGS}${_cf}" \
    LDFLAGS="${LDFLAGS}${_lf}" \
    ./configure "${_conf[@]}"
    set +x
  fi
  set -x
  make -s # -j"$(nproc)"
  set +x
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 MAKEPACKAGE='YES' DESTDIR="${pkgdir}" install
  install -Dpm0644 'COPYRIGHT' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  cat >> "${pkgdir}${_printcap}.sample" << EOF
#
# Printer names are case preserving and case insensitive.
# Do not make two printers same letters different case.
# If you do the last one will be used.
#
EOF
  cd "${srcdir}"

  install -d "${pkgdir}${_spooldir}"
  install -Dpm0644 'lpd.service' "${pkgdir}/usr/lib/systemd/system/${_service}"
  install -Dpm0755 'foofilter' 'gsfilter' 'psfilter' -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm0644 'printcap_remote' 'printcap_server' 'README' -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm0644 'lpd.conf' 'lpd.perms' -t "${pkgdir}/etc/lprng/lpd/"
  install -Dpm0644 /dev/null "${pkgdir}${_printcap}"

  # Change spool dir
  if [ "${_spooldir}" != '/var/spool/lpd' ]; then
    sed -e "s:/var/spool/lpd:${_spooldir}:g" \
      -i "${pkgdir}/usr/share/doc/${pkgname}/"{'printcap_remote','printcap_server'} \
         "${pkgdir}/etc/lprng/printcap.sample" \
         "${pkgdir}/etc/lprng/lpd"/*.sample \
         $(grep -lrFe '/var/spool/lpd' "${pkgdir}/usr/share/man")
  fi

  # Make documentation easy to find
  ln -s "/usr/share/doc/${pkgname}" "${pkgdir}/etc/lprng/lpd/doc"

  local _cdir="usr/lib/${pkgname}/cups" # This must be deleted when changing to _primarylpr=0
  local _scriptdir="/usr/share/${pkgname}"
  local _script="${_scriptdir}/${pkgname}.sh"

  # Generate amended install
  bash -n "${startdir}/${install}" || echo "${}"
  true && install="${install}.pkg"
  rm -f "${startdir}/${install}"
  cat - <<<"
# Do not modify this copy

_printcap='${_printcap}'
_service='${_service}'
_postinst='${_script}' # secondary needs this to clean up afer a primary -> secondary switch
_primarylpr='${_primarylpr}' # This is a post-upgrade setting sent to the pre-upgrade script
_cdir='${_cdir}'

" "${startdir}/${install%.pkg}" > "${startdir}/${install}"
  bash -n "${startdir}/${install}" || echo "${}"

  # Produce suffix cups or suffix lprng
  if [ ! -z "${_sfx}" ]; then
    if [ "${_primarylpr}" -ne 0 ]; then
      pushd "${pkgdir}/usr/bin"
      # Overwrite hard links with soft links
      ln -sf 'lpr' 'lp'
      ln -sf 'lprm' 'cancel'
      local _ldir="usr/lib/${pkgname}/lprng"
      local _cdir="usr/lib/${pkgname}/cups"
      # folders to store conflicting lprng and cups files
      install -d "${pkgdir}/${_ldir}"/{usr/bin,/usr/share/man/{man1,man8}}
      # There's no way to do this without this folder of untracked files.
      install -d "${pkgdir}/${_cdir}"/{usr/bin,/usr/share/man/{man1,man8}}
      local _f
      for _f in "${_bins[@]}"; do
        mv "${_f}" "${pkgdir}/${_ldir}/usr/bin"
        touch "${_f}${_sfx}"
      done
      local _zipmanlpr='.gz' # These need to be the same or cups will show untracked files
      local _zipmancups='.gz'
      cd "${pkgdir}/usr/share/man"
      for _f in "${_mans[@]}"; do
        mv "${_f}" "${pkgdir}/${_ldir}/usr/share/man/${_f}"
        touch "${_f/./${_sfx}.}${_zipmancups}"
      done
      popd > /dev/null

      # Generate install helper script.
      install -Dpm644 <(cat << EOF
#!/bin/sh

# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

set +e
set -u

_opt_q=''

$(declare -p _bins)
$(declare -p _mans)
_zipmancups='${_zipmancups}'
_zipmanlpr='${_zipmanlpr}'
_sfx='${_sfx}'
_ldir='${_ldir}'
_cdir='${_cdir}'
_primarylpr='${_primarylpr}'

if [ "\${EUID}" -eq 0 ]; then
  #_echo=''
  _tp='/'
  #_true='true '
else
  #_echo=''
  _tp='../../../'
  #_true=''
fi

# -t to generate cups test files, test option only
# -c to install/upgrade cups
# -l to post-install lprng
# -p to pre-upgrade lprng
# -u to post-upgrade lprng
# -r to pre-remove lprng

# Generate fake CUPS files in system folders
# This only works in the test folder. It is never called from the .install
_fn_gen_cups() {
  if [ "\${EUID}" -ne 0 ]; then
    local _f _c1 _c1 _c2
    for _f in "\${_bins[@]}"; do
      _c1="\${_tp}usr/bin/\${_f}"
      rm -f "\${_c1}"
      dd if=/dev/urandom of="\${_c1}" bs=512 count=1 2> /dev/null
    done
    for _f in "\${_mans[@]}"; do
      _c1="\${_tp}usr/share/man/\${_f}\${_zipmancups}"
      rm -f "\${_c1}"
      dd if=/dev/urandom of="\${_c1}" bs=512 count=1 2> /dev/null
    done
  fi
}

# Copy cups files from system folders to _cdir with original names
_fn_store_cups() {
  local _f _c1 _c2
  for _f in "\${_bins[@]}"; do
    _c1="\${_tp}usr/bin/\${_f}"
    _c2="\${_tp}\${_cdir}/usr/bin/\${_f}"
    cp -pf "\${_c1}" "\${_c2}"
  done
  for _f in "\${_mans[@]}"; do
    _c1="\${_tp}usr/share/man/\${_f}\${_zipmancups}"
    _c2="\${_tp}${_cdir}/usr/share/man/\${_f}\${_zipmancups}"
    cp -pf "\${_c1}" "\${_c2}"
  done
}

# Copy cups files to system folders with modified names
_fn_cp_cups() {
  local _f _c1 _c2
  for _f in "\${_bins[@]}"; do
    _c1="\${_tp}usr/bin/\${_f}\${_sfx}"
    _c2="\${_tp}\${_cdir}/usr/bin/\${_f}"
    cp -pf --remove-destination "\${_c2}" "\${_c1}"
  done
  for _f in "\${_mans[@]}"; do
    _c1="\${_tp}usr/share/man/\${_f/./\${_sfx}.}\${_zipmancups}"
    _c2="\${_tp}${_cdir}/usr/share/man/\${_f}\${_zipmancups}"
    cp -pf --remove-destination "\${_c2}" "\${_c1}"
  done
}

# Erase modified name cups files in system folders
# This prevents .pacsave files
_fn_rm_cups() {
  local _f _c1 _c2
  for _f in "\${_bins[@]}"; do
    _c1="\${_tp}usr/bin/\${_f}\${_sfx}"
    rm "\${_c1}"
  done
  for _f in "\${_mans[@]}"; do
    _c1="\${_tp}usr/share/man/\${_f/./\${_sfx}.}\${_zipmancups}"
    rm "\${_c1}"
  done
}

# Erase lprng files with original cups names in system folders.
# cp -f isn't erasing our soft links leading to cups lp -> lpr which isn't correct.
# cp --remove-destination fixed this
_fn_rm_lprng_cups() {
  local _f _c1 _c2
  for _f in "\${_bins[@]}"; do
    _c1="\${_tp}usr/bin/\${_f}"
    rm "\${_c1}"
  done
  for _f in "\${_mans[@]}"; do
    _c1="\${_tp}usr/share/man/\${_f}\${_zipmancups}"
    rm "\${_c1}"
  done
}

# Erase original name cups files in _cdir
_fn_rm_cups_store() {
  rm -rf "\${_tp}\${_cdir}/usr"
}

# Copy cups files to system folders with original names
_fn_cp_cups_u() {
  cp -dprf --remove-destination "\${_tp}${_cdir}/." "\${_tp}/"
}

# Copy original name lpr files to system folders
_fn_cp_lpr() {
  cp -dprf --remove-destination "\${_tp}${_ldir}/." "\${_tp}/"
}

while getopts 'qtclp:u:r' opt; do
  case "\${opt}" in
  q) _opt_q='true ';;
  t) _fn_gen_cups;;
  c)
    \${_opt_q} echo 'lprng: update cups'
    _fn_store_cups
    _fn_cp_lpr
    _fn_cp_cups
    ;;
  l)
    \${_opt_q} echo 'lprng: post-install lprng'
    _fn_store_cups
    _fn_cp_lpr
    _fn_cp_cups
    ;;
  p)
    \${_opt_q} echo 'lprng: pre-upgrade lprng'
    #_fn_rm_lprng_cups
    _fn_rm_cups
    _fn_cp_cups_u
    if [ "\${OPTARG}" -eq 0 ] && [ "\${_primarylpr}" -ne 0 ]; then
      \${_opt_q} echo 'lprng: pre-upgrade remove cups store changing from primary to secondary'
      _fn_rm_cups_store
    fi
    ;;
  u)
    \${_opt_q} echo 'lprng: post-upgrade lprng'
    #This is *post* upgrade so we can't use the same method as pre-upgrade unless we pass forward the pre-upgrade _primarylpr
    if [ ! -x "\${_cdir}/usr/bin/lpr" ]; then
      \${_opt_q} echo 'lprng: post-upgrade add cups store changing from secondary to primary'
      _fn_store_cups
    fi
    _fn_cp_lpr
    _fn_cp_cups
    ;;
  r)
    \${_opt_q} echo 'lprng: pre-remove lprng'
    _fn_rm_cups
    _fn_cp_cups_u
    _fn_rm_cups_store
    ;;
  *) echo "Usage: \$0 [-c] [-l]"; exit 1 ;;
  esac
done
EOF
      ) "${pkgdir}${_script}"
      test -s "${pkgdir}${_script}" || echo "${}"
      bash -n "${pkgdir}${_script}" || echo "${}"

      # cups hook
      install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/
# Replace cups lpr tools with lprng tools
# cups tools are renamed
[Trigger]
Operation = Install
Operation = Upgrade
Type = Package
Target = cups
[Action]
Description = Replace cups binaries with lprng
Depends = coreutils
When = PostTransaction
Exec = /usr/bin/bash "${_script}" -q -c
EOF
      ) "${pkgdir}/usr/share/libalpm/hooks/${pkgname}-rename.hook"
    else
      # lpd doesn't conflict with cups
      #sed -e '/^ExecStart=/ s:lpd'":&${_sfx}:g" -i "${pkgdir}/usr/lib/systemd/system/${_service}"
      # Rename programs and change self references in man pages
      pushd "${pkgdir}/usr/bin" > /dev/null
      local _f _fx
      for _fx in "${_mans[@]}"; do
        _f="${_fx##*/}"
        _f="${_f%%.*}"
        mv "${_f}" "${_f}${_sfx}"
        sed -e "s:\b${_f}\b:&${_sfx}:g" \
            -e "1,2 s:\b${_f^^}\b:&${_sfx}:g" \
          -i "${pkgdir}/usr/share/man/${_fx}"
      done
      # Overwrite hard links with soft links
      ln -sf "lpr${_sfx}" "lp${_sfx}"
      ln -sf "lprm${_sfx}" "cancel${_sfx}"
      # Rename man pages.
      cd "${pkgdir}/usr/share/man"
      for _f in "${_mans[@]}"; do
        mv "${_f}" "${_f/./${_sfx}.}"
      done
      # Change references in man pages
      sed -e "#s:\blpd\( \?\)(:lpd${_sfx}\1(:g" \
          -e "s:\blpr\( \?\)(:lpr${_sfx}\1(:g" \
          -e "s:\blprm\( \?\)(:lprm${_sfx}\1(:g" \
          -e "s:\blpc\( \?\)(:lpc${_sfx}\1(:g" \
          -e "s:\blp\( \?\)(:lp${_sfx}\1(:g" \
          -e "s:\blpq\( \?\)(:lpq${_sfx}\1(:g" \
        -i */*
      sed -e "s:\blprm\b:&${_sfx}:g" \
          -e "s:\blpr\([ ,]\):lpr${_sfx}\1:g" \
          -e "#s:\blpd\([ ,)]\):lpd${_sfx}\1:g" \
          -e "s:\blpq\b:&${_sfx}:g" \
          -e "s:\blpc\b:&${_sfx}:g" \
        -i 'man5/printcap.5' 'man5/lpd.perms.5' 'man8/lpd.8'
      sed -e "/^\.I/ s:\blprm\b:&${_sfx}:g" \
          -e "/^\.I/ s:\blpr\([ ,]\):lpr${_sfx}\1:g" \
          -e "/^\.I/ s:\blpd\([ ,)]\):lpd${_sfx}\1:g" \
          -e "/^\.I/ s:\blpq\b:&${_sfx}:g" \
          -e "/^\.I/ s:\blpc\b:&${_sfx}:g" \
        -i "man8/lpc${_sfx}.8"
      sed -e "s:\blprm\b:&${_sfx}:g" -i "man1/cancel${_sfx}.1"
      popd > /dev/null
      # Change reference in printcap
      sed -e "s: checkpc\b: sudo&:g" \
          -e "s: lpc\b:&${_sfx}:g" \
        -i "${pkgdir}/etc/lprng/printcap.sample"
    fi
  fi

  # Check for unwanted folders
  ! grep -lrFe '/sbin' "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! grep -lrFe '/usr/local' "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  ! grep -lrFe '/libexec/' "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /libexec/"; false; }
  set +u
}
set +u
