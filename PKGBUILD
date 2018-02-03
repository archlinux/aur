# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=elastix
pkgver=4.8
pkgrel=2
pkgdesc='Toolbox for rigid and nonrigid registration of images'
arch=('x86_64')
url='http://elastix.isi.uu.nl/'
license=('apache')
provides=()
depends=('insight-toolkit')
makedepends=('cmake')
optdepends=()
conflicts=('elastix-git' 'elastix-bin')
source=('http://elastix.isi.uu.nl/download/elastix_sources_v4.8.tar.bz2')
sha512sums=('9438285dfe153edb32ea9806bf3192123d1080ddc71437b3b2cc7006b18bcd8e875451e92293ab51275291a042513b8c4dad91292da4bd0897ed5ae05b6d6558')

prepare() {
	cd "${srcdir}/src"

	mkdir build || :
	cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release

	# Make newer versions of ITK and gcc happy
	sed -i '108i  virtual const char * GetNameOfClass( void ) const\n;' \
		"${srcdir}/src/Core/Install/elxBaseComponent.h"
	sed -i '35iconst char * BaseComponent::GetNameOfClass( void ) const { return "BaseComponent"; }' \
		"${srcdir}/src/Core/Install/elxBaseComponent.cxx"
	sed -i '102s/inputImage/static_cast<const InputImageType *>(inputImage)/' \
		"${srcdir}/src/Common/itkImageFileCastWriter.h"
	sed -i '193,194s/vnl_math_min(/vnl_math_min( (int)/' \
		"${srcdir}/src/Components/Optimizers/AdaptiveStochasticGradientDescent/elxAdaptiveStochasticGradientDescent.hxx"
	sed -i '1009s/Generate/Update/' \
		"${srcdir}/src/Core/Kernel/elxElastixMain.cxx"
}

build() {
	cd "${srcdir}/src/build"
	make
}

package() {
	cd "${srcdir}/src/build"

	make install DESTDIR="${pkgdir}"

	cd ..

	install -D -m644 \
		"LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D -m644 \
		"NOTICE" \
		"$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
