# Maintainer: Paulo Matias <matias@ufscar.br>
# Contributor: xiota

_pkgname="prjapicula"
pkgname="$_pkgname-git"
pkgver=0.15.r33.g15614ef
pkgrel=1
pkgdesc="Project Apicula bitstream documentation for Gowin FPGAs"
url="https://github.com/YosysHQ/apicula"
_pkgsrc="apicula"
source=(
  "$_pkgsrc"::"git+$url.git"
)
sha256sums=(
  'SKIP'
)
license=('MIT')
arch=('x86_64')

depends=(
  'python'
  'python-crc' # AUR
  'python-numpy'
  'python-openpyxl'
  'python-pandas'
  'python-pillow'
)

makedepends+=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
  'podman'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check

  podman pull pepijndevos/apicula:1.9.8
  for _chip in GW1N-1 GW1NZ-1 GW1N-9 GW1N-9C GW1N-4 GW1NS-2 GW1NS-4 GW2A-18 GW2A-18C; do
    podman run -v $(pwd):/usr/src/apicula pepijndevos/apicula:1.9.8 make apycula/${_chip}.pickle
  done
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
