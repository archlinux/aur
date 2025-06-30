# Maintainer: YTJVDCM <50657624+YTJVDCM@users.noreply.github.com>
_pkgname='vrc-get'
pkgname=alcom
pkgver=1.1.2
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
sha256sums=('90e302aa1b27ca0de5726e3a04ab9e2e6705a7439670baa87a5560221fd5e16d' '0e3b8f215e5ffafa81e694854126dae68c4a4e780146fce1f25401596f5b406a')

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
