# Maintainer: Mark Vainomaa <mikroskeem@mikroskeem.eu>
# Contributor: Mateusz Paluszkiewicz <aifam96 at gmail dot com>
# PKGBUILD Based on https://aur.archlinux.org/packages/etcd

pkgname=etcd-git
pkgver=r10599.d2716fc5a
pkgrel=1
pkgdesc='A highly-available key value store for shared configuration and service discovery.'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='https://github.com/coreos/etcd'
license=('Apache')
makedepends=('go')
backup=('etc/etcd.conf.yml' 'usr/lib/systemd/system/etcd.service')
provides=('etcd')
replaces=('etcd')
conflicts=('etcd')
install="etcd.install"
source=("etcd-git::git+https://github.com/coreos/etcd.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${pkgname}
    ./build

    # Add config to parameter
    sed -i 's,bin/etcd,bin/etcd --config-file=/etc/etcd.conf.yml,' contrib/systemd/etcd.service

    # Hash configuration
    sed -i '/\(\#\|^$\)/! s/^\(\s*\)/\1\#/' etcd.conf.yml.sample

    # Set default value in configuration
    sed -i "s,#data-dir:.*,data-dir: '/var/lib/etcd'," etcd.conf.yml.sample 
}

package() {
    cd ${srcdir}/${pkgname}
    install -Dm644 etcd.conf.yml.sample ${pkgdir}/etc/etcd.conf.yml
    install -Dm644 contrib/systemd/etcd.service ${pkgdir}/usr/lib/systemd/system/etcd.service
    install -Dm755 bin/etcd ${pkgdir}/usr/bin/etcd
    install -Dm755 bin/etcdctl ${pkgdir}/usr/bin/etcdctl
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/etcd/LICENSE
    install -dm755 ${pkgdir}/usr/share/doc/etcd
    cp -r Documentation/* ${pkgdir}/usr/share/doc/etcd
}

# vim:set ts=4 sw=4 ft=sh:
