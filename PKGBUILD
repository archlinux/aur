# Maintainer: BrainDamage

pkgname=bee-host
pkgver=1.4.2
pkgrel=1
pkgdesc="A native messaging host application for Browser's Exernal Editor extension."
arch=(x86_64)
url="https://github.com/rosmanov/bee-host"
license=('MIT')
depends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}::https://github.com/rosmanov/bee-host/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6ff0de87105d6d7ab60def29ccab438a20f73936b2ef80e00f24eb6ba1a7c359')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build_dir
	cd build_dir
	cmake ../	\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/ \
		-DCMAKE_INSTALL_LIBDIR:PATH=lib
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cd build_dir
	make PREFIX='/usr' DESTDIR="${pkgdir}" install
	cp -rv "${pkgdir}/etc/opt/chrome" "${pkgdir}/etc"
	mv -v "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
	mkdir -p "${pkgdir}/usr/bin"
	mv -v "${pkgdir}/usr/local/bin" "${pkgdir}/usr"
	rmdir "${pkgdir}/usr/local"
}
