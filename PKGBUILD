# Maintainer: Omar Roth <roth@omar.yt>
pkgname=doubletake
pkgver=0.5.0
pkgrel=1
pkgdesc='AirPlay mirroring sender for Linux'
arch=('x86_64')
url='https://github.com/omarroth/doubletake'
license=('LGPL-3.0-or-later')
makedepends=('go')
depends=(
  'glibc'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
  'libpulse'
)
optdepends=(
  'gst-plugin-pipewire: Wayland screen and audio capture'
  'xdg-desktop-portal: Wayland capture portal integration'
)
install='doubletake.install'
source=(
  "doubletake-${pkgver}.tar.gz::https://github.com/omarroth/doubletake/archive/refs/tags/v${pkgver}.tar.gz"
  'doubletake.service'
)
sha256sums=('a438552190837c967ceb47d6994f86734d1f077e620ff949f7aebd906dfd3f77'
            'bb51bea22f4a5a6264a509eea126fce8b7dd0de8f5127e77e6bee13a96193c84')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 bin/doubletake "${pkgdir}/usr/bin/doubletake"
  install -Dm755 bin/doubletake-ctl "${pkgdir}/usr/bin/doubletake-ctl"
  install -Dm755 bin/doubletake-test-receiver "${pkgdir}/usr/bin/doubletake-test-receiver"
  install -Dm644 man/man1/doubletake.1 "${pkgdir}/usr/share/man/man1/doubletake.1"
  install -Dm644 man/man1/doubletake-ctl.1 "${pkgdir}/usr/share/man/man1/doubletake-ctl.1"
  install -Dm644 man/man1/doubletake-test-receiver.1 "${pkgdir}/usr/share/man/man1/doubletake-test-receiver.1"
  install -Dm644 "${srcdir}/doubletake.service" "${pkgdir}/usr/lib/systemd/user/doubletake.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
