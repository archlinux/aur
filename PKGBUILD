# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
_github_url=https://github.com/lopsided98/dnsupdate
pkgname=dnsupdate-git
pkgver=0.3.r3.g34da062
pkgrel=1
pkgdesc="The last dynamic DNS client you'll ever need"
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
conflicts=('dnsupdate')
provides=('dnsupdate')
source=(${pkgname}::git+${_github_url}.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
    cd "${srcdir}/${pkgname}"
    python setup.py test
}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build

    # Build man pages
    python setup.py build_docs -b man
}

package() {
    cd "${srcdir}/${pkgname}"

    python setup.py install --skip-build --root="${pkgdir}" --optimize=1

    install -Dm644 dnsupdate.service -t "${pkgdir}/usr/lib/systemd/system/"

    cd build/docs/man
    install -Dm644 "dnsupdate.1" -t "${pkgdir}/usr/share/man/man1/"
    install -Dm644 "dnsupdate.5" -t "${pkgdir}/usr/share/man/man5/"
}

# vim:set ts=4 sw=4 et:
