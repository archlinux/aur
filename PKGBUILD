# Maintainer: Ashwin Vishnu <ashuwish+arch at protonmail dot com>

pkgname='python-numpy-docs-devhelp'
pkgver='1.11.2'
pkgrel=1
pkgdesc="HTML documentation for Python NumPy with GNOME Devhelp support"
arch=('any')
license=('GPL')
url="http://docs.scipy.org/"
depends=('devhelp')
makedepends=('python' 'python-sphinx' 'python-numpydoc' 'python-matplotlib')
conflicts=('python-numpy-doc')
options=('docs')
source=("numpy-$pkgver.tar.gz::https://github.com/numpy/numpy/archive/v$pkgver.tar.gz"
        "git+https://github.com/scipy/scipy-sphinx-theme.git"
        "devhelp-build.patch")
md5sums=('90347ff0b20bd00f2547ef4950ab3523'
         'SKIP'
         '79df7faef04116ce20dc0b0b876a837d')

prepare() {
  # Patch Sphinx Makefile
  cd numpy-$pkgver
  patch -p1 -i "${srcdir}/devhelp-build.patch"
  sed -i 's/\"sidebar\":\ \"left\"/\"sidebar\":\ \"none\"/' "doc/source/conf.py" 
  rm -r doc/scipy-sphinx-theme
  ln -s "${srcdir}/scipy-sphinx-theme" doc/scipy-sphinx-theme

  # Patch CSS for Devhelp
  cd "${srcdir}/scipy-sphinx-theme/_theme/scipy/static/css/"
  sed -i 's/width:\ 80%/width:\ 100%/'              spc-extend.css
  sed -i 's/font-size:\ 12px/font-size:\ 75%/g'     spc-extend.css 
  sed -i 's/font-size:\ 16.25px/font-size:\ 100%/g' spc-bootstrap.css 
  sed -i 's/font-size:\ 13px/font-size:\ 100%/g'    spc-bootstrap.css 
  sed -i 's/font-size:\ 12px/font-size:\ 90%/g'     spc-bootstrap.css 
  sed -i 's/font-size:\ 11px/font-size:\ 80%/g'     spc-bootstrap.css 
  sed -i 's/line-height:\ 19px/line-height:\ 150%/' spc-bootstrap.css 
}

build() {
  cd "${srcdir}/numpy-${pkgver}/doc"
  make devhelp \
    PYTHON="python" \
    SPHINXBUILD="sphinx-build"
}

package() {
  local _pkgparent="python-numpy"

  # Copy files
  install -m 755 -d "${pkgdir}/usr/share/doc/${_pkgparent}/html"
  cp -rf "${srcdir}/numpy-${pkgver}/doc/build/devhelp"/* \
         "${pkgdir}/usr/share/doc/${_pkgparent}/html/"
  find "${pkgdir}/usr/share/doc/${_pkgparent}/html/" -type f -exec chmod 0644 {} \;
  find "${pkgdir}/usr/share/doc/${_pkgparent}/html/" -type d -exec chmod 0755 {} \;
  mv "${pkgdir}/usr/share/doc/${_pkgparent}/html/NumPy.devhelp.gz" \
     "${pkgdir}/usr/share/doc/${_pkgparent}/html/${_pkgparent}.devhelp.gz"

  # Add Devhelp book
  install -m 755 -d "${pkgdir}/usr/share/devhelp/books"
  ln -s "/usr/share/doc/${_pkgparent}/html" "${pkgdir}/usr/share/devhelp/books/${_pkgparent}"
}
