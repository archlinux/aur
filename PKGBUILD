# Maintainer: meepzh <meep.aur@meepzh.com>
pkgname=seexpr-git
pkgver=3.0.beta.2.r2.g743f732
pkgrel=1
pkgdesc="An embeddable expression evaluation engine (git version)"
arch=(i686 x86_64)
url="http://www.disneyanimation.com/technology/seexpr.html"
license=('custom')
optdepends=('llvm>=3.8.0: LLVM backend support'
            'python2-pyqt4: Editor support')
makedepends=('cmake>=2.4.6' 'git' 'python2-sip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/wdas/SeExpr.git'
        'build.patch')
md5sums=('SKIP'
         '156977932afc69ff24f85be68a7357b6')

pkgver() {
  cd "$srcdir/SeExpr"
  # Cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/SeExpr"
  patch -p0 -i "../build.patch"
  mkdir "$srcdir/SeExpr/src/SeExpr/generated"
  touch "$srcdir/SeExpr/src/SeExpr/generated/ExprParser.tab.h"
  touch "$srcdir/SeExpr/src/SeExpr/generated/ExprParser.cpp"
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
