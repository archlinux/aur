# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='wayhouse-git'
pkgdesc='Small Wayland tiling compositor based on libweston'
pkgver=r16.d549eb0
pkgrel=1
url='https://github.com/sardemff7/wayhouse'
arch=('x86_64')
license=('GPL3')
depends=('weston' 'wayland-wall')
makedepends=('meson' 'ninja')
source=("${pkgname}::git+${url}"
        'git+https://github.com/sardemff7/libgwater'
		'git+https://github.com/sardemff7/libnkutils')
sha512sums=('SKIP' 'SKIP' 'SKIP')

prepare () {
	cd "${pkgname}"
	git submodule init
	git config submodule.libgwater.url "${srcdir}/libgwater"
	git config submodule.libnkutils.url "${srcdir}/libnkutils"
	git submodule update

	# This is needed to fix a build failure.
	pushd subprojects/libgwater &> /dev/null
	git checkout --force e6faf48267ae40547cb86c125f265f54f382df1c
	popd &> /dev/null
}

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"
	rm -rf build
	meson --buildtype release \
		--prefix /usr \
		--sysconfdir /etc \
		--localstatedir /var \
		-Denable-debug=false \
		build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C "${pkgname}/build" install
}
