# Maintainer:
# Contributor: xiretza <xiretza+aur@xiretza.xyz>

_pkgname="rapidyaml"
pkgbase="$_pkgname-git"
pkgname=("$pkgbase" "python-$pkgbase")
pkgver=0.11.1.r32.g3a2bbd9
pkgrel=1
url="https://github.com/biojppm/rapidyaml"
arch=('x86_64')
license=('MIT')

makedepends=(
  'cmake'
  'git'
  'ninja'
  'python'
  'swig'
)
checkdepends=('python-pytest')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  git -C "$_pkgsrc" submodule update --init --depth=1
  git -C "$_pkgsrc/ext/c4core" submodule update --init --depth=1
}

build() {
  export CFLAGS CXXFLAGS
  CFLAGS+=" -DNDEBUG"
  CXXFLAGS+=" -DNDEBUG"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev

    -DRYML_BUILD_API=ON
    -DRYML_DEFAULT_CALLBACKS=ON
    -DRYML_DEFAULT_CALLBACK_USES_EXCEPTIONS=ON
    -DRYML_DEV=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package_rapidyaml-git() {
  pkgdesc="A fast YAML parser and emitter for C++"
  provides=("${pkgname%-git}=${pkgver%.g*}" 'libryml.so')
  conflicts=("${pkgname%-git}")

  DESTDIR="$pkgdir" cmake --install build

  mv "${pkgdir}/usr/_ryml.so" "${srcdir}/_ryml.so"
  mv "${pkgdir}/usr/ryml.py" "${srcdir}/ryml.py"

  install -Dm644 "$_pkgsrc/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-rapidyaml-git() {
  pkgdesc="Python bindings for rapidyaml (via SWIG)"
  depends=('python' 'rapidyaml')
  provides=("${pkgname%-git}=${pkgver%.g*}")
  conflicts=("${pkgname%-git}")

  _pyver=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  _pydir="${pkgdir}/usr/lib/python${_pyver}/site-packages/rapidyaml"

  if [[ -f "${srcdir}/_ryml.so" && -f "${srcdir}/ryml.py" ]]; then
    install -Dm644 "${srcdir}/_ryml.so" -t "${_pydir}/"
    install -Dm644 "${srcdir}/ryml.py" -t "${_pydir}/"
    touch "${_pydir}/__init__.py"
  else
    echo "ERROR: Could not find Python binding files in temporary location."
    return 1
  fi

  install -Dm644 "$_pkgsrc/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
