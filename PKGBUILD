# Maintainer: CUI Hao <cuihao.leo@gmail.com>

pkgbase="awatcher"
pkgname=('awatcher-bundle' 'aw-awatcher')
pkgdesc="Activity and idle watchers"
pkgver=0.3.0
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
    '95a761d220c8769941c449869e3ba3467a4942bd272c57fbf2d3c23ebfe56024'
)
# LTO seems to break libsqlite3-sys compilation
options=('!lto')

prepare() {
    cd "${pkgbase}-${pkgver}"
    export RUSTUP_TOOLCHAIN=nightly-2023-11-01
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

    test -d aw-webui || git clone https://github.com/ActivityWatch/aw-webui.git
    cd aw-webui
    git checkout 2f3d1e8390c3d5314a69bfd1a8d388d90b74280f
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
