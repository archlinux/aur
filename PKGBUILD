# Maintainer: Darcy Hu <hot123tea123@gmail.com>

# ThunderSVM without python, R, or MATLAB interface
# python package not working, not sure how to package R package and MATLAB toolbox

pkgname=thundersvm-git
pkgver=r779.5f66a3e
pkgrel=2
pkgdesc="A fast SVM library on GPUs and CPUs"
arch=('x86_64')
url="https://github.com/Xtra-Computing/thundersvm"
license=('APL')
depends=('cuda')
makedepends=('git'
		'cmake'
		'eigen'
		'cuda'
		'gtest'
		'gcc7')
provides=("thundersvm")
conflicts=("thundersvm")
source=('thundersvm::git+https://github.com/hubutui/thundersvm.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/thundersvm"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	rm -rf "$srcdir/thundersvm/build"
	mkdir "$srcdir/thundersvm/build"
	cd "$srcdir/thundersvm/build"
	# change -DUSE_CUDA to OFF if not build with GPU support
	cmake -DCMAKE_C_COMPILER=gcc-7 \
		-DCMAKE_CXX_COMPILER=g++-7 \
		-DUSE_CUDA=ON \
		-DUSE_EIGEN=ON \
		-DBUILD_TESTS=ON ..
	make
	# build python interface
	cd "$srcdir/thundersvm/python"
	python setup.py build
}

check_thundersvm-git() {
	echo "Running test for thundersvm..."
    cd "$srcdir/thundersvm/build"
    make runtest
}

package() {
	cd "$srcdir/thundersvm/build/bin"
	install -Dm755 thundersvm-predict "$pkgdir/usr/bin/thundersvm-predict"
	install -Dm755 thundersvm-train "$pkgdir/usr/bin/thundersvm-train"
	cd "$srcdir/thundersvm/build/lib"
	install -Dm755 libthundersvm.so "$pkgdir/usr/lib/libthundersvm.so"
	cd "$srcdir/thundersvm"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$srcdir/thundersvm/python"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

