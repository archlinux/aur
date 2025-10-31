# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Bjoern Franke <bjo@nord-west.org>
# Contributor: egore911

pkgname=scmccid
pkgver=5.0.35
pkgrel=6
pkgdesc="Binary driver for the SCM smart card readers"
arch=(
  'i686'
  'x86_64'
)
url="https://www.scm-pc-card.de/driver"
license=('custom:Proprietary')
depends=(
  'glibc'
  'pcsclite'
  'libusb-compat'
)
makedepends=(
  'xxd'
)
backup=(
  "usr/lib/identiv/ini/${pkgname}.ini"
)
_pkgsrc="${pkgname}_${pkgver}_linux"
source_i686=("${pkgname}-${pkgver}-i686.tar.gz::https://www.scm-pc-card.de/file/driver/Readers_Writers/${_pkgsrc//-/_}_rel.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://www.scm-pc-card.de/file/driver/Readers_Writers/${_pkgsrc//-/_}_rel_64.tar.gz")
sha256sums_i686=('791a80a1eeee6544d32e1dcaddb7383e6566a89b6f4a97ce0565dd8f274def65')
sha256sums_x86_64=('4857f7402fb585909622020e1007c81d1ebc3c71574d6f1a993e03e5431331e4')

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
  cd "${srcdir}/${_pkgsrc}"
  sed -i 's|/usr/local/scm/ini|/usr/lib/identiv/ini|g' 'ReadmeFirst.txt'

  cd "proprietary/scmccid.bundle/Contents/Linux"
  _patch_strings_in_file libscmccid.so.* '/usr/local' '/usr/lib'
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${pkgname}.ini"  "${pkgdir}/usr/lib/identiv/ini/${pkgname}.ini"
  install -vDm644 "ReadmeFirst.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"

  cd "proprietary"
  local pcslite_usbdropdir="$(pkg-config libpcsclite --variable=usbdropdir)"
  install -vd "${pkgdir}${pcslite_usbdropdir}"
  cp -va --no-preserve=ownership ./*.bundle -t "${pkgdir}${pcslite_usbdropdir}"
  
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
