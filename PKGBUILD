# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=imediff
pkgver=2.8
pkgrel=1
pkgdesc="ncurses-based 2/3 file merge tool"
arch=('any')
url="https://github.com/osamuaoki/imediff"
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9317f274110dc9604d9f64f7b7eaf8bad115014a7833c089b4b21f0a51885b86')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i "/^version_file = .*/a fallback_version = \"${pkgver}\"" pyproject.toml
  sed -i "/^imediff_install = .*/d" pyproject.toml
  sed -i "/^imediff.*data\/.*/d" pyproject.toml
}

build() {
  cd "${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm755 usr/bin/git-ime "${pkgdir}/usr/bin/git-ime"
  install -Dm755 usr/lib/git-core/mergetools/imediff "${pkgdir}/usr/lib/git-core/mergetools/imediff"
  install -Dm644 usr/share/man/man1/git-ime.1 "${pkgdir}/usr/share/man/man1/git-ime.1"
  install -Dm644 usr/share/man/man1/imediff.1 "${pkgdir}/usr/share/man/man1/imediff.1"
}
