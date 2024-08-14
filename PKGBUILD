# Maintainer: cysp74 at gmail dot com
_name=etcd
pkgname="${_name}-git"
pkgver=3.6.0.alpha.0.r4017.gc147425c5
pkgrel=1
pkgdesc='A highly-available key value store for shared configuration and service discovery.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/coreos/etcd'
license=('Apache')
makedepends=('go' 'git')
backup=('etc/conf.d/etcd')
provides=('etcd')
replaces=('etcd')
conflicts=('etcd')
install="${_name}.install"
source=("${_name}::git+https://github.com/coreos/etcd.git"
        10-EnvironmentFile.conf
        etcd.env
)
sha512sums=('SKIP'
            'fa85d772929ea7e0a18bddd4b9c41d043a7f75e560eacfab67b979985e510dea694c332b5130570e47101c1ec5c25925872c6a581568390e7b141d9c6c26aae2'
            'a4843be558e401fa6c612c88059fbe83025eb86077bec70331bc43b7dd48cc09fd186f0ea9d4b45c802a617d5f771752bb2ed8113ce02a6b6eaaabd926e227e9')

pkgver() {
    git -C "${_name}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_name}"
  scripts/build.sh
}

package() {
  # binaries
  install -Dm755 "${srcdir}"/"${_name}"/bin/etcd "${pkgdir}"/usr/bin/etcd
  install -Dm755 "${srcdir}"/"${_name}"/bin/etcdctl "${pkgdir}"/usr/bin/etcdctl

  # Upstream systemd unit
  install -Dm644 "${srcdir}"/"${_name}"/contrib/systemd/etcd.service "${pkgdir}"/usr/lib/systemd/system/etcd.service

  # Adding 'EnvironmentFile=-/etc/conf.d/etcd' option to the unit
  install -Dm644 "${srcdir}"/10-EnvironmentFile.conf "${pkgdir}"/usr/lib/systemd/system/etcd.service.d/10-EnvironmentFile.conf

  # env file itself
  install -Dm644 "${srcdir}"/etcd.env "${pkgdir}"/etc/conf.d/etcd

  # License
  install -Dm644 "${srcdir}"/"${_name}"/LICENSE "${pkgdir}"/usr/share/licenses/etcd/LICENSE

  # Docs
  install -dm755 "${pkgdir}"/usr/share/doc/etcd
  cp -r "${srcdir}"/"${_name}"/Documentation/* "${pkgdir}"/usr/share/doc/etcd/
  install -m644 "${srcdir}"/"${_name}"/etcd.conf.yml.sample "${pkgdir}"/usr/share/doc/etcd
}
