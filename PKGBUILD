# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>

pkgname=mom
pkgver=0.6.0
pkgrel=4
pkgdesc="Memory Overcommitment Manager, for virtual machines"
arch=('any')
url="https://gerrit.ovirt.org/#/admin/projects/mom"
license=("GPL2")
depends=('python' 'python-six' 'libvirt-python')
makedepends=('git')
source=("git+https://gerrit.ovirt.org/mom#commit=655d6b36f9f80ced1e411bc8504110a261939808"
        "momd@.service"
        "balloon.rules")
md5sums=('SKIP'
         '927233dfa137a3010a4c6cfdf081fd5f'
         '4e23b6e4e6a2ee37b39120308ac5ef3d')
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
