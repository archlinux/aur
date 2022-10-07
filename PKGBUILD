# Maintainer: m8D2 <omui (at) proton mail (dot) com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dct Mei <dctxmei@gmail.com>
# Contributor: pandada8 <pandada8@gmail.com>

pkgname=v2ray-git
pkgver=5.1.0.r17.ga4a3f4dee
pkgrel=1
pkgdesc="A set of network tools that helps you to build your own computer network (git version)."
arch=(x86_64)
url="https://github.com/v2fly/v2ray-core"
license=(MIT)
depends=(glibc v2ray-domain-list-community v2ray-geoip)
makedepends=(go git)
backup=(etc/v2ray/config.json)
provides=("v2ray=${pkgver%%.r*}")
conflicts=(v2ray)
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')

prepare() {
  cd "$srcdir"/$pkgname
  sed -i 's|/usr/local/bin|/usr/bin|;s|/usr/local/etc|/etc|' release/config/systemd/system/*.service
}

pkgver() {
    cd "$pkgname"

    # cutting off 'v' prefix that presents in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/$pkgname
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  go build -o v2ray ./main
}

check() {
  cd "$srcdir"/$pkgname
  go test -p 1 -tags json -v -timeout 30m ./...
}

package() {
  cd "$srcdir"/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/v2ray/LICENSE
  install -Dm644 release/config/systemd/system/v2ray.service "$pkgdir"/usr/lib/systemd/system/v2ray.service
  install -Dm644 release/config/systemd/system/v2ray@.service "$pkgdir"/usr/lib/systemd/system/v2ray@.service
  install -Dm644 release/config/*.json -t "$pkgdir"/etc/v2ray/
  install -Dm755 v2ray -t "$pkgdir"/usr/bin/
}
