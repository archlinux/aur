# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

_pkgname=LIEF
pkgname=${_pkgname,,}-git
pkgver=0.11.0.r224.g12c5bf44
pkgrel=1
pkgdesc='Library to instrument executable formats'
arch=(x86_64)
url="https://${_pkgname,,}.quarkslab.com/"
license=(APACHE)
depends=(python)
makedepends=(git cmake python-setuptools)
conflicts=(lief)
source=("git+https://github.com/${_pkgname,,}-project/${_pkgname}")
sha256sums=(SKIP)

pkgver()
{
	cd "$srcdir/${_pkgname}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p build
	cmake -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=1 \
		.
	make -j$(nproc) -C build
	python setup.py build --build-temp=build
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" -C build -j$(nproc) install
	python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
}
