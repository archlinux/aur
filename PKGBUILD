# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=yacd-meta
_pkgname=Yacd-meta
pkgver=0.3.8
pkgrel=3
pkgdesc="Yet Another Clash Dashboard (MetaCubeX fork of yacd)"
arch=('any')
url="https://github.com/MetaCubeX/Yacd-meta"
license=('MIT')
install=yacd-meta.install
makedepends=('nodejs' 'pnpm')
optdepends=('mihomo: Another Clash Kernel by MetaCubeX')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0e7e72edb35b5da448d2d6a5c324e9d1d8ca354e1466692f93163208ea76a1a5')

_pnpm_setup() {
    export PNPM_HOME="${srcdir}/.pnpm-home"
    export pnpm_config_store_dir="${srcdir}/.pnpm-store"
    export pnpm_config_cache_dir="${srcdir}/.pnpm-cache"
    export pnpm_config_state_dir="${srcdir}/.pnpm-state"
}

prepare() {
    cd "${_pkgname}-${pkgver}"
    _pnpm_setup
    pnpm fetch --ignore-scripts
}

build() {
    cd "${_pkgname}-${pkgver}"
    _pnpm_setup
    pnpm install --offline --frozen-lockfile --ignore-scripts
    pnpm build
}

package() {
    cd "${_pkgname}-${pkgver}"
    # The project does not have a LICENSE file in the repository root
    # even though package.json specifies MIT

    cd public
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
}
