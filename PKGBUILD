# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sagemath-doc-git
pkgver=10.8.beta7.r0.g9f905404644
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
        maxima-5.48.patch)
sha256sums=('SKIP'
            '06ce501d3be154f854bdbabd57f79287aec6b7d1b0ddf3abb904c68f79d51464'
            'b7114f2828d7e6eaaa0b7221f87cdd8c956f7710bf598b33b6225544faff5d9a')
options=(!strip) # nothing to strip, save packaging time

pkgver() {
  cd sage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd sage

# Fix build errors due to missing pyx sources
  patch -p1 -i ../warnings.patch
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
