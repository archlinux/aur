# Maintainer: Jesse R Codling <codling at umich dot edu>
# Contributor: zeroskyx
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=LightGBM
pkgbase=lightgbm-cl
_pkgbase="${pkgbase%-*}"
pkgname=("${pkgbase}" "python-${pkgbase}")
pkgver=4.6.0
pkgrel=3
pkgdesc="Distributed gradient boosting framework based on decision tree algorithms."
arch=('x86_64')
url="https://github.com/Microsoft/LightGBM"
license=('MIT')
depends=('opencl-icd-loader' 'boost-libs' 'openmpi')
makedepends=('boost' 'cmake' 'ninja' 'opencl-headers' 'python-build'
	'python-installer' 'python-wheel' 'python-setuptools' 'git'
	'python-scikit-build-core' 'eigen' 'fmt' 'python-pip')
source=("${_pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha256sums=('1e2c2e8ebe9acb8b730e7ca56efddee3ee6bf11d2674efccf4bb27673e1529c0')

prepare() {
	cd "${_pkgname}-${pkgver}"
	git submodule update --init --recursive

	# Build against system libraries/headers where possible
	git submodule deinit external_libs/fmt # provided by makedep `fmt`
	rmdir external_libs/fmt
	ln -sf /usr/include/ external_libs/fmt

	git submodule deinit external_libs/compute # provided by makedep `boost`
	# submodule version of boost.compute has build errors
	rmdir external_libs/compute
	ln -sf /usr/include/ external_libs/compute

	git submodule deinit external_libs/eigen # provided by makedep `eigen`
	rmdir external_libs/eigen
	ln -sf /usr/include/eigen3 external_libs/eigen

	# Configure C++ build
	cmake -S. -B build -G Ninja \
		-DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
		-DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
		-DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DUSE_OPENMP=ON \
		-DUSE_GPU=ON \
		-DUSE_MPI=ON \
		-DBUILD_CLI=ON

	# Prepare Python build dir
	cp -R ./python-package ./lightgbm-python

	cp LICENSE ./lightgbm-python/
	cp VERSION.txt ./lightgbm-python/lightgbm/VERSION.txt

	cp -R ./cmake ./lightgbm-python
	cp CMakeLists.txt ./lightgbm-python
	cp -R ./include ./lightgbm-python
	cp -R ./src ./lightgbm-python
	cp -R ./swig ./lightgbm-python
	ln -sr external_libs lightgbm-python/

	# patch python package to use system library binary

}

build() {
	cd "${_pkgname}-${pkgver}"

	# build C++ library
	ninja -C build

	# build python package
	python -m build --wheel --no-isolation --skip-dependency-check \
		--config-setting=cmake.define.USE_GPU=ON \
		--config-setting=cmake.define.USE_MPI=ON \
		--config-setting=cmake.define.USE_OPENMP=ON \
		--config-setting=cmake.define.__BUILD_FOR_PYTHON=ON \
		--outdir ./dist \
		lightgbm-python
}

package_lightgbm-cl() {
	provides=('lightgbm')
	conflicts=('lightgbm')
	cd "${_pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-lightgbm-cl() {
	provides=('python-lightgbm')
	conflicts=('python-lightgbm')
	depends=('python-numpy' 'python-scipy')
	optdepends=('python-dask' 'python-matplotlib' 'python-pandas' 'python-pyarrow' 'python-scikit-learn')

	cd "${_pkgname}-${pkgver}/"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
