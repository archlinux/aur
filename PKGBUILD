# Maintainer: CUI Hao <cuihao.leo@gmail.com>

pkgbase="awatcher"
pkgname=('awatcher-bundle' 'aw-awatcher')
pkgdesc="Activity and idle watchers"
pkgver=0.4.0
pkgrel=1
arch=('x86_64')
url="https://github.com/2e3s/${pkgbase}"
license=('MPL-2.0')
depends=()
makedepends=('rust' 'cargo' 'npm' 'nodejs' 'git' 'dbus' 'openssl' 'libxkbcommon')
source=(
    "${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('6bef86a64020ba6eaf6a2d46552b56c60bffbbb31fd4a46ee16614a4b10c978b')
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
    # The lock file pins one dependency to a git repository.
    npm --allow-git=all ci

    # npm>=12 blocks install scripts by default. Only vue-demi's postinstall
    # matters here: it switches the shim to the installed Vue (2.7), without
    # which pinia fails to build ("hasInjectionContext" is not exported).
    # `npm install-scripts approve vue-demi` reports success but doesn't
    # actually run it for the nested copies, so invoke it directly.
    local _demi
    while IFS= read -r -d '' _demi; do
        ( cd "${_demi}" && node ./scripts/postinstall.js )
    done < <(find node_modules -type d -name vue-demi -print0)

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
    depends=('dbus' 'openssl' 'libgcc' 'glibc')

    cd "${pkgbase}-${pkgver}"
    install -Dm0755 "target/release/${pkgbase}-bundle" -t "${pkgdir}/usr/bin"
}

package_aw-awatcher() {
    pkgdesc="Activity and idle watchers (ActivityWatch module)"
    depends=('openssl' 'libgcc' 'glibc')
    optdepends=('activitywatch: ActivityWatch server')

    cd "${pkgbase}-${pkgver}"
    install -Dm0755 "target/release/aw-${pkgbase}" -t "${pkgdir}/usr/bin"
}
