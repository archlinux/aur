# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=shell-gpt
_name=${pkgname/-/_}
pkgver=0.9.3
pkgrel=3
pkgdesc="A command-line productivity tool powered by OpenAI's ChatGPT"
arch=(any)
url="https://github.com/TheR1D/shell_gpt"
license=(MIT)
depends=(
  python-click
  python-distro
  python-requests
  python-rich
  python-typer
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
# checkdepends=(
#   python-pytest
#   python-requests-mock
# )

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz"
  "hatch-ignore-vcs.patch"
)
sha256sums=(
  'cdd8545a79cdd706e199e41b0aa119a829c9a687331762e69ea95946d3d729a3'
  'd0eddae80416ad719369ba6d83f101f710ff2c875c78d858bce0cded8ab1c6bd'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="${srcdir}/hatch-ignore-vcs.patch"
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

# Need user input to set up OpenAI API key
# check() {
#   cd "$_archive"

#   python -m pytest --ignore tests/test_integration.py
# }

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
