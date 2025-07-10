# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=gstd
_pkgname=gstd-1.x
pkgver=0.15.2
pkgrel=1
pkgdesc="A GStreamer framework for controlling audio and video streaming using TCP messages"
arch=('x86_64' 'aarch64')
url="https://github.com/RidgeRun/gstd-1.x"
license=('LGPL-2.1-only')
depends=('gstreamer' 'jansson' 'json-glib' 'libdaemon' 'libedit' 'libsoup' 'python' 'glibc' 'glib2')
makedepends=('meson' 'gobject-introspection' 'gtk-doc' 'systemd')
optdepends=(
    'gst-plugins-good: For high-quality, standard elements (RTP/RTSP streaming, AVI/MP4 muxing)'
    'gst-plugins-bad: For commonly used elements not meeting the highest standards (H.264/H.265 parsers, MPEG-TS)'
    'gst-plugins-ugly: For x264 video encoding'
    'lighttpd: For the optional web interface example'
    'valgrind: For memory debugging the daemon'
)
install=gstd.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "gstd.service"
        "gstd.sysusers"
        "gstd.install"
        "gstd.tmpfiles")
sha256sums=('d9d3205551482acd6b7ec2a865407b60efce252e8f747553628401c84f88c556'
            '69b7253e911bc3ac20218bbd481976b92a2ad53e13465ceb79397a7ba688e22f'
            'd0a9177ad62318b931869d3a246373639cfdc525fe3085e6bc6fd97ca40b6c2f'
            '513b244cbc6b83981b96c2e7dfdfb983119ed5abf6eb5f5cb9999156eb0bfc84'
            '3ef0992149c75bf5157b03711b230e69655b2c2e08da1e67f4b9dbd7bfecfd69')

build() {
  cd "$_pkgname-$pkgver"
  arch-meson build \
    -Denable-tests=disabled \
    -Denable-examples=disabled \
    -Denable-gtk-doc=false \
    -Denable-systemd=enabled \
    -Denable-initd=disabled \
    -Denable-python=enabled \
    -Dwith-gstd-systemddir=/usr/lib/systemd/system \
    -Dwith-gstd-runstatedir=/run/gstd \
    -Dwith-gstd-logstatedir=/var/log/gstd

  meson compile -C build
}

package() {
  cd "$_pkgname-$pkgver"
  meson install -C build --destdir="$pkgdir"

  # Install the main license file
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install our custom service, user, and tmpfiles configurations
  install -Dm644 "$srcdir/gstd.service" "$pkgdir/usr/lib/systemd/system/gstd.service"
  install -Dm644 "$srcdir/gstd.sysusers" "$pkgdir/usr/lib/sysusers.d/gstd.conf"
  install -Dm644 "$srcdir/gstd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/gstd.conf"

  # Clean up. The package should NOT own any directories in /run or /var.
  rm -vf "$pkgdir/usr/lib/systemd/system/gstd-check-user-xenv.sh"
  rm -vrf "$pkgdir/run"
  rm -vrf "$pkgdir/var"
}
