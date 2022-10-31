# Maintainer: amateurece <ethan.twardy at gmail dot com>

pkgname=qemu-openbmc-git
_pkgname=qemu
pkgver=r95497.585070ac26
pkgrel=1
pkgdesc="QEMU built with OpenBMC Project patches applied"
url="https://github.com/openbmc/qemu"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2' 'LGPL2.1')
source=("${pkgname}::git+https://github.com/openbmc/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p build
    (cd build
     ../$pkgname/configure \
         --target-list=arm-softmmu \
         --prefix=/usr \
         --sysconfdir=/etc \
         --libexecdir=/usr/lib/qemu \
         --localstatedir=/var \
         --docdir=/usr/share/doc/qemu \
         --disable-bpf
     ninja)
}

package() {
    install -Dm755 build/arm-softmmu/qemu-system-arm \
            $pkgdir/usr/bin/openbmc-qemu-system-arm
    install -Dm755 build/qemu-bridge-helper \
            $pkgdir/usr/lib/openbmc-qemu-bridge-helper
    install -Dm544 $pkgname/COPYING $pkgdir/usr/share/licenses/$pkgname
}
