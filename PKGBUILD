# Maintainer: Daudi Wampamba Bandres <me@daudi.dev>
pkgname='intel-llvm-git'
pkgver=r477988.130919b5bc9c
pkgrel=1
pkgdesc="Intel oneAPI DPC++ Compiler, sycl branch"
arch=("x86_64")
url="https://github.com/intel/llvm"
license=('custom:Apache License v2.0 with LLVM Exception')
depends=('cuda' 'hip-runtime-amd')
makedepends=('git' 'cmake' 'python' 'ninja')
checkdepends=("python-psutil")
source=('intel-llvm::git+https://github.com/intel/llvm.git#branch=sycl' "intel-llvm.sh" "intel-llvm.conf")
md5sums=('SKIP'
         '66c25f2ada33c8ac8b706a084383dc11'
         '847be655cc4b75f59e1a4c8b433ee3a9')

pkgver() {
	cd "$srcdir/intel-llvm"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/intel-llvm"
		python ./buildbot/configure.py --cuda --hip -t release --cmake-opt="-DLLVM_INSTALL_UTILS=ON" --cmake-opt="-DSYCL_PI_TESTS=OFF"
		python ./buildbot/compile.py
}

#check() {
#	cd "$srcdir/intel-llvm"
#		python ./buildbot/check.py -o "$srcdir/llvm/build"
#}

package() {
	cd "$srcdir/intel-llvm"
		install -Dm644 ./LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
		install -dm755 "$pkgdir/opt/sycl"
		cp -Ra "$srcdir/intel-llvm/build/." "$pkgdir/opt/sycl"
		find "${pkgdir}/opt/sycl" -type d -exec chmod a+rx {} +
		find "${pkgdir}/opt/sycl" -type f -exec chmod a+r {} +
	cd "$srcdir"
		install -Dm755 ./intel-llvm.sh "$pkgdir/etc/profile.d/intel-llvm.sh"
		install -Dm644 ./intel-llvm.conf "$pkgdir/etc/ld.so.conf.d/intel-llvm.conf"
}
