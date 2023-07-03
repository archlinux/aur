# Maintainer: Daudi Wampamba Bandres <me@daudi.dev>
pkgname='intel-llvm-git'
pkgver=r477981.a8b03562c5f3
pkgrel=1
pkgdesc="Intel LLVM"
arch=("x86_64")
url="https://github.com/intel/llvm"
license=('custom:Apache License v2.0 with LLVM Exception')
groups=()
depends=('cuda' 'hip-runtime-amd')
makedepends=('git' 'cmake' 'python' 'ninja' 'cuda' 'opencl-headers')
checkdepends=("python-psutil")
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=('llvm::git+https://github.com/intel/llvm#branch=sycl' "intel-llvm.sh" "intel-llvm.conf")
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/llvm"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/llvm"
		python ./buildbot/configure.py --cuda --hip -t release --cmake-opt="-DLLVM_INSTALL_UTILS=ON" --cmake-opt="-DSYCL_PI_TESTS=OFF"
		python ./buildbot/compile.py
}

#check() {
#	cd "$srcdir/llvm"
#		python ./buildbot/check.py -o "$srcdir/llvm/build"
#}

package() {
	cd "$srcdir/llvm"
		install -Dm644 ./LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
		install -dm755 "$pkgdir/opt/sycl"
		cp -Ra "$srcdir/llvm/build/." "$pkgdir/opt/sycl"
		find "${pkgdir}/opt/sycl" -type d -exec chmod a+rx {} +
		find "${pkgdir}/opt/sycl" -type f -exec chmod a+r {} +
	cd "$srcdir"
		install -Dm755 ./intel-llvm.sh "$pkgdir/etc/profile.d/intel-llvm.sh"
		install -Dm644 ./intel-llvm.conf "$pkgdir/etc/ld.so.conf.d/intel-llvm.conf"
}
