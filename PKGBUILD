# Maintainer: Beini <bane at iki dot fi>
pkgname=perlnavigator
_pkgname=PerlNavigator
pkgver=0.5.4
pkgrel=1
pkgdesc="Perl Language Server that includes syntax checking, perl critic, and code navigation"
url="https://github.com/bscan/PerlNavigator"
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/bscan/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('75aca3ce873eefd9a7722166526a778e988bd41ef12449565c55a31db949b74f')
arch=('x86_64')
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
      ./node_modules/.bin/pkg -t "node14-linux-x64" .
}

package() {
    cd "${_pkgname}-${pkgver}"

    install -Dm755 dist/perlnavigator "${pkgdir}/usr/bin/perlnavigator"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
