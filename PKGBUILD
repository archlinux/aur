# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Stunts <f.pinamartins at gmail dot com>
# Contributor: damir <damir at archlinux dot org>

pkgname=python-biopython
_pkgname=biopython
pkgver=1.87
pkgrel=1
pkgdesc="Freely available Python tools for computational molecular biology"
arch=('x86_64')
url="http://www.biopython.org"
license=('LicenseRef-Biopython License')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-scipy' 'python-rdflib' 'python-igraph' 'python-reportlab' 'python-networkx' 'python-mmtf' 'python-matplotlib' 'python-coverage')
depends=('python-numpy' 'glibc' 'python' 'python-scipy' 'python-pillow')
# optdepends from https://github.com/biopython/biopython?tab=readme-ov-file#optional-dependencies
optdepends=('python-mysql-connector: for BioSQL module'
            'python-reportlab: for graph generation'
            'python-networkx: for certain niche functions in Bio.Phylo module'
            'python-matplotlib: to plot phylogenetic trees.'
            'python-rdflib: CDAO parser under Bio.Phylo module'
           )
source=("http://www.biopython.org/DIST/${_pkgname}-${pkgver}.tar.gz"
       )
sha512sums=('aed9131f85b28d1b6fb7b1878d6afe2b701eddae092514ec43c69b623c871e16dbf5aaed464709423031169c0c13709bfbc0055e4cdc89c766e4445b959ba7a5')
options=(!debug)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  local pyver=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PYTHONPATH="$PWD/build/lib.linux-${CARCH}-cpython-${pyver}" python Tests/run_tests.py --offline
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
