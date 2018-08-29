# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=wayfire-git 
pkgver=r631.8680e3c
pkgrel=1
pkgdesc="3D wayland compositor"
arch=('x86_64')
url="https://github.com/ammen99/wayfire"
license=('MIT')
depends=('wlroots-git' 'cairo' 'glm' 'libjpeg' 'gtk3' 'wf-config-git')
makedepends=('git' 'meson' 'ninja' 'wayland-protocols' )
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/wayfire/"
  arch-meson build
  ninja -C build
}


package() {
	cd "$srcdir/wayfire"
	DESTDIR="$pkgdir/" ninja -C build install
  cp wayfire.ini.default $pkgdir/usr/share
}
