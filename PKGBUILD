# Maintainer: Omar Roth <roth@omar.yt>
pkgname=doubletake-git
pkgver=0.3.1.r0.g7c8dd4b
pkgrel=1
pkgdesc='AirPlay 2 mirroring sender for Linux (latest git commit)'
arch=('x86_64')
url='https://github.com/omarroth/doubletake'
license=('GPL-3.0-only')
makedepends=('git' 'go')
depends=(
  'glibc'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
)
optdepends=(
  'pipewire: Wayland screen capture backend'
  'xdg-desktop-portal: Wayland capture portal integration'
)
provides=('doubletake')
conflicts=('doubletake' 'doubletake-bin')
install='doubletake-git.install'
source=(
  'git+https://github.com/omarroth/doubletake.git'
  'doubletake.service'
)
sha256sums=('SKIP'
            'bb51bea22f4a5a6264a509eea126fce8b7dd0de8f5127e77e6bee13a96193c84')

pkgver() {
  cd "${srcdir}/doubletake"
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "${srcdir}/doubletake"
  make all
}

package() {
  cd "${srcdir}/doubletake"

  install -Dm755 bin/doubletake "${pkgdir}/usr/bin/doubletake"
  install -Dm755 bin/doubletake-ctl "${pkgdir}/usr/bin/doubletake-ctl"
  install -Dm644 man/man1/doubletake.1 "${pkgdir}/usr/share/man/man1/doubletake.1"
  install -Dm644 man/man1/doubletake-ctl.1 "${pkgdir}/usr/share/man/man1/doubletake-ctl.1"
  install -Dm644 "${srcdir}/doubletake.service" "${pkgdir}/usr/lib/systemd/user/doubletake.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
