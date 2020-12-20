# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
pkgver=10.1.0
pkgrel=1
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL2')
depends=('mercurial')
#groups=('hgext')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://files.pythonhosted.org/packages/source/h/hg-evolve/hg-evolve-${pkgver}.tar.gz")
sha512sums=('26333db8f71a6116ce9d8cbb21940befa573c1bbba3361af4776b4b2d3a3eca33b2c01ab5b5c9dc95810fb89f1e84b2ad85bf0a48989f5c583ebfca922d7d4da')

_pyexe=$(LC_ALL=C hg debuginstall | perl -nE "/Python executable \((.*?)\)/ and print \$1")
command -v $_pyexe >/dev/null || _pyexe=python

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

check() {
  # Tests depend of Mercurial sources
  if [[ -n "${HGSRC}" ]]; then
    cd "${srcdir}/${pkgname}-${pkgver}/tests"
    "$_pyexe" "${HGSRC}/tests/run-tests.py"
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  "$_pyexe" setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
  rm -f "${pkgdir}/usr/lib/python"*"/site-packages/hgext3rd/"{__pycache__/,}"__init__"*".py"{,o,c}
}

# vim:set ts=2 sw=2 et:
