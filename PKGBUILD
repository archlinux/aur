pkgname='dwt-git'
pkgver=0.6.0.r12.g2185a27
pkgrel=1
pkgdesc='Simple no-frills terminal emulator based on VTE - Git build'
license=('MIT')
url='https://github.com/aperezdc/dwt'
source=("${pkgname}::git+${url}.git")
sha1sums=('SKIP')
arch=('i686' 'x86_64' 'arm')
depends=('vte3')
makedepends=('meson' 'ninja')
options=('strip' 'zipman')
provides=('dwt')
conflicts=('dwt')

pkgver () {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build () {
	rm -rf "${srcdir}/_build"
	mkdir "${srcdir}/_build"
	cd "${srcdir}/_build"
	flags='-DDWT_DEFAULT_FONT=\"Inconsolata\ 12\"'
	flags="${flags} -DDWT_USE_POPOVER=TRUE ${CPPFLAGS}"
	CPPFLAGS=${flags} meson --prefix=/usr "${srcdir}/${pkgname}"
	ninja
}

package () {
	DESTDIR="${pkgdir}/" ninja -C "${srcdir}/_build" install
	install -Dm644 "${srcdir}/${pkgname}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
