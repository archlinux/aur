# Maintainer: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>

pkgname=bcachefs-tools-git
pkgver=421
pkgrel=1
pkgdesc="bcachefs filesystem utilities"
url="https://evilpiepirate.org/git/bcachefs-tools.git/"
arch=("x86_64")
license=("GPL2")
install="${pkgname}.install"

provides=("bcachefs-tools")
makedepends=("git" "libscrypt" "libsodium" "attr" "libutil-linux" "keyutils" "pkgconf" "zlib" "liburcu" "libaio")

source=("git+https://evilpiepirate.org/git/bcachefs-tools"
        "ad41c2fb76a96f772d75f3b4b7687fcd29aa0574.patch")
sha512sums=('SKIP'
            '0468db1a0b50fd368c0ded997c027ae87178f53293543151510f9683f3435c949462ee5c5f57fc1b790d304a01f2c9ece1cb893b6afc5f6e285ea39d01a95a24')

pkgver() {
    cd bcachefs-tools

    echo $(git rev-list --count HEAD)
}

prepare() {
    cd bcachefs-tools
    patch -Np1 < ../ad41c2fb76a96f772d75f3b4b7687fcd29aa0574.patch
}

build() {
    cd bcachefs-tools

    make
}

package() {
    cd bcachefs-tools

    make DESTDIR="${pkgdir}" PREFIX="/usr" ROOT_SBINDIR="/usr/bin" INITRAMFS_DIR="/etc/initcpio" install
    install -Dm644 "arch/etc/initcpio/hooks/bcachefs"   "${pkgdir}/etc/initcpio/hooks/bcachefs"
    install -Dm644 "arch/etc/initcpio/install/bcachefs" "${pkgdir}/etc/initcpio/install/bcachefs"
}
