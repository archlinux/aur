# Maintainer: Paulo Matias <matias@ufscar.br>
# Contributor: xiota

_pkgname="prjapicula"
pkgname="$_pkgname-git"
pkgver=0.15.r33.g15614ef
_fuzzerver=1.9.8
pkgrel=1
pkgdesc="Project Apicula bitstream documentation for Gowin FPGAs"
url="https://github.com/YosysHQ/apicula"
_pkgsrc="apicula"
_fuzzer="fuzzer-$_fuzzerver"
_fuzzerimg="docker.io/pepijndevos/apicula:$_fuzzerver"
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
  'apptainer'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  apptainer pull -F $_fuzzer.sif docker://$_fuzzerimg
  apptainer sif dump 4 $_fuzzer.sif >$_fuzzer.squashfs
  mkdir -p $_fuzzer
  unsquashfs -dest $_fuzzer $_fuzzer.squashfs usr/src/gowin 'usr/lib/x86_64-linux-gnu/libfontconfig.so*'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check

  LD_LIBRARY_PATH="$srcdir/$_fuzzer/usr/lib/x86_64-linux-gnu" \
    GOWINHOME="$srcdir/$_fuzzer/usr/src/gowin" \
    make
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
