# Maintainer: James McMurray <jamesmcm03@gmail.com>
# Contributor: Roey Darwish Dror <roey.ghost@gmail.com>

pkgname="alma"
pkgver=0.12.0
pkgrel=1
pkgdesc='Create Arch Linux based live USB'
arch=('x86_64')
url='https://github.com/jamesmcm/alma-nv'
license=('GPL3')
makedepends=('git' 'rust' 'libssh2' 'openssl' 'cmake' 'pkg-config' 'zstd')
depends=('gptfdisk' 'parted' 'arch-install-scripts' 'dosfstools' 'coreutils' 'util-linux')
optdepends=('cryptsetup: for root filesystem encryption')
source=("$pkgname-nv-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
provides=('alma')
conflicts=('alma')
sha256sums=('508f2984dfdae312c697c14ec389e4ac9c9d19d668f25ba709905d67c6a42dbd')

build() {
  cd "$pkgname-nv-$pkgver"

  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  export OPENSSL_DIR=/usr
  export ZSTD_SYS_USE_PKG_CONFIG=0  # Force bundled zstd to avoid linking issues

  cargo build --release
}

package() {
  cd "$pkgname-nv-$pkgver"

  install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
