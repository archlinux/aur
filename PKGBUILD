# Maintainer:

_pkgname="cvise"
pkgname="$_pkgname-git"
pkgver=2.12.0.r172.gfbbe8fc
pkgrel=1
pkgdesc="Super-parallel Python port of the C-Reduce"
url="https://github.com/marxin/cvise"
license=('NCSA')
arch=('x86_64')

depends=(
  'clang'
  'flex'
  'python-chardet'
  'python-jsonschema'
  'python-msgspec' # AUR
  'python-pebble'  # AUR
  'python-psutil'
  'python-zstandard'
  'tree-sitter-cli'
  'unifdef'
)
makedepends=(
  'cmake'
  'git'
  'llvm'
  'ninja'
  'python'
)
checkdepends=(
  'python-pytest'
  'python-pytest-mock'
  'python-pytest-subprocess'
)
optdepends=('colordiff')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() (
  cd "$_pkgsrc"
  local _tmp _tag _version _revision _hash
  _tmp=$(git tag | grep -Ev '[A-Za-z][A-Za-z]' | sed -E 's&([^0-9]*)(\S+)$&\2 \1\2&' | sort -rV | head -1)
  _version=$(cut -f1 -d' ' <<< ${_tmp:?})
  _tag=$(cut -f2 -d' ' <<< ${_tmp:?})
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_commit:?}"
)

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBEXECDIR='lib'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --rerun-failed --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  # remove tests
  rm -rf "$pkgdir/usr/share/cvise/tests"

  # specify python version to prevent untracked pyc files
  local _pyver_major _pyver_minor
  _pyver_major=$(python -c 'import sys; print(sys.version_info.major)')
  _pyver_minor=$(python -c 'import sys; print(sys.version_info.minor)')

  eval "depends+=(
    'python>=${_pyver_major}.${_pyver_minor}'
    'python<${_pyver_major}.$((_pyver_minor + 1))'
  )"

  # generate pyc files
  python -m compileall -f -p / -s "$pkgdir" "$pkgdir/"
}
