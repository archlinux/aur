# Maintainer: agony <27015 at riseup dot net>
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
pkgrel=2
pkgdesc="A Library for Large Linear Classification"
arch=('x86_64')
url="https://www.csie.ntu.edu.tw/~cjlin/liblinear/"
license=('BSD-3-Clause')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://www.csie.ntu.edu.tw/~cjlin/$pkgbase/$pkgbase-$pkgver.tar.gz"
        "liblinear-use-makepkg-flags.patch")
sha256sums=('e5eeafe2159c41148b59304da2ba0ed12648e3d491ce2b9625058e174e96ca29'
            'f9895c818447c60701e1ccc72f05285c7f12cc37e935b493a54139541be15e26')

prepare() {
    patch -d "${pkgbase}-${pkgver}" -Np1 -i "${srcdir}/liblinear-use-makepkg-flags.patch"
}

build() {
    cd "${pkgbase}-${pkgver}"
    make lib all

    cd python
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgbase}-${pkgver}"
    ./train -q heart_scale heart_scale.model
    ./predict heart_scale heart_scale.model heart_scale.out

    cd python
    local _lib=(build/lib.*)
    PYTHONPATH="${_lib[0]}" python -c '
from liblinear.liblinearutil import predict, svm_read_problem, train
y, x = svm_read_problem("../heart_scale")
m = train(y[:200], x[:200], "-q")
predict(y[200:], x[200:], m)'
}

package_liblinear() {
    depends=('glibc' 'libgcc' 'libstdc++')

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
    depends=('glibc' 'libgcc' 'libstdc++' 'python' 'python-numpy' 'python-scipy')
    optdepends=('python-numba: for enabling JIT compiler')

    cd "${pkgbase}-${pkgver}/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # license
    install -D -m644 ../COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
