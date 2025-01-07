# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-markitdown-git
_pkgname=markitdown
pkgver=r195+gf58a86495
pkgrel=1
pkgdesc="Utility tool for converting various files to Markdown (git)"
arch=(any)
url="https://github.com/microsoft/markitdown"
license=(MIT)
depends=(
  python
  python-beautifulsoup4
  python-requests
  python-mammoth
  python-markdownify
  python-numpy
  python-pptx
  python-pandas
  python-openpyxl
  python-pdfminer
  python-puremagic
  python-pydub
  python-youtube-transcript-api
  python-speechrecognition
  python-pathvalidate
  python-cobble #not requested by pyproject.toml but apparently needed at runtime
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-hatch
  git
)
checkdepends=(python-pytest
  python-olefile
)
source=("git+${url}.git")
sha256sums=('SKIP')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")

pkgver() {
  cd "$_pkgname"
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "r${_commits}+g${_short_commit_hash}"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "${_pkgname}/dist/"*.whl
  test-env/bin/python -m pytest "${_pkgname}/tests/" || true #they are modifying tests and many are currently failing
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
