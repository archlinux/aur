# Maintainer: Andriy Mykhaylyk <erp dot lsf at gmail dot com>
# Maintainer: Lorenzo Tomei <tomeil at tiscali dot it>
# Maintainer: eelvex <eelvex at gmail dot com>

pkgname=j9-git
pkgver=r2388.ad0ca1c6
pkgrel=1
pkgdesc='J is a modern, high-level, general-purpose, high-performance programming language'
arch=('x86_64')
url='http://www.jsoftware.com'
license=('GPL3')
depends=('qt5-webengine' 'qt5-websockets' 'qt5-multimedia' 'qt5-svg' 'pcre2')
optdepends=('wget: for web/gethttp addon'
            'expat: for api/expat addon'
            'fftw: for math/fftw addon'
            'lapack: for math/lapack addon')
makedepends=('git'
             'clang'
	     'nasm')
source=("${pkgname}::git+https://github.com/jsoftware/jsource.git#branch=master"
        'qtide-git::git+https://github.com/jsoftware/qtide.git#branch=master')
md5sums=('SKIP'
         'SKIP')
build() {
  # jsource
  cd "${srcdir}/${pkgname}/make2"
  CC=clang
  export CC
  ./build_all.sh
  ./cpbin.sh
  # qtide
  cd "${srcdir}/qtide-git/lib"
  qmake && make
  cd "${srcdir}/qtide-git/main"
  qmake && make
}

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/lib/j9/bin"
  cp -a "${pkgname}/jlibrary/bin/"* "${pkgdir}/usr/lib/j9/bin/"
  cp -a "${pkgname}/bin/linux/"*/* "${pkgdir}/usr/lib/j9/bin/"
  cp -a "qtide-git/bin/linux-${CARCH}/release/"* "${pkgdir}/usr/lib/j9/bin/"
  echo "${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz (Arch Linux package)" > "${pkgdir}/usr/lib/j9/bin/installer.txt"
}
