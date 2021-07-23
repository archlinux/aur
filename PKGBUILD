# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname="python-ldns"
pkgver=1.7.1
_libver=3.0.0
pkgrel=1
pkgdesc="Python bindings for the ldns library for DNS programming"
url="https://www.nlnetlabs.nl/projects/ldns/"
arch=('x86_64' 'i686')
license=('BSD')
depends=("python" "ldns" "python-ipcalc")
makedepends=("python-setuptools")
source=("https://www.nlnetlabs.nl/downloads/ldns/ldns-${pkgver}.tar.gz" "setup.py")
sha256sums=('8ac84c16bdca60e710eea75782356f3ac3b55680d40e1530d7cea474ac208229'
            '55669ca420b496e8d707e63cb15f5c5a2367ccd1a10a54aba0ac54a55b94d50f')

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
