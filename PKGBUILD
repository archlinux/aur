# Maintainer: Kyle De'Vir (QuartzDragon) <kyle.devir.mykolab.com>

pkgname=bcachefs-tools-git
pkgver=527
pkgrel=1
pkgdesc="BCacheFS filesystem utilities"
url="https://github.com/koverstreet/bcachefs-tools"
arch=(x86_64)
license=(GPL2)
install="${pkgname}.install"

provides=(bcachefs-tools)
makedepends=(
    attr
    fuse3
    git
    keyutils
    libaio
    libscrypt
    libsodium
    liburcu
    libutil-linux
    pkgconf
    valgrind
    zlib
)
depends=(
    libscrypt
    libsodium
    liburcu
)

_reponame="bcachefs-tools"
_repo_url="https://github.com/koverstreet/${_reponame}"

source=(
    "git+${_repo_url}"
    "add-mkinitcpio-hook-for-Arch.patch"
)
sha256sums=('SKIP'
            'b4d6bc483b417ceaa5c628c686a613e568e64a699288da0388d508a481c710e9')

pkgver() {
    cd "${srcdir}/${_reponame}"

    echo "$(git rev-list --count HEAD)"
}

prepare() {
    cd "${srcdir}/${_reponame}"
    
    patch -Np1 -i "../add-mkinitcpio-hook-for-Arch.patch"
}

build() {
    cd "${srcdir}/${_reponame}"

    make EXTRA_CFLAGS="-O0"
}

package() {
    cd "${srcdir}/${_reponame}"

    make DESTDIR="${pkgdir}" PREFIX="/usr" ROOT_SBINDIR="/usr/bin" INITRAMFS_DIR="/etc/initcpio" install
    
    install -Dm644 "arch/etc/initcpio/hooks/bcachefs" \
                   "${pkgdir}/etc/initcpio/hooks/bcachefs"
    install -Dm644 "arch/etc/initcpio/install/bcachefs" \
                   "${pkgdir}/etc/initcpio/install/bcachefs"
}
