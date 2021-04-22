# Maintainer: Solomon Choina <shlomochoina@gmail.com0
pkgname=wayfire-git
pkgver=0.6.0.r173.gf9683574
pkgrel=1
pkgdesc="3D wayland compositor"
arch=('x86_64')
url="https://github.com/ammen99/wayfire"
license=('MIT')
depends=('wlroots-git' 'cairo' 'glm' 'libjpeg' 'wf-config-git' 'seatd')
makedepends=('git' 'meson' 'ninja' 'wayland-protocols')
optdepends=('wf-shell-git: GTK3-based panel for the Wayfire compositor'
            'wf-sound-control-git: Small utility for the Wayfire compositor to control sound volume')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
source=('git+https://github.com/WayfireWM/wayfire'
        'update_build.patch')
sha256sums=('SKIP'
            '1f584f9094005da424d761129aa68a98b3daaa4fa2ff4d68edaa2f051bf8e1c7')

prepare() {
 cd "$srcdir/wayfire"
 patch -Np1 -i ../1152.patch

}
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
