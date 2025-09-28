# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sagemath-doc-git
pkgver=10.8.beta5.r0.gf4adc250dcc
pkgrel=1
_commit=05eebe278f1223e3e456d91d28ff729de5d57628
pkgdesc='HTML documentation for SageMath'
arch=(any)
url='http://www.sagemath.org'
license=(GPL-2.0-or-later)
depends=(mathjax
         python-pplpy)
makedepends=(boost
             cython
             git
             meson
             python-docutils
             python-jupyter-client
             python-jupyter-sphinx
             python-pkgconfig
             python-pyzmq
             python-sphinx-copybutton
             python-sphinx-furo
             python-sphinx-inline-tabs
             sagemath-git)
conflicts=(sagemath-doc)
provides=(sagemath-doc)
source=(git+https://github.com/sagemath/sage
        warnings.patch
        fix-meson-deps.patch
        maxima-5.48.patch)
sha256sums=('SKIP'
            '06ce501d3be154f854bdbabd57f79287aec6b7d1b0ddf3abb904c68f79d51464'
            '8d9d3f597aaac4bddce5665a777924f41fd8f55fb1cbbeeb39277e549b924390'
            '89d91fe14c980e0f6dd484fb90bc5a284449eb45faa8e14b23e6009e2630674e')
options=(!strip) # nothing to strip, save packaging time

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd sage

# Fix build errors due to missing pyx sources
  patch -p1 -i ../warnings.patch
# Fix meson dependencies
  patch -p1 -i ../fix-meson-deps.patch
# Update tests for maxima 5.48
  patch -p1 -i ../maxima-5.48.patch
}

build() {
  meson setup build sage
  meson compile -C build doc-html
}

package() {
  mkdir -p "$pkgdir"/usr/share/doc/sage
  cp -r build/src/doc/html "$pkgdir"/usr/share/doc/sage

# Replace duplicated files by symlinks (Gentoo)
  cd "$pkgdir"/usr/share/doc/sage
  mv html/en/_static{,.tmp}
  for _dir in `find -name _static` ; do
    rm -r $_dir
    ln -s /usr/share/doc/sage/html/en/_static $_dir
  done
  mv html/en/_static{.tmp,}
}
