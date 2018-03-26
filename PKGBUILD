# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=elastix
pkgver=4.9.0
pkgrel=1
pkgdesc='Toolbox for rigid and nonrigid registration of images'
arch=('x86_64')
url='http://elastix.isi.uu.nl/'
license=('apache')
provides=()
depends=('insight-toolkit>=4.13' 'ann')
makedepends=('cmake')
optdepends=()
conflicts=('elastix-git' 'elastix-bin')
source=("https://github.com/SuperElastix/elastix/archive/${pkgver}.tar.gz")
sha512sums=('5380529a27d9aef4d93147c6de3cb0930fd31851106cfb41f35556b6e6a5406058de60bdb6ec699f17631861fd518f370b0f0a170db5d254eeafb529283d618c')

prepare() {
	_build_dir="${srcdir}/${pkgname}-${pkgver}/build"

	mkdir "$_build_dir" || :
	cd "$_build_dir"

	# What follows is the default CMake configuration.
	# I have listed all the components that are disabled by default, so
	# you can easily enable any extra you need!
	cmake \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release \
		-DMAKE_CXX_FLAGS:STRING="--std=c++11" \
		-DELASTIX_USE_OPENCL:BOOL=OFF \
		-DELASTIX_USE_ALL_COMPONENTS:BOOL=OFF \
		-DELASTIX_USE_EIGEN:BOOL=OFF \
		-DELASTIX_USE_OPENCL:BOOL=OFF \
		-DELASTIX_USE_AdvancedKappaStatisticMetric:BOOL=OFF \
		-DELASTIX_USE_AffineDTITransformElastix:BOOL=OFF \
		-DELASTIX_USE_AffineLogTransformElastix:BOOL=OFF \
		-DELASTIX_USE_BSplineInterpolatorFloat:BOOL=OFF \
		-DELASTIX_USE_BSplineResampleInterpolatorFloat:BOOL=OFF \
		-DELASTIX_USE_BSplineTransformWidthDiffusion:BOOL=OFF \
		-DELASTIX_USE_CMAEvolutionStrategy:BOOL=OFF \
		-DELASTIX_USE_ConjugateGradientFRPR:BOOL=OFF \
		-DELASTIX_USE_DisplacementMagnitudePenaliy:BOOL=OFF \
		-DELASTIX_USE_FixedShrinkingPyramid:BOOL=OFF \
		-DELASTIX_USE_GradientDifferenceMetric:BOOL=OFF \
		-DELASTIX_USE_LinearResampleInterpolator:BOOL=OFF \
		-DELASTIX_USE_MissingStructurePenalty:BOOL=OFF \
		-DELASTIX_USE_MovingShrinkingPyramid:BOOL=OFF \
		-DELASTIX_USE_MultiBSplineTransformWithNormal:BOOL=OFF \
		-DELASTIX_USE_MutualInformationHistogramMetric:BOOL=OFF \
		-DELASTIX_USE_NearestNeighborInterpolator:BOOL=OFF \
		-DELASTIX_USE_NearestNeighborResampleInterpolator:BOOL=OFF \
		-DELASTIX_USE_NormalizedGradientCorrelationMetric:BOOL=OFF \
		-DELASTIX_USE_OpenCLFixedGenericPyramid:BOOL=OFF \
		-DELASTIX_USE_OpenCLMovingGenericPyramid:BOOL=OFF \
		-DELASTIX_USE_OpenCLResampler:BOOL=OFF \
		-DELASTIX_USE_PatternIntensityMetric:BOOL=OFF \
		-DELASTIX_USE_PolydataDummyPenalty:BOOL=OFF \
		-DELASTIX_USE_RSGDEEachParameterApart:BOOL=OFF \
		-DELASTIX_USE_RayCastInterpolator:BOOL=OFF \
		-DELASTIX_USE_RayCastResampleInterpolator:BOOL=OFF \
		-DELASTIX_USE_SimilarityTransformElastix:BOOL=OFF \
		-DELASTIX_USE_Simplex:BOOL=OFF \
		-DELASTIX_USE_SimultaneousPerturbation:BOOL=OFF \
		-DELASTIX_USE_StatisticalShapePenalty:BOOL=OFF \
		-DELASTIX_USE_ViolaWellsMutualInformationMetric:BOOL=OFF \
		-DELASTIX_USE_WeightedCombinationTransformElastix:BOOL=OFF \
		..
}

build() {
	cd "$_build_dir"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"

	make install DESTDIR="${pkgdir}"

	cd ..

	install -D -m644 \
		"LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D -m644 \
		"NOTICE" \
		"$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
