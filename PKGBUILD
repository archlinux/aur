# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
# Maintainer: Denis Kasak <dkasak AT termina DOT org DOT uk>
#Contributor: Olivier Le Moal <mail at olivierlemoal dot fr>
#Contributor: Dawid Wrobel <cromo@klej.net>
#Contributor: Sébastien Duquette <ekse.0x@gmail.com>
#Contributor: onny <onny@project-insanity.org>

pkgname=wfuzz
pkgver=3.1.0
pkgrel=1
pkgdesc="Utility to bruteforce web applications to find their not linked resources"
url="https://github.com/xmendez/wfuzz"
arch=('any')
license=('GPL')
depends=('python-pycurl' 'python-pyparsing' 'python-future' 'python-chardet' 'python-six')
makedepends=('python-setuptools' 'python-sphinx')
source=("https://github.com/xmendez/wfuzz/archive/v$pkgver.tar.gz")
sha256sums=('60798e56274a377f8770d162935a040d4d6e27919bfbb46cf13a7a0a34896be9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/docs"
    python conf.py
    make SPHINXOPTS='-Q -j auto' man html
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dt "$pkgdir/usr/share/man/man1" docs/_build/man/*.1
    install -Dt "$pkgdir/usr/share/doc/${pkgname}" -m644 README.md
    cp -prt "$pkgdir/usr/share/doc/${pkgname}" docs/_build/html

    install -dm755 "$pkgdir/usr/share/${pkgname}/wordlists"
    cp -prt "$pkgdir/usr/share/${pkgname}/wordlists" wordlist/*

    install -Dm644 *_bash_completion "$pkgdir/etc/bash_completion.d/${pkgname}"

    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
