# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=quicktime-video-hack-git
pkgver=r324.d81396e
pkgrel=1
pkgdesc="Record iOS device audio and video over USB without macOS/QuickTime (git version)"
arch=('x86_64')
url="https://github.com/danielpaulus/quicktime_video_hack"
license=('MIT')
depends=('libusb' 'glib2' 'gstreamer' 'gst-plugins-base-libs')
makedepends=('git' 'go' 'pkg-config')
optdepends=(
  'gst-plugins-base: basic GStreamer pipeline support'
  'gst-plugins-good: standard transcoding codecs'
  'gst-plugins-bad: H.264 decode and advanced sinks'
  'gst-plugins-ugly: additional codecs for transcoding'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -buildmode=pie -trimpath \
    -ldflags="-s -w -linkmode=external -extldflags \"${LDFLAGS}\"" \
    -o qvh
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 qvh "$pkgdir/usr/bin/qvh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
