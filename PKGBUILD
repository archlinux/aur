# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=elastix
pkgname=${_pkgname}-git
pkgver=5.0.0.r2.g812c4d90
pkgrel=1
pkgdesc='Toolbox for rigid and nonrigid registration of images'
arch=('x86_64')
url='http://elastix.isi.uu.nl/'
license=('apache')
provides=('elastix')
depends=(
	'ann'
	'insight-toolkit'
	'openjpeg2'
)
makedepends=('cmake')
optdepends=()
conflicts=('elastix-bin' 'elastix')
source=('git+https://github.com/SuperElastix/elastix.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | \
	  sed 's/^elastix_0//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	git checkout master

	mkdir build || :
	cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release \
		..
}

build() {
	cd "${srcdir}/${_pkgname}/build"
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"

	make install DESTDIR="${pkgdir}"

	cd ..

	install -D -m644 \
		"LICENSE" \
		"$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

	install -D -m644 \
		"NOTICE" \
		"$pkgdir/usr/share/licenses/$_pkgname/NOTICE"
}
