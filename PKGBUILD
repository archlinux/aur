# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python2-tldextract
pkgver=2.2.0
pkgrel=1
pkgdesc="Accurately separate the TLD from the registered domain and subdomains of a URL, using the Public Suffix List"
arch=("any")
url="https://github.com/john-kurkowski/tldextract"
license=("BSD")
depends=("python2" "python2-idna" "python2-requests" "python2-requests-file" "python2-setuptools")
checkdepends=("python2-pytest-runner" "python2-pytest-mock" "python2-responses")
source=("https://pypi.io/packages/source/t/tldextract/tldextract-${pkgver}.tar.gz")
sha512sums=("25a8c3d2ce27bd54dea211fb3999caeb487840172a8b707b43e6c27729f247306cc0596f156e70f3039771f84f92112921c17873128d4597dbc8785e2d4de8d3")

prepare() {
    export LC_CTYPE=en_US.UTF-8
}

build() {
    cd "tldextract-${pkgver}"
    python2 setup.py build
}

check() {
    cd "tldextract-${pkgver}"
    python2 setup.py pytest
}

package() {
    cd "tldextract-${pkgver}"
    python2 setup.py install --root=${pkgdir} --optimize=1 --skip-build

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # use the snapshot version, because generating a new on requires Internet access and root permission
    _sitepkgs_dir=$(python2 -c "from __future__ import print_function; from distutils.sysconfig import get_python_lib; print(get_python_lib(), end='')")
    ln -s .tld_set_snapshot "${pkgdir}${_sitepkgs_dir}/tldextract/.tld_set"

    # Avoid conflict with the python3 version
    mv "${pkgdir}/usr/bin/tldextract" "${pkgdir}/usr/bin/py2-tldextract"
}
