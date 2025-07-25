# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=gstd
_pkgname=gstd-1.x
pkgver=0.15.2
pkgrel=3
pkgdesc="A GStreamer framework for controlling audio and video streaming using TCP messages"
arch=('x86_64' 'aarch64')
url="https://github.com/RidgeRun/gstd-1.x"
license=('LGPL-2.1-only')
depends=(
  'glib2'
  'glibc'
  'gstreamer'
  'jansson'
  'json-glib'
  'libdaemon'
  'libedit'
  'libsoup'
  'python'
)
makedepends=(
  'gobject-introspection'
  'gtk-doc'
  'meson'
  'systemd'
)
optdepends=(
  'gst-plugins-bad: For commonly used elements not meeting the highest standards (H.264/H.265 parsers, MPEG-TS)'
  'gst-plugins-good: For high-quality, standard elements (RTP/RTSP streaming, AVI/MP4 muxing)'
  'gst-plugins-ugly: For x264 video encoding'
  'lighttpd: For the optional web interface example'
  'valgrind: For memory debugging the daemon'
)
install="${pkgname}.install"
options=('!emptydirs')
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/RidgeRun/gstd-1.x/archive/v${pkgver}.tar.gz"
  "${pkgname}.service"
  "${pkgname}-server.service"
  "${pkgname}.confd"
  "${pkgname}.install"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=('d9d3205551482acd6b7ec2a865407b60efce252e8f747553628401c84f88c556'
            '20555e74531238a8434fcb9884ac693aac0bbcb6955747db439e290d136cae7e'
            '44d1f0c185a3bd1e430b3b4f6538da714d384bf72921170b1c6f1d624d4bdf63'
            '2a7a4598c3e9f20cc927a4e79f55bb1c59e197e812bd053ad9ad0b9815b73311'
            '72702d3bda4d8bc707ffa393f646db88af2ae2563caf2999f374133586a35877'
            '68dd9ba38cc6371aae659a0447ea057e27beeef3af4e6bbeeeb17d9133cdad6f'
            'ed265664ddc97bf0230235f9c58937726e8de280b290f3d56721c5d4e5da3946')

build() {
  cd "${_pkgname}-${pkgver}"
  
  # Configure with meson
  arch-meson build \
    -Denable-tests=enabled \
    -Denable-examples=disabled \
    -Denable-gtk-doc=false \
    -Denable-systemd=disabled \
    -Denable-initd=disabled \
    -Denable-python=enabled \
    -Dwith-gstd-systemddir=/usr/lib/systemd/system \
    -Dwith-gstd-runstatedir=/run/gstd \
    -Dwith-gstd-logstatedir=/var/log/gstd
  
  # Build the project
  meson compile -C build
}

check() {
  cd "${_pkgname}-${pkgver}"
  
  # Set up environment variables for testing
  export GST_PLUGIN_SYSTEM_PATH_1_0=""
  export GST_PLUGIN_PATH_1_0="${srcdir}/${_pkgname}-${pkgver}/build"
  export GST_REGISTRY="${srcdir}/${_pkgname}-${pkgver}/build/test.registry"
  export CK_DEFAULT_TIMEOUT="30"
  
  # Set XDG_RUNTIME_DIR for tests that might need it
  export XDG_RUNTIME_DIR="${srcdir}/${_pkgname}-${pkgver}/build/test-runtime"
  mkdir -p "${XDG_RUNTIME_DIR}"
  chmod 700 "${XDG_RUNTIME_DIR}"
  
  # Run the test suite
  # Note: Some tests might be flaky, but we want to report failures
  meson test -C build --print-errorlogs
}

package() {
  cd "${_pkgname}-${pkgver}"
  
  # Install the built package
  meson install -C build --destdir="${pkgdir}"
  
  # Install license files
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  
  # Install systemd service files
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}-server.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-server.service"
  
  # Install system integration files
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  
  # Install configuration file
  install -Dm644 "${srcdir}/${pkgname}.confd" "${pkgdir}/etc/conf.d/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
