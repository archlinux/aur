# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
#
# youtube-dl is abandonware. The patch replaces it with an alternative that's
# been actively developed for the past two years. If you really need the
# original, it can be selected with a command-line flag.

pkgname=invidtui
pkgver=0.3.4
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
  '0001-default-youtube-dl.patch'
)
sha256sums=('be9608da5892e28ffab321f8617970842ae4d0f3151170b78f1d649240638666'
  '4e30e185494ee0357ee0a71d7d309a67ebea506c3298172a6dfb96ad355cc42f')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 <"$srcdir/0001-default-youtube-dl.patch"
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
