# Maintainer: Hans Gaiser <hansg91@gmail.com>

pkgname=gloo-git
pkgver=0.r113.6089900
pkgrel=1
pkgdesc='Gloo is a collective communications library from the Facebook incubator. It comes with a number of collective algorithms useful for machine learning applications.'
arch=(x86_64)
url='https://github.com/facebookincubator/gloo'
license=('BSD')

source=('git+https://github.com/facebookincubator/gloo.git')
depends=('cuda' 'nccl')
makedepends=('git' 'cmake')
provides=('gloo')
conflicts=('gloo')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/gloo"
	set -o pipefail
	echo -n '0.'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	rm -rf "$srcdir/gloo/build"
	mkdir "$srcdir/gloo/build"
	cd "$srcdir/gloo/build"

	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DNCCL_ROOT_DIR=/opt/cuda \
		-DCUDA_HOST_COMPILER=/usr/bin/g++-5 \
		-DUSE_CUDA=on
}

build() {
	cd "$srcdir/gloo/build"
	make
}

package() {
	cd "$srcdir/gloo/build"
	make DESTDIR="${pkgdir}" install

	# Install BSD License
	install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Install Documentation
	install -D -m644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
