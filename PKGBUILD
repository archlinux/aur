# Maintainer: Omar Roth <roth@omar.yt>
pkgname=doubletake
pkgver=0.6.0
pkgrel=1
_commit=be27776beb05beaa149a7096e4722f5cba60eb37
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
  'libfdk-aac: AAC-ELD audio support'
  'gst-plugin-pipewire: Wayland screen and audio capture'
  'gst-plugin-va: VA-API hardware encoding on AMD and Intel GPUs'
  'xdg-desktop-portal: Wayland capture portal integration'
)
install='doubletake.install'
source=(
  "doubletake-${pkgver}.tar.gz::https://github.com/omarroth/doubletake/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('a1f878000075259ca467c7a49cad3968b31d99798ab6748164cc9beb3ed78928')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  make VERSION="v${pkgver}" COMMIT="${_commit}" all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 bin/doubletake "${pkgdir}/usr/bin/doubletake"
  install -Dm755 bin/doubletake-ctl "${pkgdir}/usr/bin/doubletake-ctl"
  install -Dm644 man/man1/doubletake.1 "${pkgdir}/usr/share/man/man1/doubletake.1"
  install -Dm644 man/man1/doubletake-ctl.1 "${pkgdir}/usr/share/man/man1/doubletake-ctl.1"
  make DESTDIR="${pkgdir}" PREFIX=/usr SYSTEMDUSERDIR=/usr/lib/systemd/user install-systemd
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
