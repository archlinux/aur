# Maintainer: agony <27015 at riseup dot net>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="sngrep"
pkgname="${_pkgname}-bin"
pkgver=1.9.0
pkgrel=1
pkgdesc="A tool for displaying SIP call message flows from a terminal"
arch=('x86_64')
url="https://github.com/irontec/${_pkgname}"
license=('GPL-3.0-or-later')
makedepends=('xxd')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}/${_pkgname}rc")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgsrc}.man.8::${url}/raw/refs/tags/v${pkgver}/doc/${_pkgname}.8"
        "${_pkgsrc}-${_pkgname}rc::${url}/raw/refs/tags/v${pkgver}/config/${_pkgname}rc")
source_x86_64=("${_pkgsrc}-x86_64::https://packages.irontec.com/binaries/${_pkgname}-static-amd64-linux-gnu-${pkgver}")
sha256sums=('2b7814d3fca2e99e56c51b6ff2aa313ea6e9da6424804240aa8ad891fdfe0900'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903'
            '2b3630e53485f63bc976776ecbcbd2e6f700c93ee38dca691a129e1986271ad9'
            '55312b67d560ad9e8685f53a637c976a1253acf767798aba05a091a5fe86f439')
sha256sums_x86_64=('83f7489d88113ee730cb30b1b4ad5e09dc4041fcf507b6da340957955e8358f9')

# https://everydaywithlinux.blogspot.com/2012/11/patch-strings-in-binary-files-with-sed.html
_patch_strings_in_file() {
  local FILE="$1"
  local PATTERN="$2"
  local REPLACEMENT="$3"
  
  STRINGS=$(strings ${FILE} | grep ${PATTERN} | sort -u -r)
  if [ "${STRINGS}" != "" ] ; then
    echo "Patching file '${FILE}'"
    for OLD_STRING in ${STRINGS} ; do
      NEW_STRING=${OLD_STRING//${PATTERN}/${REPLACEMENT}}
      OLD_STRING_HEX="$(echo -n "${OLD_STRING}" | xxd -g 0 -u -ps -c 256 | tr -d '\n')"
      NEW_STRING_HEX="$(echo -n "${NEW_STRING}" | xxd -g 0 -u -ps -c 256 | tr -d '\n')"
      if [ ${#NEW_STRING_HEX} -le ${#OLD_STRING_HEX} ] ; then
        while [ ${#NEW_STRING_HEX} -lt ${#OLD_STRING_HEX} ] ; do
          NEW_STRING_HEX="${NEW_STRING_HEX}00"
        done
        echo -n "Replacing ${OLD_STRING} with ${NEW_STRING}... "
        hexdump -ve '1/1 "%.2X"' ${FILE} | \
          sed "s/${OLD_STRING_HEX}/${NEW_STRING_HEX}/g" | \
          xxd -r -p > ${FILE}.tmp
        chmod --reference ${FILE} ${FILE}.tmp
        mv ${FILE}.tmp ${FILE}
        echo "Done!"
      else
        echo "New string '${NEW_STRING}' is longer than old string '${OLD_STRING}'. Skipping."
      fi
    done
  fi
}

prepare() {
  cd "${srcdir}"
  _patch_strings_in_file "${_pkgsrc}-${CARCH}" "/usr/local/etc/${_pkgname}rc" "/etc/${_pkgname}/${_pkgname}rc"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.man.8" "${pkgdir}/usr/share/man/man8/${_pkgname}.8"
  install -vDm644 "${_pkgsrc}-${_pkgname}rc" "${pkgdir}/etc/${_pkgname}/${_pkgname}rc"
}
