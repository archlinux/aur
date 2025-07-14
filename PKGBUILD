# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=gstd
_pkgname=gstd-1.x
pkgver=0.15.2
pkgrel=2
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
        "gstd-server.service"
        "gstd.confd"
        "gstd.sysusers"
        "gstd.tmpfiles"
        "gstd.install")
sha256sums=('d9d3205551482acd6b7ec2a865407b60efce252e8f747553628401c84f88c556'
            'e412603c44f12d2ba7b03e401e22c186c2f59268a49c6b48c60f8dcac489f31a'
            '576ad2e905a98ee006151075a1e0fc00ba56d7c0a984c95d27ed49c36c7dcc8f'
            'f42db0544f5fdc0e57417b68cb5129b7051300ada44b762fb29951f05019af02'
            '68dd9ba38cc6371aae659a0447ea057e27beeef3af4e6bbeeeb17d9133cdad6f'
            '4c1929641396d5ccc701528012a80e781a7e508c5af9f8b200cafae69f965270'
            '6a74b4a836f9a4987dda60c37772df55b635559ac12dbca0c7078b1573de42e7')

build() {
  cd "$_pkgname-$pkgver"
  arch-meson build \
    -Denable-tests=enabled \
    -Denable-examples=enabled \
    -Denable-gtk-doc=false \
    -Denable-systemd=disabled \
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

  # Install the user service file
  install -Dm644 "$srcdir/gstd.service" "$pkgdir/usr/lib/systemd/user/gstd.service"
  
  # Install the system service file for server use, renaming it to gstd.service
  install -Dm644 "$srcdir/gstd-server.service" "$pkgdir/usr/lib/systemd/system/gstd.service"

  # Install helper files for the system service
  install -Dm644 "$srcdir/gstd.sysusers" "$pkgdir/usr/lib/sysusers.d/gstd.conf"
  install -Dm644 "$srcdir/gstd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/gstd.conf"
  
  # Install the user-configurable environment file
  install -Dm644 "$srcdir/gstd.confd" "$pkgdir/etc/conf.d/gstd"
  
  # Final cleanup
  rm -vrf "$pkgdir/run"
  rm -vrf "$pkgdir/var"
}
