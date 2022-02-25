# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
pkgver=10.5.0
pkgrel=1
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL2')
depends=('mercurial')
#groups=('hgext')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://files.pythonhosted.org/packages/source/h/hg-evolve/hg-evolve-${pkgver}.tar.gz")
sha512sums=('6353b1922d6e545f92760828d5e7a521b5cd1bc24fbbe7357b45586dafc510229882681941d4492ebc4db1f54eee68ba7c64d3ddc33c9908f21afc0b40adc508')

_pyexe() {
  local _pyexe=$(hg debuginstall -T '{pythonexe}')
  command -v $_pyexe >/dev/null || _pyexe=python
  printf '%s' "$_pyexe"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

check() {
  # Tests depend of Mercurial sources
  if [[ -n "${HGSRC}" ]]; then
    cd "${srcdir}/${pkgname}-${pkgver}/tests"
    "$(_pyexe)" "${HGSRC}/tests/run-tests.py"
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  "$(_pyexe)" setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
  rm -f "${pkgdir}/usr/lib/python"*"/site-packages/hgext3rd/"{__pycache__/,}"__init__"*".py"{,o,c}
}

# vim:set ts=2 sw=2 et:
