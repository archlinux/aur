# Maintainer : MoetaYuko <loli at yuko dot moe>
# Contributor: jiuren <qiuwei1987@gmail.com>
# Contributor: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
# Contributor: Kristof Marussy <kris7topher@gmail.com>
# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: saxonbeta <saxonbeta at gmail>
# Contributor: Pierre Gueth <pierre.gueth at gmail>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Contributor: Tim Huetz <tim at huetz biz>

pkgbase=liblinear
pkgname=(liblinear python-liblinear)
pkgver=2.43
pkgrel=1
pkgdesc="A Library for Large Linear Classification"
arch=('i686' 'x86_64')
url="http://www.csie.ntu.edu.tw/~cjlin/liblinear/"
license=('BSD')
depends=('gcc-libs')
makedepends=('gcc' 'python-setuptools')
source=("https://www.csie.ntu.edu.tw/~cjlin/$pkgbase/$pkgbase-$pkgver.tar.gz")
sha256sums=('02bad43d745e2796f39a08ac9d117770e71939ef06b1ee7afc6ab7909e304807')

build() {
    cd $srcdir/${pkgbase}-${pkgver}
    make lib all

    cd python
    python setup.py build
}

package_liblinear() {
    cd $srcdir/${pkgbase}-${pkgver}

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
    depends+=('python-scipy')
    pkgdesc="Python bindings for liblinear"

    cd "${srcdir}/${pkgbase}-${pkgver}/python"
    python setup.py install --root="$pkgdir" --optimize=1

    # license
    install -D -m644 ../COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
