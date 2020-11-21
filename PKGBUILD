# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
_github_url=https://github.com/lopsided98/dnsupdate
pkgname=dnsupdate
pkgver=0.4
pkgrel=1
pkgdesc="A modern and flexible dynamic DNS client"
arch=('any')
url="${_github_url}"
license=('GPL3')
depends=('python-requests' 'python-yaml')
makedepends=(
    'git'
    'python-setuptools'
    'python-sphinx'
    'python-sphinx-argparse'
    'python-commonmark'
)
optdepends=(
     'python-beautifulsoup4: router address scraping'
     'python-netifaces: local interface address support'
)
conflicts=('dnsupdate-git')
source=(${pkgname}::git+${_github_url}.git#tag=${pkgver})
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build

    # Build man pages
    python setup.py build_docs -b man
}

check() {
    cd "${srcdir}/${pkgname}"
    python setup.py test
}

package() {
    cd "${srcdir}/${pkgname}"

    python setup.py install --skip-build --root="${pkgdir}" --optimize=1

    install -Dm644 dnsupdate.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 dnsupdate.timer -t "${pkgdir}/usr/lib/systemd/system/"

    cd build/docs/man
    install -Dm644 "dnsupdate.1" -t "${pkgdir}/usr/share/man/man1/"
    install -Dm644 "dnsupdate.5" -t "${pkgdir}/usr/share/man/man5/"
}

# vim:set ts=4 sw=4 et:
