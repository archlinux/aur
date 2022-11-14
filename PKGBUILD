# Maintainer: Nil Geisweiller <ngeiswei at the giant g>

pkgname=ctrlr
pkgver=5.4.16
pkgrel=3
epoch=
pkgdesc="Control any midi enabled hardware: synthesizers, drum machines, samplers, effects.  Create custom user interfaces.  Host them as VST or AU plugins in your favorite daws."
arch=('x86_64')
url="https://ctrlr.org"
license=('BSD')
groups=('pro-audio')
depends=('binutils')
makedepends=()
checkdepends=()
optdepends=()
provides=('ctrlr')
conflicts=('ctrlr')
source=("Ctrlr-${arch}-${pkgver}.sh"::"https://ctrlr.org/nightly/Ctrlr-${arch}-${pkgver}.sh")
sha256sums=('34d0786a8911650dd47e4c139fdcfd179d85167bb1f7307b418d0cbf8e63e087')
validpgpkeys=()

prepare() {
	chmod a+x "Ctrlr-${arch}-${pkgver}.sh"
}

build() {
	./"Ctrlr-${arch}-${pkgver}.sh"
}

package() {
	PREFIX="${pkgdir}/usr"
	BINPATH="${PREFIX}/bin"
	LIBPATH="${PREFIX}/lib"
	VSTPATH="${LIBPATH}/vst"

	# Create local folders and copy binaries
	mkdir -p "${BINPATH}"
	mkdir -p "${VSTPATH}"
	cp "Ctrlr/Ctrlr-${arch}" "${BINPATH}/Ctrlr"
	cp "Ctrlr/libCtrlr-VST-${arch}.so" "${VSTPATH}/Ctrlr.so"

	# Create symbolic link libbfd-2.24-system.so, used by Ctrlr,
	# to the last version of libbfd.so
	CTRLR_LIBBFD_LINK="libbfd-2.24-system.so"
	LIBBFD_PATH=$(ls /usr/lib/libbfd-?.??*.so | sort -r | head -n1)
	LIBBFD_NAME=$(basename ${LIBBFD_PATH})
	ln -s "${LIBBFD_NAME}" "${LIBPATH}/${CTRLR_LIBBFD_LINK}"
}
