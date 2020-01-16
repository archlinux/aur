# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Mateusz Paluszkiewicz <aifam96 at gmail dot com>
# PKGBUILD Based on https://aur.archlinux.org/packages/etcd

pkgname=etcd-git
pkgver=r15803.2e3b55eb7
pkgrel=1
pkgdesc='A highly-available key value store for shared configuration and service discovery.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/coreos/etcd'
license=('Apache')
makedepends=('go')
backup=('etc/conf.d/etcd')
provides=('etcd')
replaces=('etcd')
conflicts=('etcd')
install="etcd.install"
source=("etcd-git::git+https://github.com/coreos/etcd.git"
        10-EnvironmentFile.conf
        etcd.env
)
sha512sums=('SKIP'
            'fa85d772929ea7e0a18bddd4b9c41d043a7f75e560eacfab67b979985e510dea694c332b5130570e47101c1ec5c25925872c6a581568390e7b141d9c6c26aae2'
            '040cee3c04dd5bb253415169d1f6f50bbccac10b687706c1b168184985c0c6c6cc67858f0c71d2ebb475891e54b370fa39b20ead5155658d01fac31d7d388324')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./build
}

package() {
  # binaries
  install -Dm755 "${srcdir}"/"${pkgname}"/bin/etcd "${pkgdir}"/usr/bin/etcd
  install -Dm755 "${srcdir}"/"${pkgname}"/bin/etcdctl "${pkgdir}"/usr/bin/etcdctl

  # Upstream systemd unit
  install -Dm644 "${srcdir}"/"${pkgname}"/contrib/systemd/etcd.service "${pkgdir}"/usr/lib/systemd/system/etcd.service

  # Adding 'EnvironmentFile=-/etc/conf.d/etcd' option to the unit
  install -Dm644 "${srcdir}"/10-EnvironmentFile.conf "${pkgdir}"/usr/lib/systemd/system/etcd.service.d/10-EnvironmentFile.conf

  # env file itself
  install -Dm644 "${srcdir}"/etcd.env "${pkgdir}"/etc/conf.d/etcd

  # License
  install -Dm644 "${srcdir}"/"${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/etcd/LICENSE

  # Docs
  install -dm755 "${pkgdir}"/usr/share/doc/etcd
  cp -r "${srcdir}"/"${pkgname}"/Documentation/* "${pkgdir}"/usr/share/doc/etcd/
  install -m644 "${srcdir}"/"${pkgname}"/etcd.conf.yml.sample "${pkgdir}"/usr/share/doc/etcd
}

# vim:set ts=4 sw=4 ft=sh:
