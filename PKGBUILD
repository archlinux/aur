# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=andi
pkgver=0.12
pkgrel=1
pkgdesc="Rapid estimation of evolutionary distances"
url="https://github.com/evolbioinf/andi/"
license=("GPL3") # "custom:ISC" "custom:CC-BY 4.0"
depends=("libdivsufsort" "gsl")
arch=("i686" "x86_64")
checkdepends=("glib2")
source=("https://github.com/EvolBioInf/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"0001-derandomize-unit-tests.patch"
	"0002-prefix-files-in-unit-tests.patch")
sha256sums=('85f30618451bc8d80abceece80efee1a9fb1f4243b7fc89b99f72e3fbc016e4f'
            '9d651bffd9efe568bb557bc306b959f5789bca0c758bdd29866fc66fdb907f5e'
            'f79eb149ae9dc58f9998fc97b911b362181a5ec3373f93241bcafc31da9105f5')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}/"0001-*.patch
	patch -Np1 -i "${srcdir}/"0002-*.patch
}

check() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-unit-tests --with-seed=123
	make
	make check
}

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
