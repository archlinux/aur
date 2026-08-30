# Maintainer: YTJVDCM <50657624+YTJVDCM@users.noreply.github.com>
_pkgname='vrc-get'
pkgname=alcom
pkgver=1.1.8
pkgrel=2
pkgdesc="A fast open-source alternative of VRChat Creator Companion (VCC)"
arch=('x86_64' 'aarch64')
url='https://github.com/vrc-get/vrc-get'
license=('MIT')
depends=(gtk3 openssl webkit2gtk-4.1)
makedepends=(cargo nodejs npm)
optdepends=('unityhub: Used to open created projects and migrate projects from older versions of Unity.' 'libxml2-legacy: Fix the issue of the missing libxml2.so.2 error in Unity for Linux.')
options+=(!lto)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/gui-v${pkgver}.tar.gz" "build.patch")
sha256sums=('6b5b65a5d8e4eaaceab4f8b3ccb241d5b3f43fa2b9f514893403e0665f7643bc' '4aab543caa7554ab0ab3434bc3ea9af185abc7c8614c5c4e15b1ede1269126a9')

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
    cargo xtask build-alcom --release --no-self-updater --target "${CARCH}-unknown-linux-gnu"
    
    cd "$srcdir/$_pkgname-gui-v$pkgver"

    cargo xtask bundle-alcom --release --target "${CARCH}-unknown-linux-gnu" --bundles buildroot --buildroot "target/${CARCH}-unknown-linux-gnu/release/bundle/"
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

    cp -ar "target/${CARCH}-unknown-linux-gnu/release/bundle/usr/share/icons" "$pkgdir/usr/share/"
    
    install -Dm644 -t "$pkgdir/usr/share/applications/" "target/${CARCH}-unknown-linux-gnu/release/bundle/usr/share/applications/alcom.desktop"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/${CARCH}-unknown-linux-gnu/release/bundle/usr/bin/alcom"
}
