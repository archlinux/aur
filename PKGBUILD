# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: 01189998819991197253 <dev.ben01189998819991197253+aur@gmail.com>
# Contributor: winlu <derwinlu AT gmail DOT com>

pkgname=soundsense
_pkgver=2016-1_196
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc='A sound-engine tool for Dwarf Fortress'
arch=(any)
url='http://df.zweistein.cz/soundsense'
license=()
install=soundsense.install
depends=(java-runtime bash)
makedepends=(
  coreutils
  dos2unix
  unzip
)
source=(
  "http://df.zweistein.cz/soundsense/soundSense_${_pkgver}.zip"
  soundsense.tmpfiles
)
sha256sums=('4b8771e36b3ec6c36a7f5447b05638418636c0ae6e90049568737f999f3f0850'
            'a427bbd72061139654d6e14832c0a664657d98519705fa5a5544fb2b16326c56')

DEST='/opt/soundsense'

prepare() {
  cd "${pkgname}"

  # fix line breaks
  dos2unix soundSense.sh
  # set correct working dir
  sed -i 's:${0\%/\*}:'"${DEST}"':' soundSense.sh

  unzip -q -o packSkeletons.zip
}

package() {
  # install runner
  install -Dm755 "${srcdir}/${pkgname}/soundSense.sh" "${pkgdir}/usr/bin/soundsense"

  # rm unneeded files
  rm "${pkgname}/"*.{cmd,exe,zip,sh}

  # copy over and set permissions
  install -dm755 "${pkgdir}${DEST}"
  cp -dr "${pkgname}/." "${pkgdir}${DEST}"

  install -Dm644 "soundsense.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/soundsense.conf"
}
