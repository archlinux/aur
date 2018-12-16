# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: David Raymond <raymond at kestrel dot nmt dot edu>
# Contributor: Alex Suykov <axs at ukr dot net>
# Contributor: Frank Thieme <frank at fthieme dot net>

# TODO: Did I miss references or fix too many in man pages.
# TODO: Fix lpc [lpd|lpq|lprm] and other internal usages? These run the CUPS executables.
# TODO: Improve instructions for LPR only support for brand name printers.
# TODO: We shouldn't be the ones to rename the binaries. Upstream should implement EXEEXT.
# TODO: Are there better versions of these old filters?

_opt_SSL10=1

# Need: Web based printcap editor, LPInfo?

# https://github.com/apple/cups/issues/5269

# CUPS plans to drop '-o raw' support. raw 9100 is the *only* useful
# way to print for a large swath of industrial printers, Zebra label
# printers in particular for which the ZPL and EPL print software will never
# be rewritten to output a CUPS compatible format.
# CUPS is needed for a large swath of WinPrinters
# and for automatic printing of PCL, PXL, PostScript and PDF. Neither
# raw nor CUPS is going away so I fixed lprng to coexist with CUPS.

# Gentoo solves this with a use flag that leaves out the lpr binaries from the cups package
# https://packages.gentoo.org/useflags/lprng-compat
# Debian/Ubuntu solves this with the conflicting binaries in a separate cups-bsd package.

# printcap is also a lot easier to manage than CUPS. Text FTW!

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

_sfx='ng' # sources contain EXEEXT but I couldn't get it to do anything.
_spooldir='/var/spool/lpd'
_printcap='/etc/lprng/printcap'
_service='lpd.service'

set -u
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
    'cups: standard BSD binaries lp lpr lpq'
    'lprng: install this instead for standard BSD binaries lp lpr lpq without cups'
  )
else
  conflicts=('cups')
fi
backup=(
  'etc/lprng/lpd/lpd.conf'
  'etc/lprng/lpd/lpd.perms'
  "${_printcap#/}"
)
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

# We can't modify .install but we can stop and force the user to fix it.
_install_check() {
  local _ckvar
  local _ckline
  local _pkgname="${pkgname}"
  for _ckvar in '_service' '_printcap'; do
    _ckline="${_ckvar}='${!_ckvar}'"
    if ! grep -q "^${_ckline}"'$' "${startdir}/${install}"; then
      msg "${install} must be fixed"
      echo "${_ckline}"
      set +u
      false
    fi
  done
}

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
  _install_check
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
  make -s
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

  if [ ! -z "${_sfx}" ]; then
    # lpd doesn't conflict with cups
    #sed -e '/^ExecStart=/ s:lpd'":&${_sfx}:g" -i "${pkgdir}/usr/lib/systemd/system/${_service}"
    # Rename programs and change self references in man pages
    local _moveem=(
      'man1/cancel.1'
      'man1/lp.1'
      'man1/lpq.1'
      'man1/lpr.1'
      'man1/lprm.1'
      'man1/lpstat.1'
      'man8/lpc.8'
    )
    pushd "${pkgdir}/usr/bin" > /dev/null
    local _f _fx
    for _fx in "${_moveem[@]}"; do
      _f="${_fx##*/}"
      _f="${_f%%.*}"
      mv "${_f}" "${_f}ng"
      sed -e "s:\b${_f}\b:&${_sfx}:g" \
          -e "1,2 s:\b${_f^^}\b:&${_sfx}:g" \
        -i "${pkgdir}/usr/share/man/${_fx}"
    done
    # Overwrite hard links with soft links
    ln -sf "lpr${_sfx}" "lp${_sfx}"
    ln -sf "lprm${_sfx}" "cancel${_sfx}"
    popd > /dev/null
    # Rename man pages.
    pushd "${pkgdir}/usr/share/man" > /dev/null
    for _f in "${_moveem[@]}"; do
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
      -i 'man8/lpcng.8'
    sed -e "s:\blprm\b:&${_sfx}:g" -i 'man1/cancelng.1'
    popd > /dev/null
    # Change reference in printcap
    sed -e "s: checkpc\b: sudo&:g" \
        -e "s: lpc\b:&${_sfx}:g" \
      -i "${pkgdir}/etc/lprng/printcap.sample"
  fi

  # Check for unwanted folders
  ! grep -lrFe '/sbin' "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! grep -lrFe '/usr/local' "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  ! grep -lrFe '/libexec/' "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /libexec/"; false; }
  set +u
}
set +u
