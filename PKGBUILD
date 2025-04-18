# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="sngrep"
pkgname="${_pkgname}-bin"
pkgver=1.8.2
pkgrel=2
pkgdesc="A tool for displaying SIP call message flows from a terminal"
arch=('i686' 'x86_64')
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
source_i686=("${_pkgsrc}-i686::https://packages.irontec.com/binaries/${_pkgname}-static-i386-linux-gnu-${pkgver}")
source_x86_64=("${_pkgsrc}-x86_64::https://packages.irontec.com/binaries/${_pkgname}-static-amd64-linux-gnu-${pkgver}")
md5sums=('c47c7c7383225ab55ff591cb59c41e6b'
         'd32239bcb673463ab874e80d47fae504'
         '3fd6ccca40ec9086a061ca221e5d375b'
         '5650c8a266261a831642112138129566')
md5sums_i686=('8f460d1e77e3f8578ab4d529f0d0d873')
md5sums_x86_64=('354b230c6c426973cbd289c8bedfd914')
sha256sums=('2b7814d3fca2e99e56c51b6ff2aa313ea6e9da6424804240aa8ad891fdfe0900'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903'
            'e5cf742a5051339c33d8c91c1a8ec7fa9f06ba2fba34a90d81847073e2be7e29'
            'e7eb8897f6facdaf67eb013b000f8f4443c86b19d29cb66aa8ad1b5e7ec2d633')
sha256sums_i686=('744ac6185b988aedb2c60981197fcdd27afa474905b794a99cb7fb2a5151aa2a')
sha256sums_x86_64=('89e3292e4a04d96d9f3ac74852b757019f5a4f76da991cc0493ab0261bd47c1c')

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
