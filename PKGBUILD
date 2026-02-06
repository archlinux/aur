# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-whey-pth
_name=${pkgname#python-}
pkgver=0.0.6
pkgrel=1
pkgdesc='Extension to whey to support .pth files'
arch=('any')
url='https://whey-pth.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-dom-toml'
  'python-whey'
)
makedepends=(
  'git'
  'python-build'
  # 'python-hatchling'
  # 'python-hatch-requirements-txt'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=()
source=("${_name}::git+https://github.com/repo-helper/whey-pth.git#tag=v$pkgver")
sha512sums=('b56b0226beed216438d750e192963ebd06d825fd46885944da88822b40133417de7df8178d1450d3df5d8c437cdab08bd7c27d81d8f7c078705bfd838a46274f')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    sed -r \
    -e '/^requires =/ s/"([A-Za-z0-9._-]+)[^"]*"/"\1"/g' \
    -i pyproject.toml
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
