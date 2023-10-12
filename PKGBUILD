# Author:     Vladimir Menshakov <vladimir.menshakov@gmail.com>
# Maintainer: Martin Stibor <martin.von.reichenberg@proton.me>

pkgname=android-file-transfer
_pkgname=android-file-transfer-linux
pkgver=4.3
pkgrel=1
pkgdesc="Android File Transfer for Linux — a reliable MTP client with a minimalistic UI similar to official Android File Transfer. It just works."
arch=('any')
url="https://whoozle.github.io/android-file-transfer-linux/"
license=('GPL3')
depends=('qt5-base' 'file' 'glibc' 'gcc-libs' 'readline' 'fuse2' 'fuse-common' 'libxkbcommon-x11' 'hicolor-icon-theme' 'taglib' 'openssl' 'zlib')
makedepends=('base-devel' 'cmake' 'ninja')
conflicts=('android-file-transfer-linux-git')
source=("${_pkgname}-${pkgver}::https://github.com/MartinVonReichenberg/android-file-transfer-linux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
options=('!strip')

prepare() {
  cd "${srcdir}"/"${_pkgname}"-"${pkgver}"
  mkdir -p build
}

build() {
  cd "${srcdir}"/"${_pkgname}"-"${pkgver}/build"

  cmake -G Ninja ../ \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_EXE_LINKER_FLAGS=-Wl,-O1,--sort-common,-z,relro,-z,now

  ninja
}

package() {
  cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/build

  DESTDIR="${pkgdir}" ninja install all

  install -Dm644 ../LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
