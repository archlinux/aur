_gitname="camisole"
pkgname=camisole-git
pkgver=1.4.r3.g5fcae91
pkgrel=1
pkgdesc="An asyncio-based source compiler and test runner."
arch=('any')
url="https://github.com/prologin/${_gitname}"
license=('GPL')
conflicts=('camisole')
provides=('camisole')
depends=('isolate-git'
         'python'
         'python-aiohttp'
         'python-msgpack'
         'python-yaml')
optdepends=('camisole-languages: Metapackage for all the built-in languages')
makedepends=('git' 'python-setuptools')
source=("git+${url}.git"
        'camisole.service'
        'sysusers.conf'
        '_camisole')
sha1sums=('SKIP'
          'f78871b7e4b56b6642eec8896d1a91c135a59313'
          '52da2781a8d90d00d2d78b02f6e593340191de84'
          'ea2412e9068571af19537b8d1f448f1fc0c29f05')
install=${pkgname}.install

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_gitname}"
    python setup.py install --root="${pkgdir}" || return 1
    install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_gitname}.conf"
    install -Dm644 "${srcdir}/camisole.service" "${pkgdir}/usr/lib/systemd/system/${_gitname}.service"
    install -m0755 -d "$pkgdir"/usr/share/zsh/site-functions
    install -m0644 "${srcdir}/_camisole" "$pkgdir"/usr/share/zsh/site-functions
}
