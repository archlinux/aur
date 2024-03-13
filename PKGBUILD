# Maintainer: Kyle De'Vir (QuartzDragon) <kyle.devir.mykolab.com>

pkgname=bcachefs-tools-git
pkgver=1339
pkgrel=1
pkgdesc="BCacheFS filesystem utilities"
url="https://github.com/koverstreet/bcachefs-tools"
arch=("x86_64")
license=("GPL2")
install="$pkgname.install"

provides=(bcachefs-tools)
conflicts=(bcachefs-tools)
dependsarray="attr cargo clang fuse3 git keyutils libaio libscrypt libsodium liburcu libutil-linux pkgconf python-docutils systemd valgrind zlib"
makedepends=(${dependsarray})
depends=(${dependsarray})

options=('!strip')

_reponame="bcachefs-tools"
_repo_url="https://github.com/koverstreet/$_reponame"

source=(
    "git+$_repo_url"
    "add-mkinitcpio-hook-for-Arch.patch"
)
sha512sums=('SKIP'
            '5ebb0c6b17e7a61ccd2c157a0a833bc51e1d66cdf9711c8038c9e695ba22bf4098695658401bef9560ec02722787de0d89e1ccf7b8a716f9eeb136ad2e59daca')

prepare() {
    cd "$srcdir/$_reponame"

    PName="add-mkinitcpio-hook-for-Arch.patch"
    msg2 "Patching with $PName ..."
    patch -Np1 -i "../$PName"
}

pkgver() {
    cd "$srcdir/$_reponame"

    echo "$(git rev-list --count HEAD)"
}

build() {
    cd "$srcdir/$_reponame"

    make
}

package() {
    cd "$srcdir/$_reponame"

    make DESTDIR="$pkgdir" PREFIX="/usr" ROOT_SBINDIR="/usr/bin" INITRAMFS_DIR="/etc/initcpio" install

    install -Dm644 "arch/etc/initcpio/hooks/bcachefs" \
                   "$pkgdir/etc/initcpio/hooks/bcachefs"
    install -Dm644 "arch/etc/initcpio/install/bcachefs" \
                   "$pkgdir/etc/initcpio/install/bcachefs"
}
