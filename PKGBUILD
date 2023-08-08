# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
#
# youtube-dl is abandonware. The patch replaces it with an alternative that's
# been actively developed for the past two years. If you really need the
# original, it can be selected with a command-line flag.

pkgname=invidtui
pkgver=0.3.3
pkgrel=1
pkgdesc="TUI-based Invidious client"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/darkhz/invidtui"
license=('MIT')
depends=('mpv' 'ffmpeg' 'yt-dlp' 'glibc')
makedepends=('go')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  '0001-default-youtube-dl.patch'
)
sha256sums=('0a0ae3a69770869417653445920e2ec9295eb4dc0ff13d28496d3d779e852ed4'
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
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$pkgname-$pkgver"
  go build -o build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
