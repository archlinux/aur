# Maintainer: Alexey Rychkov <dev at nightfog.net>

pkgname='simple-bcachefs-tools-git'
pkgver=r746.3785043
pkgrel=1
pkgdesc="BCacheFS filesystem utilities"
arch=('x86_64')
url="https://evilpiepirate.org/git/bcachefs-tools"
license=('GPL2')
depends=('util-linux-libs' 'libaio' 'keyutils' 'libsodium' 'liburcu' 'zstd' 'libscrypt')
makedepends=('git' 'python-docutils')
checkdepends=('python-pytest')
provides=('bcachefs-tools')
conflicts=('bcachefs-tools')
source=("${pkgname}::git+https://evilpiepirate.org/git/bcachefs-tools.git"
        "disable-initramfs-output.patch")
sha256sums=('SKIP'
            '3cd44455cee4638a650f2c7a4a00440b95efe819f43d20a7166012d074e855d4')

prepare() {
  cd "$pkgname"
  patch -Np1 < ../disable-initramfs-output.patch
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

check() {
  cd "$pkgname"
  make check PYTEST=pytest
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    ROOT_SBINDIR="/usr/bin" \
    INITRAMFS_DIR="/etc/initcpio" \
    install
}
