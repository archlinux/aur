# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='openasar'
pkgname="${_pkgname}-git"
pkgver=r784.0b1d468
pkgrel=1
pkgdesc="Open-source alternative of Discord desktop's app.asar"
arch=('i686' 'x86_64')
url="https://github.com/GooseMod/OpenAsar"
license=('MIT')
depends=('unzip')
makedepends=('git' 'asar' 'nodejs')
optdepends=('discord')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git" "post-upgrade-discord" "openasar-git-discord-upgrade.hook" "pre-remove-discord" "openasar-git-discord-remove.hook")
sha1sums=('SKIP'
          '7bc291ac6ba295ed707daeabcabb42da7b4ceedb'
          '275d5228ceb7c5d39c3d846a898b98624cbef02b'
          '99664e9a0b07f43052cb75d5ccdb8b5123134fbc'
          '9fa086af362a64a4b0a7f01c4235d3b4fdacad06')
install="$pkgname.install"

pkgver() {
    cd "${srcdir}/OpenAsar"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "${srcdir}/post-upgrade-discord" -t "${pkgdir}/usr/share/libalpm/scripts/"
    install -Dm755 "${srcdir}/pre-remove-discord" -t "${pkgdir}/usr/share/libalpm/scripts/"
    install -Dm644 "${srcdir}/openasar-git-discord-remove.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
    install -Dm644 "${srcdir}/openasar-git-discord-upgrade.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
    cd "${srcdir}/OpenAsar"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    sed -i -e "s/nightly/nightly-$(git rev-parse HEAD | cut -c 1-7)/" src/index.js
    node scripts/strip.js
    asar pack src app.asar
    install -Dm 644 app.asar "${pkgdir}/opt/${pkgname}/app.asar"
}
