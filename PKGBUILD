# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Xwang <xwaang1976@gmail.com>
 
_PkgName=SU2
pkgname=su2
pkgver=7.1.0
pkgrel=1
pkgdesc="An Open-Source Suite for Multiphysics Simulation and Design"
url="https://su2code.github.io"
license=('LGPL2.1')
depends=('openmpi' 'python')
makedepends=('gcc-fortran')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/su2code/SU2/archive/v$pkgver.tar.gz")
sha256sums=('deb0abcb10e23a6a41a46c1a2117c4331d68cf97c2fa9c02e10e918973e1c0e7')

prepare() {
    cd "$srcdir/$_PkgName-$pkgver"
    autoreconf -if
    export PYTHON_VERSION=$( ( python --version ) | awk '{print $2}' | cut -c -3 )
}

build() {
    cd "$srcdir/$_PkgName-$pkgver"
    ./configure --prefix=/usr --enable-mpi
    make
}

package() {
    cd "$srcdir/$_PkgName-$pkgver"
    make DESTDIR="$pkgdir" install
    install -dm755 "$pkgdir/usr/lib/python${PYTHON_VERSION}/site-packages"
    cd "$pkgdir/usr/bin"
    mv SU2 -t "$pkgdir/usr/lib/python${PYTHON_VERSION}/site-packages"
}
