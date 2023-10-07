# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
# shellcheck disable=SC2010
_pkgname=SimpleITK
pkgbase=simpleitk
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
pkgver=2.3.0
pkgrel=2
pkgdesc="A simplified layer built on top of ITK"
arch=('x86_64')
url="http://www.simpleitk.org/"
license=('Apache')
provides=()
conflicts=()
depends=('gcc-libs' 'insight-toolkit')
makedepends=(
    'cmake'
    'eigen'
    'git'
    'openjpeg2'
    'python-installer'
    'python-numpy'
    'python-virtualenv'
    'python-wheel'
    'swig'
    'tcl'
    'tk'
    'java-environment'
    'lua'
    'mono'
    'r'
    'ruby'
)
optdepends=()
source=("git+https://github.com/SimpleITK/SimpleITK#tag=v${pkgver}")
sha256sums=('SKIP')
_lua_version=$(lua -v | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')

prepare() {
    cd "${srcdir}/${_pkgname}"
    rm -rf build
    mkdir -p build
    cd build

    # Check that the required ITK modules are present
    local _itk
    _itk=$(ls /usr/lib/cmake | grep -m1 ITK)
    if [ "$(ls "/usr/include/$_itk" | grep 'SimpleITKFiltersExport.h')" == "" ];
    then
        error "ITK must be built with -DModule_SimpleITKFilters:BOOL=ON"
        exit 1
    fi


    _java_home=$(find '/usr/lib/jvm/' -name "$(archlinux-java get)")

    JAVA_HOME=$_java_home \
        cmake \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_CXX_FLAGS:STRING="-std=c++17" \
            -DLUA_VERSION_STRING:STRING="$_lua_version" \
            -DBUILD_SHARED_LIBS:BOOL=ON \
            -DBUILD_TESTING:BOOL=OFF \
            -DBUILD_EXAMPLES:BOOL=OFF \
            -DBUILD_DOXYGEN:BOOL=OFF \
            -DSimpleITK_PYTHON_WHEEL:BOOL=ON \
            -DSimpleITK_PYTHON_USE_VIRTUALENV:BOOL=ON \
            -DWRAP_DEFAULT:BOOL=ON \
            -DWRAP_CSHARP:BOOL=ON \
            -DWRAP_JAVA:BOOL=ON \
            -DWRAP_LUA:BOOL=ON \
            -DWRAP_PYTHON:BOOL=ON \
            -DWRAP_R:BOOL=ON \
            -DWRAP_RUBY:BOOL=ON \
            -DWRAP_TCL:BOOL=ON \
            ..
}

build() {
    cd "${srcdir}/${_pkgname}/build"

    make all

    LD_LIBRARY_PATH="${srcdir}/${_pkgname}/build/lib" make PythonVirtualEnv dist
}

package_simpleitk() {
    cd "${srcdir}/${_pkgname}/build"

    make DESTDIR="$pkgdir/" install
}

package_python-simpleitk() {
    depends=('simpleitk' 'python' 'python-numpy')

    python -m installer \
        --destdir="$pkgdir" \
        "${srcdir}/${_pkgname}/build/Wrapping/Python/dist/$_pkgname-"*"-linux_$CARCH.whl"
}

package_lua-simpleitk() {
    depends=('simpleitk' 'lua')

    cd "${srcdir}/${_pkgname}/build"

    local _lua_version_maj_min
    _lua_version_maj_min=$(lua -v | grep -Eo '[0-9]+\.[0-9]+')

    install -d -Dm755 "$pkgdir/usr/lib/lua/$_lua_version_maj_min/"
    install -Dm755 \
        "${srcdir}/${_pkgname}/build/Wrapping/Lua/lib/$_pkgname.so" \
        "$pkgdir/usr/lib/lua/$_lua_version_maj_min/$_pkgname.so"
}

package_tcl-simpleitk() {
    depends=('simpleitk' 'tcl' 'tk')
    cd "${srcdir}/${_pkgname}/build"

    install -Dm755 \
        "${srcdir}/${_pkgname}/build/Wrapping/Tcl/bin/SimpleITKTclsh" \
        "$pkgdir/usr/bin/SimpleITKTclsh"
}

package_mono-simpleitk() {
    depends=('simpleitk' 'mono')
    cd "${srcdir}/${_pkgname}/build"

    install -Dm755 \
        "${srcdir}/${_pkgname}/build/Wrapping/CSharp/CSharpBinaries/libSimpleITKCSharpNative.so" \
        "$pkgdir/usr/lib/libSimpleITKCSharpNative.so"

    install -Dm755 \
        "${srcdir}/${_pkgname}/build/Wrapping/CSharp/CSharpBinaries/SimpleITKCSharpManaged.dll"\
        "$pkgdir/usr/lib/SimpleITKCSharpManaged.dll"
}

package_r-simpleitk() {
    depends=('simpleitk' 'r')
    cd "${srcdir}/${_pkgname}/build"

    install -d -Dm755 "$pkgdir/usr/lib/R/library/"

    cp -dr --no-preserve=ownership \
        "${srcdir}/${_pkgname}/build/Wrapping/R/Packaging/$_pkgname" \
        "$pkgdir/usr/lib/R/library/"
}

package_java-simpleitk() {
    depends=('simpleitk' 'java-runtime')
    cd "${srcdir}/${_pkgname}/build"

    install -d -Dm755 "$pkgdir/usr/share/java/SimpleITK/"

    cp -dr --no-preserve=ownership \
        "${srcdir}/${_pkgname}/build/Wrapping/Java/dist/SimpleITK-$pkgver"*/* \
        "$pkgdir/usr/share/java/SimpleITK/"
}

package_ruby-simpleitk() {
    depends=('simpleitk' 'ruby')

    install -Dm755 \
        "${srcdir}/${_pkgname}/build/Wrapping/Ruby/lib/simpleitk.so" \
        "$pkgdir/usr/lib/ruby/gems/${_lua_version}/gems/ruby-simpleitk-${pkgver}/lib/simpleitk.so"
}
