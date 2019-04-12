# Maintainer : dianlujitao <dianlujitao at gmail dot com>
# Contributor: jiuren <qiuwei1987@gmail.com>
# Contributor: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
# Contributor: Kristof Marussy <kris7topher@gmail.com>
# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: saxonbeta <saxonbeta at gmail>
# Contributor: Pierre Gueth <pierre.gueth at gmail>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Contributor: Tim Huetz <tim at huetz biz>

pkgbase=liblinear
pkgname=(liblinear python-liblinear python2-liblinear)
pkgver=2.30
pkgrel=1
pkgdesc="A Library for Large Linear Classification"
arch=('i686' 'x86_64')
url="http://www.csie.ntu.edu.tw/~cjlin/liblinear/"
license=('BSD')
depends=('gcc-libs')
makedepends=('gcc')
source=("https://www.csie.ntu.edu.tw/~cjlin/$pkgbase/$pkgbase-$pkgver.tar.gz"
        "fix-import-module.diff")
sha256sums=('881c7039c6cf93119c781fb56263de91617b3eca8c3951f2c19a3797de95c6ac'
            'c595cbf378ca2e781a63cb7127880c8d4bd8b118d1aef1b7b5a4324ba065e6b0')

prepare() {
    cd "${pkgbase}-${pkgver}"
    patch -p1 < ../fix-import-module.diff
}

build() {
    printf '%s\n' '  -> Building library and CLI binaries...'
    cd "${pkgbase}-${pkgver}"
    make lib all
}

package_liblinear() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    local _sover

    _sover="$(find . -maxdepth 1 -type f -regextype posix-basic -regex '.*liblinear.so.[0-9]$' | awk -F'.' '{ print $NF }')"

    # binaries
    install -D -m755 predict $pkgdir/usr/bin/liblinear-predict
    install -D -m755 train $pkgdir/usr/bin/liblinear-train

    # library
    install -D -m755 "liblinear.so.${_sover}" -t "${pkgdir}/usr/lib"
    pushd "${pkgdir}/usr/lib"
    ln -s "liblinear.so.${_sover}" liblinear.so
    popd

    # header
    install -D -m644 linear.h -t "${pkgdir}/usr/include/liblinear"

    # license
    install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-liblinear() {
    depends+=(liblinear python)
    optdepends=('python-scipy: sparse matrix support')
    pkgdesc="Python bindings for liblinear"

    cd "${srcdir}/${pkgbase}-${pkgver}"

    local _pyver

    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"

    # python modules
    pushd python
    install -D -m644 commonutil.py      -t "${pkgdir}/usr/lib/python${_pyver}/${pkgbase}"
    install -D -m644 liblinear.py       -t "${pkgdir}/usr/lib/python${_pyver}/${pkgbase}"
    install -D -m644 liblinearutil.py   -t "${pkgdir}/usr/lib/python${_pyver}/${pkgbase}"
    popd

    # license
    install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-liblinear() {
    depends+=(liblinear python2)
    optdepends=('python2-scipy: sparse matrix support')
    pkgdesc="Python2 bindings for liblinear"

    cd "${srcdir}/${pkgbase}-${pkgver}"

    # python modules
    pushd python
    install -D -m644 commonutil.py      -t "${pkgdir}/usr/lib/python2.7/${pkgbase}"
    install -D -m644 liblinear.py       -t "${pkgdir}/usr/lib/python2.7/${pkgbase}"
    install -D -m644 liblinearutil.py   -t "${pkgdir}/usr/lib/python2.7/${pkgbase}"
    sed -i '1s/python$/python2/' "${pkgdir}/usr/lib/python2.7/${pkgbase}/"{commonutil,liblinear,liblinearutil}.py
    printf '' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/python2.7/${pkgbase}/__init__.py"
    popd

    # license
    install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
