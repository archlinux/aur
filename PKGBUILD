# Maintainer: YTJVDCM <50657624+YTJVDCM@users.noreply.github.com>
_pkgname='vrc-get'
pkgname=alcom
pkgver=1.1.3
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion (VCC)"
arch=('x86_64')
url='https://github.com/vrc-get/vrc-get'
license=('MIT')
depends=(cairo desktop-file-utils gdk-pixbuf2 gcc-libs glibc glib2 gtk3 hicolor-icon-theme libsoup3 openssl pango webkit2gtk-4.1)
makedepends=(cargo cargo-about nodejs-lts npm dotnet-sdk dotnet-runtime lld)
optdepends=('unityhub: Used to open created projects and migrate projects from older versions of Unity.')
options+=(!lto)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/gui-v${pkgver}.tar.gz" "build.patch")
sha256sums=('8d2a8caec630b0d578fbbb0de553ea58d5d630a59213a577607d1a987f56a691' '67c1142b825c3870f01c864c87a5d941e3f9e3c1a08fddb437afa40eb384299c')

prepare() {
    cd "$_pkgname-gui-v$pkgver"

    # Disable updater for deb build
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
