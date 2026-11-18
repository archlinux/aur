# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-compositor-git
pkgver=0.1.0.r0.g8fb0ee8
pkgrel=1
pkgdesc="A scrollable-tiling Wayland compositor built in Go (development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-compositor"
license=('GPL-3.0-or-later')
depends=('wlroots0.20' 'scenefx' 'libpipewire' 'libinput' 'libxkbcommon' 'wayland'
         'pixman' 'libdrm' 'dbus' 'xkeyboard-config')
makedepends=('go>=1.26.4' 'wayland-protocols' 'pkgconf' 'git')
optdepends=('xwayland-satellite: X11 applications'
            'xdg-desktop-portal-gnome: screencasting and screenshots'
            'xdg-desktop-portal-gtk: file pickers and settings'
            'sysc-shell: bar, launcher and the rest of the sysc desktop')
provides=('sysc-compositor')
conflicts=('sysc-compositor')
install="${pkgname}.install"
source=('sysc-compositor::git+https://github.com/Nomadcxx/sysc-compositor.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/sysc-compositor"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)" )
}

build() {
  cd "${srcdir}/sysc-compositor"
  export GOTOOLCHAIN=local
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make build VERSION="${pkgver}"
}

package() {
  cd "${srcdir}/sysc-compositor"
  make install PREFIX=/usr DESTDIR="${pkgdir}" VERSION="${pkgver}"
}
