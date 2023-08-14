# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-py-serializable
_gitpkgname=serializable
pkgver=0.12.0
pkgrel=1
pkgdesc='Serialize and deserialize Python objects to and from JSON and XML'
arch=('any')
url='https://github.com/madpah/serializable'
license=('Apache')
depends=('python-defusedxml')
checkdepends=('python-lxml' 'xmldiff')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/madpah/serializable/archive/v${pkgver}.tar.gz"
  'github-pr-7.patch'
)

sha512sums=(
  '805d964541c3ab067081fa698cf31e8e220ae714afe1760b5f59fff8add9c19464c9d644fa6864da1488d5aa4ab5ae5607af5ad0f0f46f2cf02363e101338159'
  '45e608c89acbaa5bc3dab594856fd8374948f8a062b51d80ac744ae5b4d2dd83d34731bb6f513f6c02c06b73bf49da7daa7589c8d390eac2ca3a0387654c4c20'
)

prepare() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  # Temporary workaround to keep poetry from including `LICENSE` in
  # the `site-packages` folder directly. Remove this workaround
  # as soon as upstream has included the commit in a stable release.
  #
  # See also:
  # https://github.com/madpah/serializable/commit/9bc4abc
  patch -p1 < "${srcdir}/github-pr-7.patch"
}

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m unittest
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
