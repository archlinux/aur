# Maintainer: meepzh <meep.aur@meepzh.com>
pkgname=seexpr-git
pkgver=2.11.r0.ga5f02bb
pkgrel=1
pkgdesc="An embeddable expression evaluation engine (git version)"
arch=(i686 x86_64)
url="http://www.disneyanimation.com/technology/seexpr.html"
license=('custom')
optdepends=('python2-pyqt4: required for SeExpr editor')
makedepends=('cmake>=2.4.6' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/wdas/SeExpr.git'
        'build-info.patch'
        'CMakeLists.txt.patch'
        'Editor_CMakeLists.txt.patch')
md5sums=('SKIP'
         'bb56b587bca21debebf86b7adb6242f1'
         '0b04cc77edebf6d364767cad0a988ef2'
         '69721fc7e11747cfbc7f0712b4975f79')

pkgver() {
  cd "$srcdir/SeExpr"
  # Cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"
  # Remove pyqtconfig module dependency
  patch -p1 -i "$srcdir/build-info.patch"
  # Remove demos, tests, and docs
  patch -p1 -i "$srcdir/CMakeLists.txt.patch"
  # Use Python2 for editor if available
  patch -p1 -i "$srcdir/Editor_CMakeLists.txt.patch"
}

build() {
  cd "$srcdir/SeExpr"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/SeExpr/build"
  make DESTDIR="$pkgdir/" install
  # Copy custom Apache license
  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
