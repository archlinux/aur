# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: David Raymond <raymond at kestrel dot nmt dot edu>
# Contributor: Alex Suykov <axs at ukr dot net>
# Contributor: Frank Thieme <frank at fthieme dot net>

_primarylpr=2 # see lprng-cups
# 2 - lprng binaries, original package, does not coexist with cups

_spooldir='/var/spool/lpd'
_printcap='/etc/lprng/printcap'
_service='lpd.service'

set -u
pkgname='lprng'
pkgver='3.9.0'
pkgrel='1'
pkgdesc='an enhanced, extended, and portable implementation of the Berkeley LPR lpd print spooler'
arch=('i686' 'x86_64' 'armv6h')
#url="http://www.lprng.com"
url='https://lprng.sourceforge.net'
license=('custom:Artistic')
depends=('glibc' 'bash' 'file' 'grep' 'sed')
optdepends=(
  'poppler: pdf to ps conversion in filters (gsfilter)' # formerly xpdf
  'ghostscript: convert ps to device language in filters (gsfilter)'
  'enscript: text to ps conversion in filters (gsfilter,psfilter)'
  'foomatic-filters-lprng: foomatic-rip in filters (foofilter)'
  'hplip: drivers for HP printers'
  'ifhp: filters for many printers'
)
  conflicts=('cups')
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
  #'0000-lprng-help-website.patch' # Clean outdated info from help files
  '0001-hardlink-to-symlink-binaries.patch'
  '0002-openssl_1.1.patch' # https://sources.debian.org/data/main/l/lprng/3.8.B-7/debian/patches/openssl_1.1.patch
  '0003-lpc-lpq-lprm-suffix.manual.patch'
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
md5sums=('10f4ec823df0e021404284037138aa8a'
         '08fbfe9aac9aebdd88f71afc557b5e68'
         'c8f1ae4eefe6b82d9097f095ab1557c8'
         '06db650ad6f5704e7a177bae23500977'
         'a59c448b0e37db80422175b7a1a2c304'
         'ce6f32b57a8e650f610523a6afaaf659'
         'd6c523f275bb63f68bf17d5ca02e4814'
         '1fa86ca79140bed23d59a552ac2d39b2'
         '496dfbb160f2a0308b7847541b03c8db'
         '422ad79bda6ae9d2990fdef55240e569'
         '1768d2f81d6d14c22686293ca60528c1'
         '3ef9f91dc0de273da1f5f1b20d49cd17'
         '3f861c75c2d68c0e45b4095ab39ba1c8')
sha256sums=('c92597671f4c7cbe8bb3f38fbc4283354db84c6abff1efb675fa2e120421915d'
            '96828bce13d6548a02e1d9849e713c950312b5c38c2282f2c5cfc5be454c6784'
            '269d2fdd0bbef11aa933cd4d49c06a44ce227badeec2530f199b185c7bd7f4f7'
            'd071adace21df32507d69c908851dc94511f404ecea4095bcdbb7d8504d97241'
            '3b546e8dd8f7ef3a1025d7d59ed8187fa21a9b9cf839a9bbda9821733da046e1'
            'c6a696dea62f7ffdade6a3071d201d076ee81e4aa14283dd4072578665e5eb7a'
            'f1a8a318f210cfc3814d234cb98a3de0c7a161c0e0c5671fe1c266ee03e351ec'
            'ce83b23dd188876b0b66de70f8b13d12036ba2ec1b837212bce6a172308904d4'
            'be383447b74cf9b86666adeaf35f844b394c222abbcda7f5cd7fc64f79373b82'
            'fc94245b58b23c9498a10c64aed20b6120595c6c3e1412bb419126ca78123a94'
            'a4c261f5754b380ff85c454249a152cb67baf9bbf10dc95cd16026f90bacb620'
            'faf52cf982eaa66a475344a5647a80a761d10402ccb9de263c70dc15ccc85c29'
            '47b48ab7fa15ae9226463c98d6c8fce9ee9b602c3a9f96907fcd84e50902b2cc')

prepare() {
  set -u
  cd "${_srcdir}"

  local _f
  for _f in "${source[@]}"; do
    _f="${_f%%::*}"
    _f="${_f##*/}"
    if [[ "${_f}" = *.manual.patch ]]; then
      if [ "${_primarylpr}" -eq 0 ]; then
        set +u; msg2 "Patch ${_f}"; set -u
        patch -Nup1 -i <(sed -E -e "s:@SUFFIX@:${_sfx}:g" "${srcdir}/${_f}")
      fi
    elif [[ "${_f}" = *.patch ]]; then
      set +u; msg2 "Patch ${_f}"; set -u
      patch -Nup1 -i "${srcdir}/${_f}"
    fi
  done
  #cd ..; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cd "${_srcdir}"; false
  #diff -pNaru5 'a' 'b' > '0000-new.patch'

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
    local _cf=' -Wno-unused-result -s -fcommon'
      _conf+=(--disable-ssl)
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
    rm "${pkgdir}/usr/bin"/*certs "${pkgdir}/usr/share/man/man1"/*certs*
  install -Dpm0644 'lpd.service' "${pkgdir}/usr/lib/systemd/system/${_service}"
  install -Dpm0755 'foofilter' 'gsfilter' 'psfilter' -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm0644 'printcap_remote' 'printcap_server' 'README' -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm0644 'lpd.conf' 'lpd.perms' -t "${pkgdir}/etc/lprng/lpd/"
  install -Dpm0644 /dev/null "${pkgdir}${_printcap}"

  # Make documentation easy to find
  ln -s "/usr/share/doc/${pkgname}" "${pkgdir}/etc/lprng/lpd/doc"

  # Check for unwanted folders
  ! grep -lrFe '/sbin' "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! grep -lrFe '/usr/local' "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  ! grep -lrFe '/libexec/' "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /libexec/"; false; }
  set +u
}
set +u
