# Maintainer: Beini <bane at iki dot fi>
pkgname=perlnavigator
_pkgname=PerlNavigator
pkgver=0.6.0
pkgrel=1
pkgdesc="Perl Language Server that includes syntax checking, perl critic, and code navigation"
url="https://github.com/bscan/PerlNavigator"
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/bscan/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('dba7425b4b655deba6f5f5f13c4f72fd429236e41f69dfbaea207b1dfcd1c787397f93c1fcf9aaefff427ccd6beb346d772c43c1c245e7d2a9b0d86afb34a860')
arch=('x86_64' 'aarch64')
depends=('glibc' 'gcc-libs')
makedepends=('npm')
options=("!strip")

prepare() {
    cd "${_pkgname}-${pkgver}"
    npm_config_cache="${srcdir}/npm-cache" \
      npm run ci-all
}

build() {
    cd "${_pkgname}-${pkgver}"
    npm run compile

    PKG_CACHE_PATH="${srcdir}/pkg-cache" \
      npx pkg -t node18-linux .
}

package() {
    cd "${_pkgname}-${pkgver}"

    install -Dm755 dist/perlnavigator "${pkgdir}/usr/bin/perlnavigator"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
