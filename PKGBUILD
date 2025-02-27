# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=imediff
pkgver=3.4.0
pkgrel=1
pkgdesc="ncurses-based 2/3 file merge tool"
arch=('any')
url="https://github.com/osamuaoki/imediff"
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('543aff2bd192d1d8dadc86631ae5056048d7099e032a85f1736a0c9ceea4fcc5')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i "/^imediff_install = .*/d" pyproject.toml
  sed -i "s/@@version@@/${pkgver}/" src/imediff/data/git-ime.in
}

build() {
  cd "${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm755 src/imediff/data/git-ime.in "${pkgdir}/usr/bin/git-ime"
  install -Dm755 src/imediff/data/imediff "${pkgdir}/usr/lib/git-core/mergetools/imediff"
  install -Dm644 src/imediff/data/git-ime.1 "${pkgdir}/usr/share/man/man1/git-ime.1"
  install -Dm644 src/imediff/data/imediff.1 "${pkgdir}/usr/share/man/man1/imediff.1"
}
