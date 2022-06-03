# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgbase=liblinear-git
pkgname=(liblinear-git python-liblinear-git)
pkgver=2.43
pkgrel=1
pkgdesc="A Library for Large Linear Classification"
arch=('i686' 'x86_64')
url="http://www.csie.ntu.edu.tw/~cjlin/liblinear/"
license=('BSD')
depends=('gcc-libs')
makedepends=('gcc' 'python-setuptools')
source=("${pkgbase}::git+https://github.com/cjlin1/liblinear")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgbase}"
    make lib all

    cd python
    python setup.py build
}

package_liblinear-git() {
    conflicts=('liblinear')
    provides=('liblinear')

    cd "${srcdir}/${pkgbase}"

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

package_python-liblinear-git() {
    depends+=('python-scipy')
    conflicts=('python-liblinear')
    provides=('python-liblinear')
    pkgdesc="Python bindings for liblinear"

    cd "${srcdir}/${pkgbase}/python"
    python setup.py install --root="$pkgdir" --optimize=1

    # license
    install -D -m644 ../COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
