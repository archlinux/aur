# Maintainer:
# Contributor: xiretza <xiretza+aur@xiretza.xyz>

_pkgbase="prjxray"
pkgbase="$_pkgbase-git"
pkgname=("$_pkgbase-tools-git" "python-$_pkgbase-git")
pkgver=r3947.08353c97
pkgrel=1
pkgdesc="Documenting the Xilinx 7-series bit-stream format"
url="https://github.com/SymbiFlow/prjxray"
license=('ISC')
arch=('x86_64')

_pythondepends=(
  'python'
  'python-fasm'
  'python-intervaltree'
  'python-numpy'
  'python-pyjson5'
  'python-simplejson'
  'python-yaml'
)

depends=("${_pythondepends[@]}")
makedepends=(
  'cmake'
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
optdepends=(
  'prjxray-db: The pre-built database'
)

_pkgsrc="$_pkgbase"
source=(
  "$_pkgsrc"::"git+$url.git"
  "git+https://github.com/arsenm/sanitizers-cmake"
  "git+https://github.com/google/googletest"
  "git+https://github.com/gflags/gflags"
  "git+https://github.com/google/cctz"
  "git+https://github.com/abseil/abseil-cpp"
  "git+https://github.com/jbeder/yaml-cpp"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgsrc"

  # include fasm2frames in python package
  mv utils/fasm2frames.py prjxray/
  sed -E 's/(fasm2frames=)utils/\1prjxray/' -i setup.py

  local _mods=(sanitizers-cmake googletest gflags cctz abseil-cpp yaml-cpp)

  git submodule init
  for mod in "${_mods[@]}"; do
    git config "submodule.third_party/$mod.url" "$srcdir/$mod"
  done

  cd third_party
  git -c protocol.file.allow=always submodule update "${_mods[@]}"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build

  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$_pkgsrc"
  env PYTHONPATH=. pytest tests/
}

package_prjxray-tools-git() {
  depends=('gcc-libs')
  provides=(
    "${pkgname%-git}"
    "prjxray"
  )
  conflicts=(
    "${pkgname%-git}"
    "prjxray"
  )

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-prjxray-git() {
  arch=(any)
  depends=("${_pythondepends[@]}")
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
