# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Libernux <dutchman55@gmx.com>

set -u
pkgname='brother-dcp135c'
pkgver='1.0.1'
pkgrel='1'
pkgdesc="LPR and CUPS driver for the Brother DCP135C"
arch=('i686' 'x86_64')
url='http://solutions.brother.com/linux/en_us/'
license=('custom:brother commercial license')
depends=('cups')
depends_x86_64=('lib32-glibc')
options=('!strip')
source=(
  "http://www.brother.com/pub/bsc/linux/dlf/dcp135clpr-${pkgver}-${pkgrel}.i386.rpm"
  "http://www.brother.com/pub/bsc/linux/dlf/dcp135ccupswrapper-${pkgver}-${pkgrel}.i386.rpm"
  '0001-Brother-BRDocument-Extras.patch'
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
md5sums=('395026a5438b03be521d309f38b4132b'
         '82477f63f298bca32374450de6393270'
         '68905bfd1200f23090cff7838be4f697'
         '97ad0cffd216059e9d1d3121899d8646'
         '5e87a3dc0f3e3438c088eda0f3565f0d')
sha256sums=('aab731af656be017042d5f934d99fa5592e86db8b4141cfd5a614a0b6d3122de'
            '327b3b0d443b1dcb6facabb47e84be0883125166fba6c2e95635a526de0f2639'
            'fed3534b802b622b2e54ef929aae4a899c6737ed00ef6a15e35a879a143dc609'
            '2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
            '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67')

build() {
  set -u

  # do not install in '/usr/local'
  if [ -d "${srcdir}/usr/local/Brother" ]; then
    install -d "${srcdir}/usr/share"
    mv "${srcdir}/usr/local/Brother/" "${srcdir}/usr/share/brother"
    rm -rf "${srcdir}/usr/local"
    sed -e 's|/usr/local/Brother|/usr/share/brother|g' -i $(grep -lre '/usr/local/Brother' ./)
  fi

  # setup cups-directories
  install -d "${srcdir}/usr/share/cups/model"
  install -d "${srcdir}/usr/lib/cups/filter"

  # go to the cupswrapper directory and find the source file from wich to generate a ppd- and wrapper-file
  cd "$(find . -type 'd' -name 'cupswrapper')"
  local _wrapper_source=(cupswrapper*)
  if [ "${#_wrapper_source[@]}" -eq 1 ]; then
    _wrapper_source="${_wrapper_source[0]}"
    sed -e '/^\/etc\/init.d\/cups/d' \
        -e '/^sleep/d' \
        -e '/^lpadmin/d' \
        -e 's|/usr|${srcdir}/usr|g' \
        -e 's|/opt|${srcdir}/opt|g' \
        -e 's|/model/Brother|/model|g' \
        -e 's|lpinfo|echo|g' \
        -e 's| \$errorcode| \\$errorcode|g' \
        -e "/grep 'Nup=/"' s|`|\\&|g' \
      -i "${_wrapper_source}"
    srcdir="${srcdir}" \
    sh -x -e -u "./${_wrapper_source}" -i
    rm "${_wrapper_source}"
    cd "${srcdir}"
    local _lpdwrapper=('usr/lib/cups/filter'/*lpdwrapper*)
    if [ "${#_lpdwrapper[@]}" -eq 1 ]; then
      _lpdwrapper="${_lpdwrapper[0]}"
      sed -e 's|${srcdir}||' \
          -e "s|${srcdir}||" \
        -i "${_lpdwrapper}"

      local _ppd=(usr/share/cups/model/*.ppd)
      if [ "${#_ppd[@]}" -eq 1 ]; then
        _ppd="${_ppd[@]}"
        #cp -p "${_ppd}"{,.orig}; false
        # diff -pNau5 brdcp135c.ppd{.orig,} > '0001-Brother-BRDocument-Extras.patch'
        patch -d 'usr/share/cups/model' -Nup0 -i "${srcdir}/0001-Brother-BRDocument-Extras.patch"
      fi
    fi
  fi
  cd "${srcdir}"

  # /etc/printcap is managed by cups
  rm "$(find "${srcdir}" -type 'f' -name 'setupPrintcap*')"
  set +u
}

package() {
  set -u
  cp -pR "${srcdir}/usr" "${pkgdir}"
  if [ -d "${srcdir}/opt" ]; then
    cp -pR "${srcdir}/opt" "${pkgdir}"
  fi
  install -Dpm644 'cupswrapper-license.txt' 'lpr-license.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
