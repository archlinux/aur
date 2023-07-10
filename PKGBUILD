# Maintainer: Beini <bane at iki dot fi>
pkgname=perlnavigator
_pkgname=PerlNavigator
pkgver=0.5.9
pkgrel=1
pkgdesc="Perl Language Server that includes syntax checking, perl critic, and code navigation"
url="https://github.com/bscan/PerlNavigator"
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/bscan/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b27a5bbf380e99728de5ff5469c0171a66e70551accbac7c39c9e9dd91830b034725d8df40685e7f50ed1eeb152d435ebc94b1c4e908641e12682df3eeec353e')
arch=('x86_64')
depends=('glibc' 'gcc-libs')
makedepends=('npm')
options=("!strip")

prepare() {
    cd "${_pkgname}-${pkgver}"
    npm_config_cache="${srcdir}/npm-cache" npm run ci-all
}

build() {
    cd "${_pkgname}-${pkgver}"
    npm run compile

    PKG_CACHE_PATH="${srcdir}/pkg-cache" \
      ./node_modules/.bin/pkg -t node18-linux .
}

package() {
    cd "${_pkgname}-${pkgver}"

    install -Dm755 dist/perlnavigator "${pkgdir}/usr/bin/perlnavigator"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
