# Maintainer: Beini <bane at iki dot fi>
pkgname=perlnavigator
_pkgname=PerlNavigator
pkgver=0.5.7
pkgrel=1
pkgdesc="Perl Language Server that includes syntax checking, perl critic, and code navigation"
url="https://github.com/bscan/PerlNavigator"
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/bscan/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('1f6bf47cc3b54a44ced3dd377ebbf100965b55ffbc28275029b7f3ab49365ad7f99d3211626324a7f26044e4b8e0d961714059a184787d83781dce7c959860ad')
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
