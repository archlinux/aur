# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='openasar'
pkgname="${_pkgname}-git"
pkgver=r737.029123e
pkgrel=1
pkgdesc="Open-source alternative of Discord desktop's app.asar"
arch=('i686' 'x86_64')
url="https://github.com/GooseMod/OpenAsar"
license=('MIT')
depends=('discord')
makedepends=('git' 'asar' 'nodejs')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/GooseMod/OpenAsar.git')
sha1sums=('SKIP')
install="$pkgname.install"

pkgver() {
    cd OpenAsar
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd OpenAsar
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    bash scripts/injectPolyfills.sh
    sed -i -e "s/nightly/nightly-$(git rev-parse HEAD | cut -c 1-7)/" src/index.js
    node scripts/strip.js
    asar pack src app.asar
    install -Dm 644 app.asar "${pkgdir}/opt/${pkgname}/app.asar"
}
