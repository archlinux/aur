# Maintainer: Omar Roth <roth@omar.yt>
pkgname=doubletake-git
pkgver=0.7.0.r0.g3c76832
pkgrel=1
pkgdesc='AirPlay mirroring sender for Linux (latest git commit)'
arch=('x86_64')
url='https://github.com/omarroth/doubletake'
license=('LGPL-3.0-or-later')
makedepends=('git' 'go' 'libfdk-aac')
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
provides=('doubletake')
conflicts=('doubletake' 'doubletake-bin')
install='doubletake-git.install'
source=(
  'git+https://github.com/omarroth/doubletake.git'
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/doubletake"
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "${srcdir}/doubletake"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  make all
}

package() {
  cd "${srcdir}/doubletake"

  make DESTDIR="${pkgdir}" PREFIX=/usr LICENSEDIR="/usr/share/licenses/${pkgname}" install-prebuilt
}
