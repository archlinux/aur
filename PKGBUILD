# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
# Maintainer: Denis Kasak <dkasak AT termina DOT org DOT uk>
#Contributor: Olivier Le Moal <mail at olivierlemoal dot fr>
#Contributor: Dawid Wrobel <cromo@klej.net>
#Contributor: Sébastien Duquette <ekse.0x@gmail.com>
#Contributor: onny <onny@project-insanity.org>

pkgname=wfuzz
pkgver=3.0.1
pkgrel=1
pkgdesc="Utility to bruteforce web applications to find their not linked resources"
url="https://github.com/xmendez/wfuzz"
arch=('any')
license=('GPL')
depends=('python-pycurl' 'python-pyparsing' 'python-future' 'python-chardet' 'python-six')
makedepends=('python-setuptools' 'python-sphinx')
source=("https://github.com/xmendez/wfuzz/archive/v$pkgver.tar.gz")
sha256sums=('55ac415c66db05f1f0504e35426caa52b0322c6a87c7c529a84a9c8d061426fd')

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
