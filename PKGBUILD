# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=pacoloco-git
pkgver=1.2.r0.g3338566
pkgrel=1
pkgdesc='Pacman caching proxy server'
arch=(x86_64 armv7h aarch64)
url='https://github.com/anatol/pacoloco'
backup=(etc/pacoloco.yaml)
license=(MIT)
depends=(glibc)
makedepends=(git go)
provides=(pacoloco)
conflicts=(pacoloco)
source=(git+https://github.com/anatol/pacoloco)
sha1sums=('SKIP')

pkgver() {
  cd pacoloco
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd pacoloco

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd pacoloco

  install -D -m755 pacoloco "$pkgdir"/usr/bin/pacoloco
  install -D -m644 pacoloco.yaml.sample "$pkgdir"/etc/pacoloco.yaml
  install -D -m644 pacoloco.sysusers.d "$pkgdir"/usr/lib/sysusers.d/pacoloco.conf
  install -D -m644 pacoloco.service "$pkgdir"/usr/lib/systemd/system/pacoloco.service
  install -D -m644 pacoloco.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/pacoloco.conf
}
