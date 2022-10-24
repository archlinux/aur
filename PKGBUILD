# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-plotink
_gitpkgname=plotink
pkgver=1.7.0
pkgrel=1
pkgdesc='Common files for Inkscape extensions to drive EggBot, WaterColorBot, and similar plotter-type machines'
arch=('any')
url='https://github.com/evil-mad/plotink'
license=('MIT')
depends=('python-packaging' 'python-pyserial')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/evil-mad/plotink/archive/refs/tags/${pkgver}.tar.gz"
  'github-pr-49.patch'
)

sha512sums=(
  '96972dc6cc15889b66d47c932949bb8b505b1e03038e9ee7adb9364e4ac0bf7c5bf64712dd636800525529de32b7914e6ce479fc7bc2e69ece9e8b3346047dc2'
  '159ca914813e66cc37d44f036bcd67dc417a0e3f2e060949bcac2ba3e9516ff44578a165192625c2f4c846d2b24d9ac6f2e00861bd82b29847e4cf8cf549bab8'
)

prepare() {
  # https://github.com/evil-mad/plotink/pull/49
  patch -p1 -d "${srcdir}/${_gitpkgname}-${pkgver}" \
    < github-pr-49.patch
}

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${_gitpkgname}-${pkgver}/README.md"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${_gitpkgname}-${pkgver}/LICENSE"
}
