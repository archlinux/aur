# Maintainer: Sheyiyuan <sheyiyuantan90@qq.com>
pkgname=zero-beat-git
pkgver=0.4.1.r8.g048bd4a
pkgrel=1
pkgdesc="Terminal music player for NetEase Cloud Music and Bilibili (TUI)"
arch=('x86_64' 'aarch64')
url="https://github.com/Sheyiyuan/zero-beat"
license=('AGPL-3.0-only')
depends=('ffmpeg' 'alsa-lib' 'libpulse')
makedepends=('git' 'go')
provides=('zero-beat')
conflicts=('zero-beat')
options=(!strip !debug)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/zero-beat"
  local _ver
  _ver=$(git describe --tags --abbrev=0 2>/dev/null || echo v0.4.0)
  printf '%s.r%s.g%s' \
    "${_ver#v}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/zero-beat"
  export CGO_ENABLED=0
  local _ver="${pkgver%%.r*}"
  go build -buildmode=pie -trimpath -buildvcs=false \
    -ldflags "-s -w -bindnow -X main.version=${_ver}" \
    -o zero ./cmd/zero
}

package() {
  cd "$srcdir/zero-beat"
  install -Dm755 zero "$pkgdir/usr/bin/zero"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README.md THIRD_PARTY_NOTICES.md \
    "$pkgdir/usr/share/doc/$pkgname/"
}
