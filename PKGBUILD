# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>

pkgname=pypy2-revdb
pkgver=7.3.1
pkgrel=1
pkgdesc="PyPy2 compiled with revdb"
arch=(any)
url="https://pypy.org"
license=('MIT')
depends=(python2-cffi)
makedepends=(pypy python2-cffi python2-setuptools)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.bz2::https://downloads.python.org/pypy/pypy2.7-v${pkgver}-src.tar.bz2")
md5sums=('7608bd58940ffc5403632c2c786d83bb')

build() {
    cd "$srcdir/pypy2.7-v${pkgver}-src/pypy/goal"
    # pypy ../../rpython/bin/rpython -O2 --revdb
}

package() {
    cd "$srcdir/pypy2.7-v${pkgver}-src/"

    # For some reason pypy expect pypy-c and libpypy-c.so in the same directory...?
    t=$(mktemp -d)
    ln -s /usr/bin/pypy $t/pypy
    ln -s /usr/lib/libpypy-c.so $t/libpypy-c.so

    python2 pypy/tool/release/package.py --rename_pypy_c pypy2-revdb --override_pypy_c $t/pypy --targetdir "$srcdir"

    rm $t/*
    rm -r $t

    cd "$srcdir"
    tar xf "pypy-nightly.tar.bz2"

    installdir="${pkgdir}/opt/pypy2-revdb"
    mkdir -p "${installdir}"/{bin,lib-python,lib_pypy}

    cd pypy-nightly
    cp bin/* "${installdir}/bin"
    cp -r lib-python/2.7 "${installdir}/lib-python"
    cp -r lib_pypy "${installdir}"
    cp -r include "${installdir}"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/pypy2-revdb/bin/pypy2-revdb "${pkgdir}/usr/bin/pypy2-revdb"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/pypy2-revdb/LICENSE"
}

