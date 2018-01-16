pkgname='gimp-plugin-gmic-git'
_name='gmic'
pkgver=v.218.r4.g6267a65
pkgrel=2
pkgdesc="Front-end to the image processing framework G'MICQ"
url="https://github.com/c-koi/${_name}-qt"
depends=('gimp' 'libpng' 'zlib' 'fftw' 'curl' 'qt5-base')
license=('GPL3')
arch=('i686' 'x86_64')
source=("git+${url}.git" "git+https://github.com/dtschump/${_name}.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${_name}-qt"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "${srcdir}"
	make -C ${_name}/src CImg.h gmic_stdlib.h
	cd "${_name}-qt"
	qmake HOST=gimp
	make
}

package() {
	cd "${srcdir}/${_name}-qt"
	mkdir -p "${pkgdir}/usr/lib/gimp/2.0/plug-ins/"
	cp ${_name}_gimp_qt ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
}

