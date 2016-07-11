# Maintainer: meepzh <meep.aur@meepzh.com>
pkgname=partio-git
pkgver=1.1.0.r73.g7f3e0d1
pkgrel=4
pkgdesc="Particle IO and manipulation library (git version)"
arch=(i686 x86_64)
url="http://www.disneyanimation.com/technology/partio.html"
license=('custom')
depends=('glut' 'glu' 'seexpr')
optdepends=('python2: Python interface support'
            'swig: Python interface support'
            'zlib: file compression support')
makedepends=('cmake>=2.4.6' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/wdas/partio.git' 'CMakeLists.txt.patch' 'py_CMakeLists.txt.patch')
md5sums=('SKIP' '795fd5b88af781f3d94d51bea44518f3' '306cacec7af0af3adb7876c288881062')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"
  # Fix SeExpr dependency and remove tests
  patch -p1 -i "$srcdir/CMakeLists.txt.patch"
  # Change Python version to 2 to work with SeExpr
  patch -p1 -i "$srcdir/py_CMakeLists.txt.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  mkdir build
  cd ./build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make DESTDIR="$pkgdir/" install
  # Copy custom BSD license
  install -D -m644 "../src/doc/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
