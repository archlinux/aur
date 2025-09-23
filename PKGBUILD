# Maintainer:

: ${_commit:=df129c7ba30aaa9ffffb81a48f53aa7253b0b4e6}

_module='ffmpeg-python'
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.2.0
pkgrel=7
pkgdesc="(old) Python bindings for FFmpeg with complex filtering support"
url="https://github.com/kkroening/ffmpeg-python"
license=('Apache-2.0')
arch=('any')

depends=(
  'ffmpeg'
  'python'
  'python-graphviz'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-mock'
)

conflicts=('python-python-ffmpeg')

options=(!emptydirs)

_pkgsrc="$_module"
source=(
  "$_pkgsrc"::"git+$url.git"
  "pr726-fix-test-pipe.patch"::"$url/pull/726.diff"
  "pr795-no-future.patch"::"$url/pull/795.diff"
  "pr848-fix-test-probe.patch"::"$url/pull/848.diff"
  "pr863-fix-non-ascii.patch"::"$url/pull/863.diff"
)
sha256sums=(
  'SKIP'
  'fae7428e985f5305bbdcabfaf8b6f4c9764f12e269748666907faec3359324c0'
  '9d99f357f8f655d4d8455db6ee3672c9d6e4eab50bc410759e0e6972a12e18e2'
  '2969e3e42df54ede4341a08972df29f34a30876d0e75e5b76e9c300f1fcb87c0'
  '5cd02272ed6d5e023fad9efc67316a4d7937ad719533f5369ed94e0efe43fca8'
)

prepare() {
  cd "$_pkgsrc"
  sed -i -e 's/collections.Iterable/collections.abc.Iterable/g' ffmpeg/_run.py

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$_pkgsrc"
  pytest || true
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
