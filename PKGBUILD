# Maintainer: Beini <bane at iki dot fi>
pkgname=perlnavigator
_pkgname=PerlNavigator
pkgver=0.6.2
pkgrel=1
pkgdesc="Perl Language Server that includes syntax checking, perl critic, and code navigation"
url="https://github.com/bscan/PerlNavigator"
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/bscan/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ffdfa274b16880b09794fdbec762744dd0db39bb180aac9e483e1757a9802414d3a89bfaa53c3ae7576c336e32d0286bb9f0475c79472490d395403e5007b940')
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
