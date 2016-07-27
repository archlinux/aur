# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
_pkgname=SimpleITK
pkgname=simpleitk
pkgver=0.10rc2
_pypkgver=0.10.0rc2
pkgrel=1
pkgdesc="A simplified layer built on top of ITK, intended to facilitate its use in rapid prototyping, education, interpreted languages."
arch=('i686' 'x86_64')
url="http://www.simpleitk.org/"
license=('Apache')
depends=('gcc-libs' 'insight-toolkit')
makedepends=('cmake' 'clang' 'git' 'lua51' 'mono' 'python' 'python-pip' 'python-virtualenv' 'python-numpy' 'r' 'ruby' 'swig' 'tcl' 'tk')
optdepends=(
    'lua51: Lua bindings'
    'mono: C# bindings'
    'python: Python bindings'
    'python-numpy: Python bindings'
    'r: R bindings'
    'ruby: Ruby bindings'
    'tcl: Tcl/TK bindings'
    'tk: Tcl/TK bindings'
)
source=(
    "git+https://github.com/$_pkgname/$_pkgname#tag=v$pkgver"
    'Rlib.patch'
    'lua51.patch'
)
md5sums=('SKIP'
         '2888336abcbb122a49cb5817ac98f36c'
         '9cde58e7639dadbca34e501234619ef3')

prepare() {
    cd "$_pkgname"

    mkdir -p build

    patch -Np1 -i ../Rlib.patch
    patch -Np1 -i ../lua51.patch
}

build() {
    cd "$_pkgname/build"

    export CC=clang
    export CXX=clang++
    export CXXFLAGS="-std=c++11 $CXXFLAGS"
    export CPP="clang -E"

    # TODO: Java binding is broken with swig 3.0.9 and openjdk8
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_RPATH:BOOL=ON \
        -DBUILD_SHARED_LIBS:BOOL=ON \
        -DBUILD_TESTING:BOOL=OFF \
        -DBUILD_EXAMPLES:BOOL=OFF \
        -DSimpleITK_PYTHON_WHEEL:BOOL=ON \
        -DWRAP_JAVA:BOOL=OFF \
        ..

    make all PythonVirtualEnv dist
}

package() {
    _builddir="$srcdir/$_pkgname/build"

    cd $_builddir

    export CC=clang
    export CXX=clang++
    export CXXFLAGS="-std=c++11 $CXXFLAGS"
    export CPP="clang -E"

    make DESTDIR="$pkgdir/" install

    pip install --root="$pkgdir/" --ignore-installed \
        "$_builddir/Wrapping/Python/dist/$_pkgname-$_pypkgver"*"-linux_$CARCH.whl"

    install -d -Dm755 "$pkgdir/usr/lib/lua/5.1/"
    install -Dm755 "$_builddir/Wrapping/Lua/lib/$_pkgname.so" "$pkgdir/usr/lib/lua/5.1/$_pkgname.so"
    install -Dm755 "$_builddir/Wrapping/Tcl/bin/SimpleITKTclsh" "$pkgdir/usr/bin/SimpleITKTclsh"
    install -Dm755 "$_builddir/Wrapping/CSharp/CSharpBinaries/libSimpleITKCSharpNative.so" "$pkgdir/usr/lib/libSimpleITKCSharpNative.so"
    install -Dm755 "$_builddir/Wrapping/CSharp/CSharpBinaries/SimpleITKCSharpManaged.dll" "$pkgdir/usr/lib/SimpleITKCSharpManaged.dll"

    install -d -Dm755 "$pkgdir/usr/lib/R/library/"
    cp -dr --no-preserve=ownership "$_builddir/Wrapping/R/Packaging/$_pkgname" "$pkgdir/usr/lib/R/library/"
}
