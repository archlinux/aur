# Maintainer: Vladyslav Aviedov <aur at vladaviedov dot org>
# Contributor: Cole Deck <cole at deck dot sh>
pkgname=fw-ectool-git
_gitname=ectool
pkgver=r2763.0ac6155
pkgrel=1
pkgdesc='ectool for the Framework laptop'
arch=('x86_64')
url='https://github.com/DHowett/ectool'
provides=('ectool')
depends=('glibc' 'gcc-libs' 'libftdi' 'libusb')
makedepends=('inetutils' 'git' 'cmake')
license=('BSD-3-Clause')
source=("git+${url}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	mkdir -p build
	cd build

	cmake .. \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	  -Wno-dev
	cmake --build .
}

package() {
	cd "${srcdir}/${_gitname}"

	install -Dm755 build/src/ectool "${pkgdir}/usr/bin/ectool"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	ln -s /usr/bin/ectool "${pkgdir}/usr/bin/fw-ectool"
}
