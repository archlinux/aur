# Maintainer: Kyle De'Vir (QuartzDragon) <kyle.devir.mykolab.com>

pkgname=bcachefs-tools-git
pkgver=996
pkgrel=1
pkgdesc="BCacheFS filesystem utilities"
url="https://github.com/koverstreet/bcachefs-tools"
arch=("x86_64")
license=("GPL2")
install="$pkgname.install"

provides=(bcachefs-tools)
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
            'e75e0fc9576990d910acf5a3eafb1f83ab7d407bddcc210c9926b048ceb3ef018749654ca6a6ebdfab45a3e00031f6bb3537d2f3f19e3a7ec3be7c470d4ce7df')

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
