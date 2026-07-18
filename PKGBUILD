# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=livekit
pkgver=1.13.4
pkgrel=1
pkgdesc='LiveKit: Real-time video, audio and data for developers'
arch=(x86_64)
url='https://livekit.io/'
license=(Apache)
makedepends=(go mage git)
optdepends=(redis)
backup=("etc/livekit/config.yaml")
source=(
  "https://github.com/livekit/livekit/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.service"
)
sha256sums=(
  'cfef31caa302761ed84d9eee4d5f793a3f6cb321cd56a5cafec675f70475e794'
  'c23c7576f6ab9e94cde3501581a5732e3678bd51321903cff3171906456c40bf'
)

build() {
  cd $pkgname-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  mage build
}

package() {
  install -vDm755 $pkgname-$pkgver/bin/livekit-server -t "$pkgdir/usr/bin"
  install -vDm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm644 $pkgname-$pkgver/config-sample.yaml -T "$pkgdir/etc/$pkgname/config.yaml"
}
