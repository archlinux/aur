# Maintainer: YTJVDCM <50657624+YTJVDCM@users.noreply.github.com>
_pkgname='vrc-get'
pkgname=alcom
pkgver=1.1.7
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion (VCC)"
arch=('x86_64')
url='https://github.com/vrc-get/vrc-get'
license=('MIT')
depends=(gtk3 openssl webkit2gtk-4.1)
makedepends=(cargo nodejs npm)
optdepends=('unityhub: Used to open created projects and migrate projects from older versions of Unity.')
options+=(!lto)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/gui-v${pkgver}.tar.gz" "build.patch")
sha256sums=('d6b809cc505725af1249c22dcc0997c8fbebdd851f84c8097bd783c1da4e1e6d' 'cd8a4d740c160bc437e23379936587e3bdd7dfa7726a6b0490b166c4a8a6d3dc')

prepare() {
    cd "$_pkgname-gui-v$pkgver"

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
    # npm run -- tauri build --config '{"bundle":{"targets":["deb"]}}'
    cargo xtask build-alcom --release --no-self-updater --target 'x86_64-unknown-linux-gnu'

    cd "$srcdir/$_pkgname-gui-v$pkgver"

    cargo xtask bundle-alcom --release --target 'x86_64-unknown-linux-gnu' --bundles buildroot --buildroot 'target/x86_64-unknown-linux-gnu/release/bundle/'
}

check() {
    cd "$_pkgname-gui-v$pkgver/$_pkgname-gui"
    export RUSTUP_TOOLCHAIN=stable
    cargo test -p vrc-get-gui --frozen --all-features 
}

package() {
    cd "$_pkgname-gui-v$pkgver"

    # mv "target/release/bundle/deb/ALCOM_${pkgver}_amd64/data/usr/bin/ALCOM" "target/release/bundle/deb/ALCOM_${pkgver}_amd64/data/usr/bin/$pkgname"

    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cp -ar "target/x86_64-unknown-linux-gnu/release/bundle/usr/share/icons" "$pkgdir/usr/share/"
    
    install -Dm644 -t "$pkgdir/usr/share/applications/" "target/x86_64-unknown-linux-gnu/release/bundle/usr/share/applications/alcom.desktop"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/x86_64-unknown-linux-gnu/release/bundle/usr/bin/alcom"
}
