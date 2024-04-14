# Author:     Vladimir Menshakov <vladimir.menshakov@gmail.com>
# Maintainer: Martin Stibor <martin.von.reichenberg@proton.me>

pkgname=android-file-transfer-linux
pkgver=4.3
pkgrel=4
pkgdesc="A reliable MTP client with a minimalistic UI similar to official Android File Transfer by Google. It just works."
arch=('any')
url="https://whoozle.github.io/android-file-transfer-linux/"
license=('GPL3')
depends=('qt6-base' 'file' 'glibc' 'gcc-libs' 'readline' 'fuse2' 'fuse-common' 'libxkbcommon-x11'
         'hicolor-icon-theme' 'hidapi' 'android-udev' 'libudev0-shim' 'taglib' 'openssl' 'zlib')
makedepends=('base-devel' 'qt6-tools' 'cmake' 'ninja')
provides=('android-file-transfer' 'aft-mtp-cli' 'aft-mtp-mount')
conflicts=('android-file-transfer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whoozle/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build/"
}

build() {
  cmake -S "${srcdir}/${pkgname}-${pkgver}/" \
        -B "${srcdir}/${pkgname}-${pkgver}/build/" \
        -G Ninja -DCMAKE_INSTALL_PREFIX="/usr/" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects" \
        -DCMAKE_EXE_LINKER_FLAGS=-Wl,-O1,--sort-common,-z,relro,-z,now

  ninja -C "${srcdir}/${pkgname}-${pkgver}/build/" all
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}/${pkgname}-${pkgver}/build/" install

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/bin/android-file-transfer" "${pkgdir}/usr/bin/android-file-transfer-linux"
}
