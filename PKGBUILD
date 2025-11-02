# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=livekit
pkgver=1.9.3
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
  '9c611ef8b04504a4841a675cbdbf53a3dd13820919e72a6b18ae9a6743a32391'
  '91d65dd3f144d11fb43b8526595dce76397185b818b84c8a1068a6944ceaa7b5'
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
