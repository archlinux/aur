# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=invidtui
pkgver=0.3.7
pkgrel=1
pkgdesc="TUI-based Invidious client"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/darkhz/invidtui"
license=('MIT')
depends=('mpv' 'ffmpeg' 'yt-dlp' 'glibc')
makedepends=('go')
optdepends=(
  'mpv-mpris: MPRIS support'
  'screen: Efficiently resume and suspend instances'
  'youtube-dl: Alternative to yt-dlp'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('aff0cc8ae76befdcbd15a5b4c1da0868479e1374589f888fa39430f34d7039ae')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  go mod download
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "$pkgname-$pkgver"

  go build -o build \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode=external -X=github.com/darkhz/invidtui/cmd.Version=$pkgver -extldflags \"$LDFLAGS\""
}

check() {
  cd "$pkgname-$pkgver"
  test "$(./build/$pkgname --version | tail -1)" = "InvidTUI v[$pkgver]"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
