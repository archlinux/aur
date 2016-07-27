# Maintainer: Mark Vainomaa <mikroskeem@mikroskeem.eu>
# PKGBUILD Based on https://aur.archlinux.org/packages/etcd

pkgname=etcd-git
pkgver=r9178.13c2d32
pkgrel=1
pkgdesc='A highly-available key value store for shared configuration and service discovery.'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='https://github.com/coreos/etcd'
license=('Apache')
makedepends=('go')
backup=('etc/conf.d/etcd' 'usr/lib/systemd/system/etcd.service')
provides=('etcd')
replaces=('etcd')
conflicts=('etcd')
install="etcd.install"
source=("etcd-git::git+https://github.com/coreos/etcd.git"
        "etcd.service"
        "etcd.conf")
md5sums=('SKIP'
         '1ccf13f8b80f10e21e92361a4dea1a44'
         'bd315606b36e519c578db34722b57622')

pkgver() {
    cd ${srcdir}/${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  ./build
}

package() {
  install -Dm644 ${srcdir}/etcd.conf ${pkgdir}/etc/conf.d/etcd
  install -Dm644 ${srcdir}/etcd.service ${pkgdir}/usr/lib/systemd/system/etcd.service
  install -Dm755 ${srcdir}/${pkgname}/bin/etcd ${pkgdir}/usr/bin/etcd
  install -Dm755 ${srcdir}/${pkgname}/bin/etcdctl ${pkgdir}/usr/bin/etcdctl
  install -Dm644 ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/etcd/LICENSE
  install -dm755 ${pkgdir}/usr/share/doc/etcd
  cp -r ${srcdir}/${pkgname}/Documentation/* ${pkgdir}/usr/share/doc/etcd
  chmod -R 644 ${pkgdir}/usr/share/doc
}

# vim:set ts=4 sw=4 ft=sh:
