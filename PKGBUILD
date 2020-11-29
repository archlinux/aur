# Maintainer: Popolon <popolon@popolon.org>

pkgname=nodemcu-firmware-git
_pkgname=nodemcu-firmware
pkgver=2319.4f679277
pkgrel=1
pkgdesc="A Lua based firmware for ESP8266 WiFi SOC"
arch=('i686' 'x86_64')
url="https://github.com/nodemcu/nodemcu-firmware"
license=('MIT')
depends=('esptool')
#makedepends=()
optdepends=(esplorer nodemcu-pyflasher nodemcu-tool nodemcu-uploader-git)
source=("git+https://github.com/nodemcu/nodemcu-firmware.git")
sha256sums=(SKIP)

pkgver()
{
    cd "${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --recursive --init
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 luac.cross -t "${pkgdir}/usr/bin/"
  install -Dm755 uz_zip -t "${pkgdir}/usr/bin/"
  install -Dm755 uz_unzip -t "${pkgdir}/usr/bin/"
# use esptool package instead
#  install -Dm644 tools/toolchains/esptool.py -t "${pkgdir}/usr/bin/esptool.py"
  install -Dm644 bin/0x00000.bin -t "${pkgdir}/usr/share/${pkgname}/firmware/"
  install -Dm644 bin/0x10000.bin -t "${pkgdir}/usr/share/${pkgname}/firmware/"
  cp -a lua_examples -t "${pkgdir}/usr/share/${pkgname}/"
  cp -a lua_modules -t "${pkgdir}/usr/share/${pkgname}/"
  ln -s "/usr/share/doc/${pkgname}" "${pkgdir}/usr/share/${pkgname}/docs"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a docs/* "${pkgdir}/usr/share/doc/${pkgname}/"

 install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
