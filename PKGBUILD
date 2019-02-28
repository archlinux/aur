_git_url=https://github.com/RadeonOpenCompute/ROCm-OpenCL-Runtime.git
_git_branch=roc-2.1.x

pkgname=rocm-opencl-git
pkgver=2.1.r0.d3bfd48
pkgrel=1
pkgdesc="ROCm OpenCL™ Compatible Runtime"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/ROCm-OpenCL-Runtime"
license=('MIT')
groups=()
depends=(rocr-runtime)
makedepends=(cmake gcc git ocaml-findlib python2-z3 repo gtest) 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=()

prepare() {
	cd "$srcdir"
	
	# fetch everything as described in project's README
	repo init -u ${_git_url} -b ${_git_branch} -m opencl.xml || exit 1
	repo sync --force-sync || exit 1
}

pkgver() {
	cd "$srcdir/opencl"

	# Git tags _sometimes_ available
	last_tag=$(git describe --tags $(git rev-list --tags --max-count=1))
	ver=${_git_branch#roc-}
	commits_since_tag=$(git rev-list --count ${last_tag}..HEAD)
	short_hash=$(git rev-parse --short HEAD)

	printf "${ver%x}r%s.%s" ${commits_since_tag} ${short_hash}
}

build() {
	cd "$srcdir/opencl"

	mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/rocm/opencl -DCLANG_ENABLE_STATIC_ANALYZER=ON ..
	make
}

package() {
	cd "$srcdir/opencl/build"
	make DESTDIR="$pkgdir/" install

	# OpenCL vendor file
	mkdir -p "$pkgdir/etc/OpenCL/vendors"
	echo "/opt/rocm/opencl/lib/x86_64/libamdocl64.so" > "$pkgdir/etc/OpenCL/vendors/rocm-opencl64.icd"

    mkdir -p "$pkgdir/etc/ld.so.conf.d/"
    echo "/opt/rocm/opencl/lib" > "$pkgdir/etc/ld.so.conf.d/rocm-opencl.conf"
    ln -s "/opt/rocm/opencl/lib/libOpenCL.so.1.2" "$pkgdir/opt/rocm/opencl/lib/libOpenCL.so" # not created automatically by ldconfig
}
