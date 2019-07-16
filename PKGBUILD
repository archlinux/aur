# Maintainer: Martin Villagra <possum@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sebastian A. Liem <sebastian at liem dot se>

pkgname=slock-start-blue-git
_pkgname=slock
pkgver=20170325.35633d4
pkgrel=1
pkgdesc='Simple X display locker, this version starts with blue screen instead of black'
url='http://tools.suckless.org/slock'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('git')
depends=('libxrandr')
source=('git://git.suckless.org/slock')
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
    sed -E 's/(\[INIT\]\s*=\s*)".*"/\1"#005577"/' -i config.def.h
	sed '/group =/s/nogroup/nobody/' -i config.def.h
	sed \
		-e 's/CPPFLAGS =/CPPFLAGS +=/g' \
		-e 's/CFLAGS =/CFLAGS +=/g' \
		-e 's/LDFLAGS =/LDFLAGS +=/g' \
		-i config.mk
}

build() {
	cd "${srcdir}/${_pkgname}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
