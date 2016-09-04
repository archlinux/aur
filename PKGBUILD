# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Arne Caspari <arne.caspari@unicap-imaging.org>

pkgname=python2-docs-devhelp
pkgver=2.7.12
pkgrel=1
pkgdesc="Set of HTML documentation for Python 2.x with GNOME-Devhelp support."
arch=('any')
makedepends=('python2' 'python2-sphinx')
provides=('python2-docs')
url="http://docs.python.org/"
license=('GPL')
options=('docs')
source=("https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
	"devhelp-build-py2.patch"
        "layout.html"
        "theme.conf")
sha256sums=('d7837121dd5652a05fef807c361909d255d173280c4e1a4ded94d73d80a1f978'
            'f5a9fa2dff4b93f3f15067ed775a32fe127858b6d87b05db8a0dc000124c6dab'
            '1d251413d426f4275259596eb22c6bc35986781b1e57c1d07d3bd97ac978108f'
            'bf8686e1d34f7a6b0ac3ee3b2ebcd4e99cf1bea0a690a8ba34b3a1dee6e38d6d')

prepare() {
  cd "${srcdir}/Python-${pkgver}"
  patch -p1 -i "${srcdir}/devhelp-build-py2.patch"
  # Add custom Sphinx theme fixed for Devhelp
  install -m 755 -d "Doc/tools/basic-nodoctype"
  install -m 644 -t "Doc/tools/basic-nodoctype" "${srcdir}/layout.html"
  install -m 644 -t "Doc/tools/basic-nodoctype" "${srcdir}/theme.conf"
}

build() {
  cd "${srcdir}/Python-${pkgver}/Doc"
  make devhelp \
    PYTHON="python2" \
    SPHINXBUILD="sphinx-build2" \
    SPHINXOPTS="-D html_theme_path='tools' -D html_theme='basic-nodoctype'"
}

package() {
  install -m 755 -d "${pkgdir}/usr/share/doc/python2/html"
  install -m 755 -d "${pkgdir}/usr/share/devhelp/books"
  cp -rf "${srcdir}/Python-${pkgver}/Doc/build/devhelp"/* \
         "${pkgdir}/usr/share/doc/python2/html/"
  find "${pkgdir}/usr/share/doc/python2/html/" -type f -exec chmod 0644 {} \;
  find "${pkgdir}/usr/share/doc/python2/html/" -type d -exec chmod 0755 {} \;
  mv "${pkgdir}/usr/share/doc/python2/html/Python.devhelp.gz" \
     "${pkgdir}/usr/share/doc/python2/html/python2.devhelp.gz"
  ln -s "../../doc/python2/html" "${pkgdir}/usr/share/devhelp/books/python2"
}
