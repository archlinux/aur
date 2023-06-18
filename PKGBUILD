# Maintainer: Jan Kohnert <bughunter@jan-kohnert.de>
# Contributor:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-sextractor
_pkgname=sextractor
pkgver=2.28.0
pkgrel=1
pkgdesc="builds a catalogue of objects from an astronomical image (build from source)"
url="http://www.astromatic.net/software/sextractor"
arch=("x86_64")
license=("GPL3")
depends=("cfitsio" "fftw" "glibc" "openblas")
makedepends=()
provides=()
backup=()
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://github.com/astromatic/sextractor/archive/${pkgver}.tar.gz"
	"${_pkgname}-${pkgver}.patch"
)
sha512sums=(
	"0f49d60b5b8174999bd7b6abdb585dcea3579a51adf68a34673b22364b90561f3d405d40f094d27eba28978a29cd454e814c59fe94a9f2e4de5f6937567243a7"
	"1715294a4029b9f9bf4e811314130894cd500ce0d5dccbaac4d91338af89b3447c1f4ebd429d80bb9315993d9ce5dc705888e126d8c563de23f8514fe72585c0"
)

prepare() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	#patch -p1 -i "${srcdir}/gcc10.patch"
	patch -p1 -i "${srcdir}/${_pkgname}-${pkgver}.patch"
}

build() {
	export CFLAGS="${CFLAGS} -fcommon"
	cd "$srcdir/${_pkgname}-${pkgver}"
	sh autogen.sh
	./configure --prefix=/usr --enable-openblas --with-openblas-incdir=/usr/include/openblas
	make
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
