# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: SleepyDog

pkgname=glewmx
pkgver=1.13.0
pkgrel=1
pkgdesc='The OpenGL Extension Wrangler MX'
arch=('x86_64')
url="http://launchpad.net/ubuntu/+source/glewmx"
license=('GPL')
depends=('libxmu' 'libxi' 'glu')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz)
sha256sums=('aa25dc48ed84b0b64b8d41cdd42c8f40f149c37fa2ffa39cd97f42c78d128bc7')

prepare() {
	cd "glew-${pkgver}"

	# move include folder to subfolder 'glew-1.13.0'
	sed -i 's:$(GLEW_DEST)/include/GL:$(GLEW_DEST)/include/glew-1.13.0/GL:' Makefile

	sed -i 's|lib64|lib|' config/Makefile.linux
	sed -i '/^.PHONY: .*\.pc$/d' Makefile
}

build() {
	cd "glew-${pkgver}"

	make
}

package() {
	cd "glew-${pkgver}"

	# update glewmx include path to reflect previous changes (see build comments)
	msg update glewmx.pc
	sed -i 's:includedir=${prefix}/include:includedir=${prefix}/include/glew-1.13.0:' glewmx.pc

	make GLEW_DEST="${pkgdir}/usr" install.all

	rm -R ${pkgdir}/usr/bin
	rm ${pkgdir}/usr/lib/{libGLEW.so,libGLEW.a}
	rm ${pkgdir}/usr/lib/pkgconfig/glew.pc

	chmod 0755 "${pkgdir}"/usr/lib/libGLEW*.so.${pkgver}
}
