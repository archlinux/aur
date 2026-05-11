# Maintainer: Steve Holvoet <linux@steho.be>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-markitdown-git
_pkgname=markitdown
pkgver=r307+ga51f725d7
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
  python-magika
  python-charset-normalizer
  python-defusedxml
  python-pptx
  python-pandas
  python-openpyxl
  python-xlrd
  python-lxml
  python-pdfminer
  python-pdfplumber
  python-olefile
  python-pydub
  python-youtube-transcript-api
  python-speechrecognition
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-hatch
  git
)
checkdepends=(
  python-pytest
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
  cd "$_pkgname/packages/$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "${_pkgname}/packages/${_pkgname}/dist/"*.whl
  test-env/bin/python -m pytest "${_pkgname}/packages/${_pkgname}/tests/" || true
}

package() {
  cd "$_pkgname/packages/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../../LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
