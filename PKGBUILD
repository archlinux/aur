# Maintainer: Ethan Stokes <erstokes10@gmail.com>

pkgname=blockwork
pkgver=0.5.0
pkgrel=1
pkgdesc='A Tauri app to visually create and run macros on Windows, Linux, and macOS.'
url='https://github.com/EthanRStokes/Blockwork'
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('cargo' 'git' 'pnpm')
depends=(
    'gtk3' 'nss' 'alsa-lib' 'hicolor-icon-theme' 'webkit2gtk-4.1'
    'libgcc' 'glibc'
)
conflicts=('macros')
provides=('macros')
source=("$pkgname-$pkgver.tar.gz::https://github.com/EthanRStokes/Blockwork/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('134026e0f56782461c6ab8f9146e7c1917a4738e01eb147df43583c84f4e016c')
options=('!lto')

prepare() {
    cd "$srcdir/Blockwork-$pkgver"

    cargo fetch
    pnpm install --dir ui
}

build() {
    cd "$srcdir/Blockwork-$pkgver"
    export BLOCKWORK_PNPM_OFFLINE=1
    cargo build --release --frozen
}

package() {
    cd "$srcdir/Blockwork-$pkgver"

    local libdir="$pkgdir/usr/lib/blockwork"

    # Binary's RUNPATH is $ORIGIN, so the CEF runtime payload (libcef.so,
    # GL/Vulkan shims, *.pak, icudtl.dat, locales/, ...) has to live alongside
    # it in a private libdir, not /usr/bin.
    install -Dm755 "target/release/blockwork"                     "$libdir/blockwork"
    install -Dm755 "target/release/libcef.so"                  "$libdir/libcef.so"
    install -Dm755 "target/release/libEGL.so"                  "$libdir/libEGL.so"
    install -Dm755 "target/release/libGLESv2.so"                "$libdir/libGLESv2.so"
    install -Dm755 "target/release/libvk_swiftshader.so"       "$libdir/libvk_swiftshader.so"
    install -Dm755 "target/release/libvulkan.so.1"              "$libdir/libvulkan.so.1"
    install -Dm755 "target/release/chrome-sandbox"              "$libdir/chrome-sandbox"
    install -Dm644 "target/release/vk_swiftshader_icd.json"    "$libdir/vk_swiftshader_icd.json"
    install -Dm644 "target/release/icudtl.dat"                  "$libdir/icudtl.dat"
    install -Dm644 "target/release/v8_context_snapshot.bin"    "$libdir/v8_context_snapshot.bin"
    install -Dm644 "target/release/chrome_100_percent.pak"     "$libdir/chrome_100_percent.pak"
    install -Dm644 "target/release/chrome_200_percent.pak"     "$libdir/chrome_200_percent.pak"
    install -Dm644 "target/release/resources.pak"               "$libdir/resources.pak"
    cp -r "target/release/locales" "$libdir/locales"

    install -d "$pkgdir/usr/bin"
    ln -sf /usr/lib/blockwork/blockwork "$pkgdir/usr/bin/blockwork"

    install -Dm644 "res/icons/blockwork.png" "$pkgdir"/usr/share/icons/hicolor/256x256/apps/blockwork.png
    install -Dm644 "res/blockwork.desktop" "$pkgdir"/usr/share/applications/blockwork.desktop
}
