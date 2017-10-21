# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname="python-ldns"
pkgver=1.7.0
_libver=2.0.0
pkgrel=1
pkgdesc="Python bindings for the ldns library for DNS programming"
url="https://www.nlnetlabs.nl/projects/ldns/"
arch=('x86_64' 'i686')
license=('BSD')
depends=("python" "ldns" "python-ipcalc")
makedepends=("python-setuptools")
source=("https://www.nlnetlabs.nl/downloads/ldns/ldns-${pkgver}.tar.gz" "setup.py")
md5sums=('74b75c9ba69fb3af2a0c26244ecfd9f6'
         '4a96c66b37f26b6d5231c6466cd6503f')

build() {
    cd "${srcdir}/ldns-$pkgver"
    ./configure --with-pyldns
    make
}

package() {
    cd "${srcdir}"
    cp ldns-$pkgver/contrib/python/ldns.py .
    python setup.py install --root="${pkgdir}" --optimize=1
    _pythonver=$(LC_ALL=C pacman -Qi python|grep version|awk '{print $3}'|cut -d"." -f1,2)
    install -D ldns-$pkgver/.libs/_ldns.so.$_libver "${pkgdir}/usr/lib/python${_pythonver}/site-packages/_ldns.so.$libver"
    ln -s _ldns.so.$pkgver "${pkgdir}/usr/lib/python${_pythonver}/site-packages/_ldns.so"
}
