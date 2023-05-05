# Maintainer: Alexey Rychkov <dev at nightfog.net>

pkgname='simple-bcachefs-tools-git'
pkgver=r1053.6b1f79d
pkgrel=1
pkgdesc="BCacheFS filesystem utilities"
arch=('x86_64')
url="https://evilpiepirate.org/git/bcachefs-tools"
license=('GPL2')
depends=('util-linux-libs' 'libaio' 'keyutils' 'libsodium' 'liburcu' 'zstd' 'rust')
makedepends=('git')
provides=('bcachefs-tools')
conflicts=('bcachefs-tools')
source=("${pkgname}::git+https://evilpiepirate.org/git/bcachefs-tools.git"
        "disable-initramfs-output.patch")
b2sums=('SKIP'
        'b53930322b26c246e94db275d5f490913f35d4f49446a7a468df6018dad65216c016ba51efbeec7cb24f8ec6001c59c707d50297979cffd131b7314a24ea2d9b')

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
  make clean
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    ROOT_SBINDIR="/usr/bin" \
    INITRAMFS_DIR="/etc/initcpio" \
    install
}
