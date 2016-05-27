# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=soxt
pkgver=1.3.0
pkgrel=5
pkgdesc='A high-level 3D graphics toolkit on top of OpenGL.'
arch=('i686' 'x86_64')
url='http://www.coin3d.org/'
license=('GPL')
depends=('coin' 'libxi' 'libxmu' 'libxpm' 'lesstif')
makedepends=('doxygen' 'coin')
source=("https://bitbucket.org/Coin3D/coin/downloads/SoXt-${pkgver}.tar.gz")
sha256sums=('f5443aadafe8e2222b9b5a23d1f228bb0f3e7d98949b8ea8676171b7ea5bf013')

build() {
	cd "${srcdir}/SoXt-${pkgver}"

	./configure \
		--prefix=/usr \
		--enable-optimization \
		--enable-threadsafe \
		--enable-html \
		--enable-man \
		--enable-exceptions \
		--disable-debug \
		--disable-maintainer-mode \
		--disable-dependency-tracking \
		--enable-shared \
		--disable-static
	make
}

package() {
	cd "${srcdir}/SoXt-${pkgver}"

	make DESTDIR="${pkgdir}/" install

	# these files conflict with soqt, so rename them
	for FILE in components devices misc viewers; do
		mv "${pkgdir}/usr/share/man/man3/${FILE}.3" "${pkgdir}/usr/share/man/man3/soxt-${FILE}.3"
	done

	# where do these files come from?
	rm -f "${pkgdir}/usr/share/man/man3/_"*
}

