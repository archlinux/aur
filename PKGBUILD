# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
_pkgname=SimpleITK
pkgname=simpleitk
pkgver=0.9.1
pkgrel=3
pkgdesc="A simplified layer built on top of ITK, intended to facilitate its use in rapid prototyping, education, interpreted languages."
arch=('i686' 'x86_64')
url="http://www.simpleitk.org/"
license=('Apache')
depends=('insight-toolkit')
makedepends=('cmake' 'git' 'mono' 'python' 'python-pip' 'python-virtualenv' 'r' 'ruby' 'swig' 'tcl' 'tk')
optdepends=(
    'mono: C# bindings'
    'python: Python bindings'
    'r: R bindings'
    'ruby: Ruby bindings'
    'tcl: Tcl/TK bindings'
    'tk: Tcl/TK bindings'
)
source=(
    "https://sourceforge.net/projects/$pkgname/files/$_pkgname/$pkgver/Source/$_pkgname-$pkgver.tar.xz"
    'python-package.patch'
    'Rlib.patch'
    "cthead1.png"::"http://midas3.kitware.com/midas/api/rest?method=midas.bitstream.download&checksum=b23198c9e44a48edfd5b83f075eb455c&algorithm=md5"
    "cthead1-Float.mha"::"http://midas3.kitware.com/midas/api/rest?method=midas.bitstream.download&checksum=25de5707b18c0c684fd5fa30351bf787&algorithm=md5"
)
md5sums=('3b759cf21b89e213343ac6a4e616cd45'
         '1c97647461d932ca2e672606d1687f77'
         '3b6569561ed5047f3232b4f96ae98d74'
         'b23198c9e44a48edfd5b83f075eb455c'
         '25de5707b18c0c684fd5fa30351bf787')

prepare() {
    cd "$_pkgname-$pkgver"

    mkdir -p build/ExternalData/Testing/Data/Input/

    cp ../{cthead1.png,cthead1-Float.mha} build/ExternalData/Testing/Data/Input/

    patch -Np1 -i ../python-package.patch
    patch -Np1 -i ../Rlib.patch
}

build() {
    cd "$_pkgname-$pkgver/build"

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

    make all dist
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

    install -d -Dm755 "$pkgdir/usr/lib/R/library/"
    cp -dr --no-preserve=ownership "$_builddir/Wrapping/Rpackaging/$_pkgname" "$pkgdir/usr/lib/R/library/"
}
