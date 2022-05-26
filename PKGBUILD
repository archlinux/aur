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
pkgver=2.1.1.2
pkgrel=1
pkgdesc="A simplified layer built on top of ITK"
arch=('x86_64')
url="http://www.simpleitk.org/"
license=('Apache')
provides=()
conflicts=()
depends=('gcc-libs' 'insight-toolkit>=5.2.1')
makedepends=(
    'cmake'
    'git'
    'openjpeg2'
    'python'
    'python-numpy'
    'python-pip'
    'python-virtualenv'
    'swig'
    'tcl'
    'tk'
    'java-environment'
    'lua53'
    'mono'
    'r'
    'ruby'
)
optdepends=()
source=("git+https://github.com/SimpleITK/SimpleITK#tag=v${pkgver}")
sha256sums=('SKIP')
_lua53_version=$(pacman -Qi lua53 | grep '^Version' | grep -Eo '[0-9]\.[0-9]\.[0-9]')

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
            -DCMAKE_CXX_FLAGS:STRING="-std=c++14" \
            -DLUA_VERSION_STRING:STRING="$_lua53_version" \
            -DLUA_EXECUTABLE:FILEPATH="/usr/bin/lua5.3" \
            -DLUA_INCLUDE_DIR:FILEPATH="/usr/include/lua5.3" \
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

    cd "${srcdir}/${_pkgname}/build"

    local _py_version
    _py_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")

    PIP_CONFIG_FILE=/dev/null \
        pip install \
            --ignore-installed \
            --isolated \
            --no-deps \
            --root="$pkgdir" \
            "${srcdir}/${_pkgname}/build/Wrapping/Python/dist/$_pkgname-"*"-linux_$CARCH.whl"

    python -O -m compileall "${pkgdir}/usr/lib/python${_py_version}/site-packages/SimpleITK"
}

package_lua-simpleitk() {
    depends=('simpleitk' 'lua53')

    cd "${srcdir}/${_pkgname}/build"

    install -d -Dm755 "$pkgdir/usr/lib/lua/5.3/"
    install -Dm755 \
        "${srcdir}/${_pkgname}/build/Wrapping/Lua/lib/$_pkgname.so" \
        "$pkgdir/usr/lib/lua/5.3/$_pkgname.so"
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
        "$pkgdir/usr/lib/ruby/gems/${_lua53_version}/gems/ruby-simpleitk-${pkgver}/lib/simpleitk.so"
}
