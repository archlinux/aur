# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
_pkgname=SimpleITK
pkgname=simpleitk
pkgver=0.9.1
pkgrel=1
pkgdesc="A simplified layer built on top of ITK, intended to facilitate its use in rapid prototyping, education, interpreted languages."
arch=('i686' 'x86_64')
url="http://www.simpleitk.org/"
license=('Apache')
depends=('insight-toolkit')
makedepends=('cmake' 'git' 'mono' 'python' 'python-pip' 'python-virtualenv' 'swig' 'tcl' 'tk')
optdepends=(
    'mono: C# bindings'
    'python: Python bindings'
    'tcl: Tcl/TK bindings'
    'tk: Tcl/TK bindings'
)
source=(
    "https://sourceforge.net/projects/$pkgname/files/$_pkgname/$pkgver/Source/$_pkgname-$pkgver.tar.xz"
    'python-package.patch'
)
md5sums=('3b759cf21b89e213343ac6a4e616cd45'
         '1c97647461d932ca2e672606d1687f77')

prepare() {
    cd "$_pkgname-$pkgver"

    patch -Np1 -i ../python-package.patch
}

build() {
    cd "$_pkgname-$pkgver"

    mkdir -p build && cd build

    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_RPATH:BOOL=ON \
        -DBUILD_SHARED_LIBS:BOOL=ON \
        -DBUILD_TESTING:BOOL=OFF \
        -DBUILD_EXAMPLES:BOOL=OFF \
        -DSimpleITK_PYTHON_WHEEL:BOOL=ON \
        ..

    make all dist.Python
}

package() {
    _builddir="$srcdir/$_pkgname-$pkgver/build"

    cd $_builddir

    make DESTDIR="$pkgdir/" install

    pip install --root="$pkgdir/" --ignore-installed \
        "$_builddir/Wrapping/dist/$_pkgname-$pkgver-"*"-linux_$CARCH.whl"

    install -Dm755 "$_builddir/bin/SimpleITKLua" "$pkgdir/usr/bin/SimpleITKLua"
    install -Dm755 "$_builddir/bin/SimpleITKTclsh" "$pkgdir/usr/bin/SimpleITKTclsh"
    install -Dm755 "$_builddir/Wrapping/CSharpBinaries/libSimpleITKCSharpNative.so" "$pkgdir/usr/lib/libSimpleITKCSharpNative.so"
    install -Dm755 "$_builddir/Wrapping/CSharpBinaries/SimpleITKCSharpManaged.dll" "$pkgdir/usr/lib/SimpleITKCSharpManaged.dll"
}
