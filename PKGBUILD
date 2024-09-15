# Maintainer: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>

## links
# http://www.simpleitk.org/
# https://github.com/SimpleITK/SimpleITK

: ${_commit:=a3e11cbc09ed78427aa215f3875b0ea7ea285b58}

_pkgname="simpleitk"
pkgbase="$_pkgname"
pkgname=(
  'simpleitk'
  'java-simpleitk'
  'lua-simpleitk'
  'mono-simpleitk'
  'python-simpleitk'
  'r-simpleitk'
  'ruby-simpleitk'
  'tcl-simpleitk'
)
pkgver=2.4.0
pkgrel=1
pkgdesc="A simplified layer built on top of ITK"
arch=('x86_64')
url="https://github.com/SimpleITK/SimpleITK"
license=('Apache-2.0')

depends=(
  'insight-toolkit'
)
makedepends=(
  'cmake'
  'eigen'
  'git'
  'java-environment'
  'lua'
  'mono'
  'ninja'
  'openjpeg2'
  'python-installer'
  'python-numpy'
  'python-virtualenv'
  'python-wheel'
  'r'
  'ruby'
  'swig'
  'tcl'
  'tk'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  export CFLAGS CXXFLAGS
  CFLAGS="${CFLAGS//*format-security*/}"
  CXXFLAGS="${CFLAGS//*format-security*/}"

  local _java_home=$(find '/usr/lib/jvm/' -name "$(archlinux-java get)")
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_TESTING=OFF
    -DBUILD_EXAMPLES=OFF
    -DBUILD_DOXYGEN=OFF
    -DSimpleITK_PYTHON_WHEEL=ON
    -DSimpleITK_PYTHON_USE_VIRTUALENV=ON
    -DWRAP_DEFAULT=ON
    -DWRAP_CSHARP=ON
    -DWRAP_JAVA=ON
    -DWRAP_LUA=ON
    -DWRAP_PYTHON=ON
    -DWRAP_R=ON
    -DWRAP_RUBY=ON
    -DWRAP_TCL=ON
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  JAVA_HOME="$_java_home" \
    cmake "${_cmake_options[@]}"
  cmake --build build --target all

  PIP_CONFIG_FILE=/dev/null LD_LIBRARY_PATH="$srcdir/build/lib" \
    cmake --build build --target PythonVirtualEnv dist
}

package_simpleitk() {
  DESTDIR="$pkgdir/" cmake --install build
}

package_python-simpleitk() {
  depends=('simpleitk' 'python' 'python-numpy')

  python -m installer \
    --destdir="$pkgdir" \
    "build/Wrapping/Python/dist/SimpleITK-$pkgver"*"-linux_$CARCH.whl"
}

package_lua-simpleitk() {
  depends=('simpleitk' 'lua')

  local _lua_version_maj_min=$(lua -v | grep -Eo '[0-9]+\.[0-9]+')

  install -Dm755 \
    "build/Wrapping/Lua/lib/SimpleITK.so" \
    "$pkgdir/usr/lib/lua/$_lua_version_maj_min/SimpleITK.so"
}

package_tcl-simpleitk() {
  depends=('simpleitk' 'tcl' 'tk')

  install -Dm755 \
    "build/Wrapping/Tcl/bin/SimpleITKTclsh" \
    "$pkgdir/usr/bin/SimpleITKTclsh"
}

package_mono-simpleitk() {
  depends=('simpleitk' 'mono')

  install -Dm755 \
    "build/Wrapping/CSharp/CSharpBinaries/libSimpleITKCSharpNative.so" \
    "$pkgdir/usr/lib/libSimpleITKCSharpNative.so"

  install -Dm755 \
    "build/Wrapping/CSharp/CSharpBinaries/SimpleITKCSharpManaged.dll" \
    "$pkgdir/usr/lib/SimpleITKCSharpManaged.dll"
}

package_r-simpleitk() {
  depends=('simpleitk' 'r')

  install -dm755 "$pkgdir/usr/lib/R/library/"

  cp -dr --no-preserve=ownership \
    "build/Wrapping/R/Packaging/SimpleITK" \
    "$pkgdir/usr/lib/R/library/"
}

package_java-simpleitk() {
  depends=('simpleitk' 'java-runtime')

  install -dm755 "$pkgdir/usr/share/java/SimpleITK/"

  cp -dr --no-preserve=ownership \
    "build/Wrapping/Java/dist/SimpleITK-$pkgver"*/* \
    "$pkgdir/usr/share/java/SimpleITK/"
}

package_ruby-simpleitk() {
  depends=('simpleitk' 'ruby')

  local _lua_version
  _lua_version=$(lua -v | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')

  install -Dm755 \
    "build/Wrapping/Ruby/lib/simpleitk.so" \
    "$pkgdir/usr/lib/ruby/gems/${_lua_version}/gems/ruby-simpleitk-${pkgver}/lib/simpleitk.so"
}
