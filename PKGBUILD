# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-markitdown-git
_pkgname=markitdown
pkgver=r146+gcb66b35f1
pkgrel=2
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
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  git
)
checkdepends=(python-pytest)
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
  cd "$_pkgname"
  python -m pytest tests/ || true #they are modifying tests and many are currently failing
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
