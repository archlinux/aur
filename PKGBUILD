# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=imediff
pkgver=3.3.1
pkgrel=1
pkgdesc="ncurses-based 2/3 file merge tool"
arch=('any')
url="https://github.com/osamuaoki/imediff"
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('29a9742d6082cb43d75fabb013ee84ddac3fb4a47e4b483690b33c676fb79d30')

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
