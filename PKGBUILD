# Maintainer: m8D2 <omui (at) proton mail (dot) com>
# Contributor: Dct Mei <dctxmei@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

pkgname=v2ray-go-git
_pkgname=${pkgname%-git}
pkgver=gbbeec9e
pkgrel=1
pkgdesc="A set of network tools that help you to build your own computer network (git version)."
arch=(x86_64)
url="https://github.com/Shadowsocks-NET/v2ray-go"
license=(MIT)
depends=(glibc v2ray-domain-list-community v2ray-geoip)
makedepends=(go git)
backup=(etc/v2ray/config.json)
provides=(v2ray)
conflicts=(v2ray)
source=("$_pkgname::git+$url.git")
sha512sums=('SKIP')

prepare() {
  cd "$srcdir"/$pkgname
  sed -i 's|/usr/local/bin|/usr/bin|;s|/usr/local/etc|/etc|' release/config/systemd/system/*.service
}

pkgver() {
    cd "$_pkgname"

    # cutting off 'v' prefix that presents in the git tag
    printf g$(git describe --always)
}

build() {
  cd "$srcdir"/$_pkgname
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  go build -o v2ray ./main
  go build -o v2ctl ./infra/control/main
}

check() {
  cd "$srcdir"/$_pkgname
  go test -p 1 -tags json -v -timeout 30m github.com/Shadowsocks-NET/v2ray-go/v4/...
}

package() {
  cd "$srcdir"/$_pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/v2ray/LICENSE
  install -Dm644 release/config/systemd/system/v2ray.service "$pkgdir"/usr/lib/systemd/system/v2ray.service
  install -Dm644 release/config/systemd/system/v2ray@.service "$pkgdir"/usr/lib/systemd/system/v2ray@.service
  install -Dm644 release/config/*.json -t "$pkgdir"/etc/v2ray/
  install -Dm755 v2ray -t "$pkgdir"/usr/bin/
  install -Dm755 v2ctl -t "$pkgdir"/usr/bin/
}
