# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=sparsebundlefs-git
pkgdesc='FUSE filesystem for reading Mac OS sparse-bundle disk images'
pkgver=r100.3cfb009
pkgrel=1
arch=('x86_64')
license=('custom:BSD-2-Clause')
url='https://github.com/torarnv/sparsebundlefs'
depends=('fuse2' 'gcc-libs')
makedepends=('pkg-config' 'git')
conflicts=('sparsebundlefs')
provides=('sparsebundlefs')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

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
	make CFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
}

package () {
	cd "${pkgname}"
	install -Dm755 sparsebundlefs "${pkgdir}/usr/bin/sparsebundlefs"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
