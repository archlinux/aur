# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: 01189998819991197253 <dev.ben01189998819991197253+aur@gmail.com>
# Contributor: winlu <derwinlu AT gmail DOT com>

pkgname=soundsense
_pkgver="2016-1_196"
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="SoundSense is a sound-engine tool for Dwarf Fortress."
arch=("any")
url="http://df.zweistein.cz/soundsense/"
license=("custom")
install="soundsense.install"
depends=("java-runtime")
makedepends=("coreutils"
             "unzip")
source=("http://df.zweistein.cz/soundsense/soundSense_${_pkgver}.zip"
        "soundsense.install")
sha256sums=('4b8771e36b3ec6c36a7f5447b05638418636c0ae6e90049568737f999f3f0850'
            'fe554352d1224146736ded6e3bcf3319c286291828b192c9727cd185e0bd74c6')

DEST="/opt/soundsense"

prepare() {
  cd "${srcdir}/${pkgname}"

  # fix line breaks
  sed -i $'s/\r$//' soundSense.sh
  # set correct working dir
  sed -i 's:${0\%/\*}:'"${DEST}"':' soundSense.sh

  unzip -q -o packSkeletons.zip
}

package() {
  # install runner
  install -Dm755 "${srcdir}/${pkgname}/soundSense.sh" "${pkgdir}/usr/bin/soundsense"
  # rm unneeded files
  rm "${srcdir}/${pkgname}/"*.{cmd,exe,zip,sh}
  # copy over and set permissions
  install -dm755 -o root -g games "${pkgdir}${DEST}"
  cp -r "${srcdir}/${pkgname}/." "${pkgdir}${DEST}"
  chown root:games -R "${pkgdir}${DEST}"
  find "${pkgdir}${DEST}/" -type d -exec chmod 6775 {} +
  find "${pkgdir}${DEST}/" -type f -exec chmod 664 {} +
}

