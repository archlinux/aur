# Maintainer: YTJVDCM <50657624+YTJVDCM@users.noreply.github.com>
_pkgname='vrc-get'
pkgname=alcom
pkgver=1.1.4
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion (VCC)"
arch=('x86_64')
url='https://github.com/vrc-get/vrc-get'
license=('MIT')
depends=(gtk3 openssl webkit2gtk-4.1)
makedepends=(cargo nodejs-lts npm)
optdepends=('unityhub: Used to open created projects and migrate projects from older versions of Unity.')
options+=(!lto)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/gui-v${pkgver}.tar.gz" "build.patch")
sha256sums=('112d8d6e01b9902a92e0e750993ad702a886ac93c6ecda5adf9b59f68b1d2079' 'e5c0c9aa480e9d020ebca18ca6979efeca2c5de7f49cbb56aabb639c2f74aa31')

prepare() {
    cd "$_pkgname-gui-v$pkgver"

    # Disable updater for deb build (This is not working after v1.1.4, I'm trying to fix this. )
    patch -p 1 -i "${srcdir}/build.patch"

    cd "$_pkgname-gui"

    export RASTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname-gui-v$pkgver/$_pkgname-gui"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # npm run tauri build
    npm run -- tauri build --config '{"bundle":{"targets":["deb"]}}'
}

check() {
    cd "$_pkgname-gui-v$pkgver/$_pkgname-gui"
    export RUSTUP_TOOLCHAIN=stable
    cargo test -p vrc-get-gui --frozen --all-features
}

package() {
    cd "$_pkgname-gui-v$pkgver/$_pkgname-gui"

    # mv "target/release/bundle/deb/ALCOM_${pkgver}_amd64/data/usr/bin/ALCOM" "target/release/bundle/deb/ALCOM_${pkgver}_amd64/data/usr/bin/$pkgname"

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cp -ar "target/release/bundle/deb/ALCOM_${pkgver}_amd64/data/usr/share/icons" "$pkgdir/usr/share/"
    
    install -Dm644 -t "$pkgdir/usr/share/applications/" "target/release/bundle/deb/ALCOM_${pkgver}_amd64/data/usr/share/applications/ALCOM.desktop"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/bundle/deb/ALCOM_${pkgver}_amd64/data/usr/bin/ALCOM"
}
