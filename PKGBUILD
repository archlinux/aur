# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gwe
pkgver=0.15.5
pkgrel=2
pkgdesc="A system utility for controlling NVIDIA GPUs"
arch=('any')
url="https://gitlab.com/leinardi/gwe"
license=('GPL3')
depends=('gobject-introspection' 'libdazzle' 'libappindicator-gtk3' 'libnotify' 'python' 'python-cairo' 'python-gobject' 'python-injector' 'python-matplotlib' 'python-peewee' 'python-py3nvml' 'python-requests' 'python-rx' 'python-pyxdg' 'python-xlib')
makedepends=('meson' 'appstream-glib')
provides=()
source=("https://gitlab.com/leinardi/gwe/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "libnotify-0.8.patch")
sha256sums=('67c30c735b6160c2f4af61ce353108dc9709b6c850ce8bc21d2d2a506dfa3b70'
            '9db823f5eda05ad7f1b10b8a1d69437efe89cf00b6001fc15b15c049d84385ce')

build() {
	if [[ -d "$srcdir/build" ]]; then
		rm -rf "$srcdir/build"
	fi
	# patch the required version of libnotify to 0.8
	patch -p1 -d "$pkgname-$pkgver" -i ../libnotify-0.8.patch
	meson --prefix /usr --buildtype=plain "$pkgname-$pkgver" build
	ninja -C build
}

check() {
	ninja -C build test
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
