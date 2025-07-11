# Maintainer: CUI Hao <cuihao.leo@gmail.com>

pkgbase="awatcher"
pkgname=('awatcher-bundle' 'aw-awatcher')
pkgdesc="Activity and idle watchers"
pkgver=0.3.1
pkgrel=1
arch=('x86_64')
url="https://github.com/2e3s/${pkgbase}"
license=('MPL-2.0')
depends=()
makedepends=('rust' 'cargo' 'npm' 'git' 'dbus' 'openssl')
source=(
    "${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '384b3266e5ea869ec670c9fb65667f2ac7232cdcf411151d8216c2470c58b2e3'
)
# LTO seems to break libsqlite3-sys compilation
options=('!lto')

prepare() {
    cd "${pkgbase}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

    test -d aw-webui || git clone https://github.com/ActivityWatch/aw-webui.git
    cd aw-webui
    git checkout 291da6f2c5e7a6b896f23a4eec5ffed9874321ba
    git submodule update --init
}

_build_aw_webui() {
    export npm_config_cache="${srcdir}/npm-cache"

    pushd "aw-webui"
    cp -f media/logo/logo.png static/
    npm ci
    npm run build
    export AW_WEBUI_DIR="${PWD}/dist"
    popd
}

build() {
    cd "${pkgbase}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    _build_aw_webui
    cargo build --frozen --release --features=bundle
    mv "target/release/${pkgbase}" "target/release/${pkgbase}-bundle"

    cargo build --frozen --release
    mv "target/release/${pkgbase}" "target/release/aw-${pkgbase}"
}

package_awatcher-bundle() {
    pkgdesc="Activity and idle watchers (bundled version)"
    depends=('dbus' 'openssl')

    cd "${pkgbase}-${pkgver}"
    install -Dm0755 "target/release/${pkgbase}-bundle" -t "${pkgdir}/usr/bin"
}

package_aw-awatcher() {
    pkgdesc="Activity and idle watchers (ActivityWatch module)"
    depends=('openssl')
    optdepends=('activitywatch: ActivityWatch server')

    cd "${pkgbase}-${pkgver}"
    install -Dm0755 "target/release/aw-${pkgbase}" -t "${pkgdir}/usr/bin"
}
