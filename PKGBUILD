# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
# The source project now publishes version tags; the tag is mapped to Arch's
# underscore-only pkgver syntax by the repository's nvchecker workflow.
pkgname=libfprint-fpc-disum
pkgver=1.94.100_fpc1
pkgrel=1
_tag=v1.94.100-fpc1
_source_dir=fpc-disum-driver-${pkgver//_/-}
pkgdesc="libfprint with FPC Disum 10a5:9201 fingerprint sensor support"
url="https://github.com/lingdiansr/fpc-disum-driver"
arch=('x86_64')
license=('LGPL-2.1-or-later')
groups=('fprint')
depends=(
  'glib2'
  'glibc'
  'libgcc'
  'libgudev'
  'libgusb'
  'libusb'
  'openssl'
  'opencv'
  'pixman'
)
makedepends=(
  'glib2-devel'
  'gobject-introspection'
  'gtk-doc'
  'json-glib'
  'meson'
  'python'
  'python-cairo'
  'python-gobject'
  'systemd'
)
checkdepends=(
  'cairo'
  'umockdev'
)
provides=(
  "libfprint=${pkgver%%_*}"
  'libfprint-2.so'
)
conflicts=('libfprint')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/lingdiansr/fpc-disum-driver/archive/refs/tags/${_tag}.tar.gz"
)
sha256sums=('614bf5a9c432643609f50fa997b7d06679a8473dce77e15da54e59ea0486bcfe')

prepare() {
  cd "${srcdir}/${_source_dir}"
  sha256sum -c docs/SHA256SUMS
}

build() {
  local meson_options=(
    -D drivers=all
    -D installed-tests=false
  )

  arch-meson "${srcdir}/${_source_dir}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  # Arch's full upstream drivers suite currently has fixture failures (Elan
  # and Egis); gate the package on deterministic cleanroom and unit suites.
  meson test -C build --print-errorlogs \
    --suite cleanroom \
    --suite unit-tests
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${srcdir}/${_source_dir}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
