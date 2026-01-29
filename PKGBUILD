# Maintainer: apnea <27015 at riseup dot net>
# Contributor: MoetaYuko <loli at yuko dot moe>
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
pkgver=2.50
pkgrel=1
pkgdesc="A Library for Large Linear Classification"
arch=('x86_64')
url="https://www.csie.ntu.edu.tw/~cjlin/liblinear/"
license=('BSD')
depends=('gcc-libs' 'python-scipy')
makedepends=('gcc' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://www.csie.ntu.edu.tw/~cjlin/$pkgbase/$pkgbase-$pkgver.tar.gz")
sha256sums=('e5eeafe2159c41148b59304da2ba0ed12648e3d491ce2b9625058e174e96ca29')

build() {
    cd "${pkgbase}-${pkgver}"
    make lib all

    cd python
    python -m build --wheel --no-isolation
}

package_liblinear() {
    cd "${pkgbase}-${pkgver}"

    local _sover
    _sover="$(find . -maxdepth 1 -type f -name 'liblinear.so.*' | awk -F'.' '{ print $NF }')"

    # binaries
    install -D -m755 predict "${pkgdir}/usr/bin/liblinear-predict"
    install -D -m755 train "${pkgdir}/usr/bin/liblinear-train"

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
    pkgdesc="Python bindings for liblinear"
    depends=('liblinear' 'python' 'python-scipy')

    cd "${pkgbase}-${pkgver}/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # license
    install -D -m644 ../COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
