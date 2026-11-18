# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-compositor
pkgver=0.1.0
pkgrel=1
pkgdesc="A scrollable-tiling Wayland compositor built in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-compositor"
license=('GPL-3.0-or-later')
depends=('wlroots0.20' 'scenefx' 'libpipewire' 'libinput' 'libxkbcommon' 'wayland'
         'pixman' 'libdrm' 'dbus' 'xkeyboard-config')
makedepends=('go>=1.26.4' 'wayland-protocols' 'pkgconf')
optdepends=('xwayland-satellite: X11 applications'
            'xdg-desktop-portal-gnome: screencasting and screenshots'
            'xdg-desktop-portal-gtk: file pickers and settings'
            'sysc-shell: bar, launcher and the rest of the sysc desktop')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-compositor/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de0abf038f625e024bce9498f27c8a9b2e8d52dbca3e98b1904af66d56c2f4c1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOTOOLCHAIN=local
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make build VERSION="${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install PREFIX=/usr DESTDIR="${pkgdir}" VERSION="${pkgver}"
}
