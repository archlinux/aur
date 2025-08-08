# Maintainer: James McMurray <jamesmcm03@gmail.com>
# Contributor: Roey Darwish Dror <roey.ghost@gmail.com>

_pkgname="alma"
pkgname="alma-git"
pkgver=r126.71b046e
pkgrel=1
pkgdesc='Create Arch Linux based live USB'
arch=('x86_64')
url='https://github.com/jamesmcm/alma-nv'
license=('GPL3')
makedepends=('git' 'rust' 'libssh2' 'openssl' 'cmake' 'pkg-config' 'zstd')
depends=('gptfdisk' 'parted' 'arch-install-scripts' 'dosfstools' 'coreutils' 'util-linux')
optdepends=('cryptsetup: for root filesystem encryption')
source=("git+https://github.com/jamesmcm/alma-nv")
provides=('alma')
conflicts=('alma')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}-nv"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}-nv"

  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  export OPENSSL_DIR=/usr
  export ZSTD_SYS_USE_PKG_CONFIG=0  # Force bundled zstd to avoid linking issues

  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}-nv"

  install -Dm755 target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
