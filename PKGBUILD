# Maintainer: YTJVDCM <50657624+YTJVDCM@users.noreply.github.com>
_pkgname='vrc-get'
pkgname=alcom
pkgver=1.0.0
pkgrel=2
pkgdesc="A fast open-source alternative of VRChat Creator Companion (VCC)"
arch=('x86_64')
url='https://github.com/vrc-get/vrc-get/vrc-get-gui'
license=('MIT')
depends=(cairo desktop-file-utils gdk-pixbuf2 gcc-libs glibc glib2 gtk3 hicolor-icon-theme libsoup3 openssl pango webkit2gtk-4.1)
makedepends=(cargo cargo-about nodejs-lts-iron npm dotnet-sdk lld)
optdepends=('unityhub: Used to open the created project.')
options+=(!lto)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/gui-v${pkgver}.tar.gz" "build.patch" "ALCOM.desktop")
sha256sums=('cbef6477870ba0631f2a31de0adb8657408dfdb1f7bf18e46b3ab8c80765c43a' '8ef4154e40f002492b73548ce67a870a1b3f3c29a7f879e588923888ba7e23a4' '3a836ea151012e1c69e096a033c0ba9ce3cb1a1b884e13acb91bfdf56074b802')

prepare() {
    cd "$_pkgname-gui-v$pkgver"
    
    # issue patch for https://github.com/vrc-get/vrc-get/issues/1818
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

    mv "target/release/bundle/deb/ALCOM_${pkgver}_amd64/data/usr/bin/ALCOM" "target/release/bundle/deb/ALCOM_${pkgver}_amd64/data/usr/bin/$pkgname"

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cp -ar "target/release/bundle/deb/ALCOM_${pkgver}_amd64/data/usr/share/icons" "$pkgdir/usr/share/"
    
    install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/ALCOM.desktop"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/bundle/deb/ALCOM_${pkgver}_amd64/data/usr/bin/$pkgname"
}
