# Maintainer: Omar Roth <roth@omar.yt>
pkgname=doubletake
pkgver=0.7.0
pkgrel=1
_commit=3c768321b21e56b6a2581a498f1be56a98670e4d
pkgdesc='AirPlay mirroring sender for Linux'
arch=('x86_64')
url='https://github.com/omarroth/doubletake'
license=('LGPL-3.0-or-later')
makedepends=('go' 'libfdk-aac')
depends=(
  'glib2'
  'glibc'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
  'libpulse'
)
optdepends=(
  'bash-completion: Bash command completion'
  'libfdk-aac: AAC-ELD audio support'
  'gst-plugin-pipewire: Wayland screen and audio capture'
  'gst-plugin-va: VA-API hardware encoding on AMD and Intel GPUs'
  'xdg-desktop-portal: Wayland capture portal integration'
)
install='doubletake.install'
source=(
  "doubletake-${pkgver}.tar.gz::https://github.com/omarroth/doubletake/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('70d98c7ee0f5a57351dd2207fc76db27a89db159dbb34f5ab337b4788409382d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -buildvcs=false -trimpath -mod=readonly -modcacherw'

  make VERSION="v${pkgver}" COMMIT="${_commit}" all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" PREFIX=/usr LICENSEDIR="/usr/share/licenses/${pkgname}" install-prebuilt
}
