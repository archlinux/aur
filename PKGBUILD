# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: TDY <tdy@gmx.com>
pkgname=hgview
pkgver=1.14.0
pkgrel=2
pkgdesc="Mercurial interactive Qt based history viewer"
arch=('any')
url="https://www.logilab.org/project/${pkgname}"
license=(GPL)
depends=(python-urwid python-pyinotify python-pygments python-qscintilla-qt5 python-docutils)
makedepends=(python-setuptools mercurial asciidoc xmlto)
source=(http://download.logilab.org/pub/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('711689c35f47b3126d996dd7550a8446875065964e7dd6cb9e287ca70847b2d5fe9c1643a3ddcb4b6b17918f2dbeb91f794e1d2f0fdded0dfd3c6ba5522d12e1')

prepare() {
  # https://src.fedoraproject.org/rpms/hgview/blob/f35/f/hgview-man-path.patch
  sed -i 's/^PREFIX=\/usr\/local/PREFIX=\/usr/' ${pkgname}-${pkgver}/doc/Makefile
  sed -i 's/^MANDIR=$(PREFIX)\/man/MANDIR=$(PREFIX)\/share\/man/' ${pkgname}-${pkgver}/doc/Makefile
  sed -i 's/^MANDIR=$(PREFIX)\/man/MANDIR=$(PREFIX)\/share\/man/' ${pkgname}-${pkgver}/doc/Makefile
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/hgext3rd"
}
