# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Co-Maintainer: Frank Tao <frank.tao@uwaterloo.ca>
pkgname=wayfire-git
pkgver=0.7.2.r20211129.bbe63a7
pkgrel=1
pkgdesc="3D wayland compositor"
arch=('x86_64')
url="https://github.com/ammen99/wayfire"
license=('MIT')
depends=('wlroots-git' 'cairo' 'libjpeg' 'wf-config-git' 'seatd' 'libinput' 'pango')
makedepends=('git' 'glm' 'meson' 'ninja' 'wayland-protocols' 'doctest' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
source=('git+https://github.com/WayfireWM/wayfire')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/wayfire"

# Git, no tags available
	  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
	cd "$srcdir/wayfire/"
  arch-meson \
    -Duse_system_wlroots=enabled \
    -Duse_system_wfconfig=enabled \
    build
  ninja -C build
}


package() {
	cd "$srcdir/wayfire"
	DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 wayfire.desktop $pkgdir/usr/share/wayland-sessions/wayfire.desktop 
  cp wayfire.ini $pkgdir/usr/share
}
