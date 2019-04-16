# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>

pkgname=pypy2-revdb
pkgver=7.1.0
pkgrel=1
pkgdesc="PyPy2 compiled with revdb"
arch=(any)
url="https://pypy.org"
license=('MIT')
depends=(python2-cffi)
makedepends=(pypy python2-cffi python2-setuptools)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::https://bitbucket.org/pypy/pypy/downloads/pypy2.7-v${pkgver}-src.tar.bz2")
md5sums=('d412f762092fc200c94dcad477f8571f')

build() {
    cd "$srcdir/pypy2.7-v${pkgver}-src/pypy/goal"
    pypy ../../rpython/bin/rpython -O2 --revdb
}

package() {
    cd "$srcdir/pypy2.7-v${pkgver}-src/"

    # Replace include directives to use python2.* headers
    find . \( -name "*.c" -o -name "*.h" \) -exec sed -i -E 's!include <(pyconfig.h|Python.h)>!include <python2.7/\1>!g' {} \;
    python2 pypy/tool/release/package.py --rename_pypy_c pypy2-revdb --targetdir "$srcdir"

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

