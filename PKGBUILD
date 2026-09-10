# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Stunts <f.pinamartins at gmail dot com>
# Contributor: damir <damir at archlinux dot org>

pkgname=python-biopython
_pkgname=biopython
pkgver=1.88
_pkgver="${pkgver//./}"
pkgrel=3
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
source=("https://github.com/biopython/biopython/archive/refs/tags/biopython-${_pkgver}.tar.gz"
       )
sha512sums=('325e0663be4ffaa4b1dfb74cd6372780b7c4e625dec0e69207c08564863fbeb3c7f8fa69df5f1985909c2256e8324088bb20a095740fbec286e5fe292863dbe2')
options=(!debug)

build() {
  cd "${srcdir}/biopython-biopython-${_pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  local pyver=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
  cd "${srcdir}/biopython-biopython-${_pkgver}"
  PYTHONPATH="$PWD/build/lib.linux-${CARCH}-cpython-${pyver}" python Tests/run_tests.py --offline
}

package() {
  cd "${srcdir}/biopython-biopython-${_pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
