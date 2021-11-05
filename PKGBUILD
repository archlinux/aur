# Maintainer: Alexey Rychkov <dev at nightfog.net>

pkgname='simple-bcachefs-tools-git'
pkgver=r795.e87deba
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
            '0161fa749e588e353babbde0bec53f80c822658238e116655e03b4125343e6b2')

prepare() {
  cd "$pkgname"
  patch -Nlp1 < ../disable-initramfs-output.patch
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make PYTEST_CMD=pytest
}

check() {
  cd "$pkgname"
  make check PYTEST_CMD=pytest
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    ROOT_SBINDIR="/usr/bin" \
    INITRAMFS_DIR="/etc/initcpio" \
    PYTEST_CMD=pytest \
    install
}
