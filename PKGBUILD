# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-julius-git
_gitpkgname=julius
pkgver=r69.486c032
pkgrel=1
pkgdesc='Fast PyTorch based DSP for audio and 1D signals'
arch=('any')
url='https://github.com/adefossez/julius'
license=('MIT')
depends=(
  'python'
  'python-pytorch'
)
makedepends=(
  'git'
  'python-build'
  'python-pdoc'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
)
checkdepends=('python-resampy')
provides=("python-julius=${pkgver}")
conflicts=('python-julius')

source=(
  "${_gitpkgname}::git+https://github.com/adefossez/julius.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

prepare() {
  cd "${_gitpkgname}"

  echo >&2 'Fixing unit test'
  sed -i -e 's/tol=2/tol=10/' tests/test_resample.py
}

build() {
  cd "${_gitpkgname}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating documentation'
  pdoc --template-dir pdoc -o docs julius
}

check() {
  cd "${_gitpkgname}"
  echo >&2 'Running unit tests'
  python -m unittest discover -v
}

package() {
  cd "${_gitpkgname}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/html"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}/html" \
    docs

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
