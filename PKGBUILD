# Maintainer : dianlujitao <dianlujitao at gmail dot com>
# Contributor: jiuren <qiuwei1987@gmail.com>
# Contributor: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
# Contributor: Kristof Marussy <kris7topher@gmail.com>
# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: saxonbeta <saxonbeta at gmail>
# Contributor: Pierre Gueth <pierre.gueth at gmail>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Contributor: Tim Huetz <tim at huetz biz>

pkgname=liblinear
pkgver=2.30
pkgrel=1
pkgdesc="A Library for Large Linear Classification"
arch=('i686' 'x86_64')
url="http://www.csie.ntu.edu.tw/~cjlin/liblinear/"
license=('BSD')
depends=('gcc-libs')
makedepends=('gcc')
optdepends=(
    'python: bindings for latest python version'
    'python2: bindings for python 2'
)
source=("https://www.csie.ntu.edu.tw/~cjlin/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('881c7039c6cf93119c781fb56263de91617b3eca8c3951f2c19a3797de95c6ac')

build() {
    printf '%s\n' '  -> Building library and CLI binaries...'
    cd "${pkgname}-${pkgver}"
    make lib all
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    local _pyver
    local _sover

    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
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

    # python modules
    pushd python
    install -D -m644 commonutil.py      -t "${pkgdir}/usr/lib/python${_pyver}/${pkgname}"
    install -D -m644 commonutil.py      -t "${pkgdir}/usr/lib/python2.7/${pkgname}"
    install -D -m644 liblinear.py       -t "${pkgdir}/usr/lib/python${_pyver}/${pkgname}"
    install -D -m644 liblinear.py       -t "${pkgdir}/usr/lib/python2.7/${pkgname}"
    install -D -m644 liblinearutil.py   -t "${pkgdir}/usr/lib/python${_pyver}/${pkgname}"
    install -D -m644 liblinearutil.py   -t "${pkgdir}/usr/lib/python2.7/${pkgname}"
    sed -i '1s/python$/python2/' "${pkgdir}/usr/lib/python2.7/${pkgname}/"{commonutil,liblinear,liblinearutil}.py
    printf '' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/python2.7/${pkgname}/__init__.py"
    popd

    # license
    install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
