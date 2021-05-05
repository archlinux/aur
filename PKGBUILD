# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
pkgver=10.3.1
pkgrel=1
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL2')
depends=('mercurial')
#groups=('hgext')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://files.pythonhosted.org/packages/source/h/hg-evolve/hg-evolve-${pkgver}.tar.gz")
sha512sums=('832b5f051ec0be94df406ec9899f6fb122a1799b0da4647d720889849373471f5541de45895b77e61f9e7d3888e22db31ecc9b79bbb43651e94863c88c1c4fed')

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
