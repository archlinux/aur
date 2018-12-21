# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>

pkgname=mom
pkgver=0.5.12
pkgrel=2
pkgdesc="Memory Overcommitment Manager, for virtual machines"
arch=('x86_64')
url="https://gerrit.ovirt.org/#/admin/projects/mom"
license=("GPL2")
depends=('python2')
makedepends=('git')
source=("git+https://gerrit.ovirt.org/mom#tag=v${pkgver}"
        "momd@.service"
        "balloon.rules")
md5sums=('SKIP'
         'c2b7bf62ee32aee64e127f4384767235'
         'cf66caf6eec15c39381abf28235aa0ed')

prepare() {
    cd mom
    sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/env python2/' momd
}

build() {
    cd mom
    ./autogen.sh
    PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

package() {
    install -Dm644 momd@.service "${pkgdir}/usr/lib/systemd/system/momd@.service"
    install -Dm644 balloon.rules "${pkgdir}/etc/mom/balloon.rules"
    cd mom
    make DESTDIR="${pkgdir}" install
    install -Dm644 doc/mom-balloon+ksm.conf "${pkgdir}/etc/mom/mom.conf"
    sed -i 's/guest-manager-multi-thread:/guest-manager-multi-thread: true/' "${pkgdir}/etc/mom/mom.conf"
}
