# Maintainer: Jonathan Scott Tinkham <sctincman@gmail.com>

pkgname=freeocl-git
_pkgname=freeocl
pkgver=r326.7b503f3
_pkgver=0.3.6
pkgrel=1
pkgdesc='Implementation of OpenCL 1.2 specifications targeting CPUs'
arch=(i686 x86_64)
url='https://code.google.com/p/freeocl/'
license=(LGPL)
depends=(libatomic_ops gcc)
provides=(libcl opencl-headers)
conflicts=(libcl opencl-headers)
makedepends=(cmake)
#options=(staticlibs !makeflags !strip)
source=('freeocl::git+https://github.com/sctincman/freeocl.git'
        'cmake.patch'
        'install-headers.patch')
md5sums=(SKIP
         89de8dd7e7086f058e49925feddc83f8
	 2a74e9b5c87dc6e91b6c4a765a50af2d)

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/$_pkgname
    patch -p0 < ../cmake.patch
    patch -p0 < ../install-headers.patch
    
    mkdir -p $srcdir/build
}

build() {
    cd  $srcdir/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../$_pkgname
    make
}

package() {
    cd $srcdir/build
    make DESTDIR=${pkgdir} install
}
