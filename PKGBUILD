# Maintainer: CUI Hao <cuihao.leo@gmail.com>

pkgbase="awatcher"
pkgname=('awatcher-bundle' 'aw-awatcher')
pkgdesc="Activity and idle watchers"
pkgver=0.2.4
pkgrel=1
arch=('x86_64')
url="https://github.com/2e3s/${pkgbase}"
license=('MPL-2.0')
depends=()
makedepends=('rustup' 'cargo' 'npm' 'git' 'dbus' 'openssl')
source=(
    "${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    'd5efaf4d01fa493c720e5443c6b383bfe53160101716bdd96dbbcee1ca440b73'
)
# LTO seems to break libsqlite3-sys compilation
options=('!lto')

prepare() {
    cd "${pkgbase}-${pkgver}"
    export RUSTUP_TOOLCHAIN=nightly-2023-11-01
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

    test -d aw-webui || git clone https://github.com/ActivityWatch/aw-webui.git
    cd aw-webui
    git checkout 839366e66f859faadd7f9128de3bea14b25ce4ae
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
    export RUSTUP_TOOLCHAIN=nightly-2023-11-01
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
