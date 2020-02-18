# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>

pkgname=mom
pkgver=0.6.0
pkgrel=1
pkgdesc="Memory Overcommitment Manager, for virtual machines"
arch=('any')
url="https://gerrit.ovirt.org/#/admin/projects/mom"
license=("GPL2")
depends=('python' 'python-six' 'libvirt-python')
makedepends=('git')
source=("git+https://gerrit.ovirt.org/mom#tag=v${pkgver}"
        "momd@.service"
        "balloon.rules")
md5sums=('SKIP'
         '927233dfa137a3010a4c6cfdf081fd5f'
         'cf66caf6eec15c39381abf28235aa0ed')
backup=('etc/mom')

build() {
    cd mom
    ./autogen.sh
    ./configure --prefix=/usr --sbindir=/usr/bin
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
