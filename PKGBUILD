# Maintainer: BrainDamage

pkgname=keyfinder-cli
pkgver=1.1.4
pkgrel=1
pkgdesc='Estimate the musical key of many different audio file formats'
arch=(x86_64 aarch64 armv7h)
url='https://github.com/evanpurkhiser/keyfinder-cli'
license=('GPL-3.0-only')
depends=(ffmpeg libkeyfinder fftw)
makedepends=('cmake')
source=("https://github.com/evanpurkhiser/keyfinder-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7826eab103bf925804cd6b522a8e61cdc51e89991770e46cb765f8d7f7fc3809')


_basename="${pkgname}"
_dirname="${pkgname}-${pkgver}"

build() {
	cd "${srcdir}/${_dirname}"
	mkdir -p build_dir
	cd build_dir
	cmake ../	\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR:PATH=lib
	make
}

package() {
	cd "${srcdir}/${_dirname}"

	cd build_dir
	make DESTDIR="${pkgdir}" install
	cd ..

	find . -maxdepth 1 -iname 'README*' \
		-exec install -Dvm 644 -t "${pkgdir}/usr/share/doc/${_basename}" {} +
	find . -maxdepth 1 -iname 'LICENSE*' \
		-exec install -Dvm 644 -t "${pkgdir}/usr/share/licenses/${_basename}" {} +


}
