# Maintainer: Solomon Choina <shlomochoina@gmail.com0
pkgname=wayfire-git
pkgver=0.4.0.r168.g25d568f
pkgrel=1
pkgdesc="3D wayland compositor"
arch=('x86_64')
url="https://github.com/ammen99/wayfire"
license=('MIT')
depends=('wlroots-git' 'cairo' 'glm' 'libjpeg' 'wf-config-git')
makedepends=('git' 'meson' 'ninja' 'wayland-protocols')
optdepends=('wf-shell-git: GTK3-based panel for the Wayfire compositor'
            'wf-sound-control-git: Small utility for the Wayfire compositor to control sound volume')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
source=('git+https://github.com/ammen99/wayfire')
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/wayfire"
  git submodule update --init --recursive
}
pkgver() {
	cd "$srcdir/wayfire"

# Git, no tags available
	  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
	cd "$srcdir/wayfire/"
  arch-meson build
  ninja -C build
}


package() {
	cd "$srcdir/wayfire"
	DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 wayfire.desktop $pkgdir/usr/share/wayland-sessions/wayfire.desktop 
  cp wayfire.ini $pkgdir/usr/share
}
