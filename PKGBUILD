# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=quicktime-video-hack-git
pkgver=r324.d81396e
pkgrel=2
pkgdesc="Record iOS device audio and video over USB without macOS/QuickTime (git version)"
arch=('x86_64')
url="https://github.com/danielpaulus/quicktime_video_hack"
license=('MIT')
depends=('libusb' 'glib2' 'gstreamer' 'gst-plugins-base-libs' 'usbutils' 'systemd')
makedepends=('git' 'go' 'pkg-config')
optdepends=(
  'gst-plugins-base: basic GStreamer pipeline support'
  'gst-plugins-good: standard transcoding codecs'
  'gst-plugins-bad: H.264 decode and advanced sinks'
  'gst-plugins-ugly: additional codecs for transcoding'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git"
        "qvh-mirror"
        "0001-Linux-make-checkDeviceIsPaired-non-fatal-when-usbmuxd.patch")
sha256sums=('SKIP'
            '159416228e92f22ec9df227688c5b9f5a61a25ccafc0a4404b5077ec36500394'
            '4cb46a353d006cedc0c0aa29f7458f987972215a17e9faba35f30b821a86f9c3')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  # Linux: checkDeviceIsPaired hard-exits when usbmuxd is unreachable, but qvh
  # needs usbmuxd stopped to switch into the QuickTime USB config (kernel
  # refuses SET_CONFIGURATION while usbmuxd holds interfaces). Downgrade the
  # pair-check failure to a warning so qvh-mirror can run with usbmuxd briefly
  # stopped. Pairing itself is unaffected.
  patch -p1 < "$srcdir/0001-Linux-make-checkDeviceIsPaired-non-fatal-when-usbmuxd.patch"
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
  install -Dm755 "$srcdir/qvh-mirror" "$pkgdir/usr/bin/qvh-mirror"
}
