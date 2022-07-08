# Maintainer: Matrix <thysupremematrix at tuta dot io>
pkgname=gnome-shell-extension-soft-brightness-git
pkgver=30.r0.g8842dfb
pkgrel=3
pkgdesc='Gnome-shell extension to manage your display brightness via an alpha overlay (instead of the backlight).'
url='https://github.com/F-i-f/soft-brightness'
license=('GPL')
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
depends=('gnome-shell>=3.33.90')
makedepends=('git' 'meson>=0.50' 'm4')
optdepends=()
source=("${pkgname}::git+${url}.git" "build.patch")
sha512sums=('SKIP'
            '788256f8dedd706452de8a0fe712290b75a0f81c933e59f62c5dd7d8ac5ed6a19072ce2165123e86e00a27f19b580abe9e49c5a72ba3c806cb652f80343d824e')
_uuid="soft-brightness@fifi.org"
_schema="org.gnome.shell.extensions.soft-brightness.gschema.xml"
prepare(){
	cd "${srcdir}/${pkgname}"
	patch -Np1 -i ../build.patch 
	meson-gse/meson-gse
}

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson "${pkgname}" build
}

check(){
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir="${pkgdir}"
	install -Dm644 $pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/$_schema -t \
		"$pkgdir/usr/share/glib-2.0/schemas"	
	rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
}
