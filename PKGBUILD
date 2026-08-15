pkgname=svgalib-git
_gitname=svgalib
pkgver=1.9.27.r0.gefe6e10
pkgrel=1
pkgdesc="A low-level SuperVGA graphics library"
arch=('i686' 'x86_64')
url="http://www.svgalib.org/"
conflicts=(svgalib)
license=('GPL')
depends=('perl')
makedepends=('git')
source=('git+https://github.com/akosela/svgalib.git'
        '0001-fix-parallel-build-race.patch'
        '0002-remove-ldconfig-call-top-makefile.patch'
        '0003-remove-ldconfig-call-src-makefile.patch')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
    cd "${srcdir}/${_gitname}"
    git checkout master
    patch -Np1 -i "${srcdir}/0001-fix-parallel-build-race.patch"
    patch -Np1 -i "${srcdir}/0002-remove-ldconfig-call-top-makefile.patch"
    patch -Np1 -i "${srcdir}/0003-remove-ldconfig-call-src-makefile.patch"
}

pkgver() {
	cd "${srcdir}/${_gitname}"
	local ver=$(git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g')
    [[ -z $ver ]] && ver=$(git describe --long --always)
    echo "$ver"
}

package() {
  install -dm755 "${pkgdir}"/usr/lib
  
  cd ${_gitname}
  
  make prefix="${pkgdir}"/usr \
	datadir="${pkgdir}"/etc/vga \
	NO_HELPER=y \
	install
}
