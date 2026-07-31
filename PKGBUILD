# Maintainer: Ethan Stokes <erstokes10@gmail.com>

pkgname=macros
pkgver=0.4.0
pkgrel=1
pkgdesc='A Tauri app to manage and run macros on Linux.'
url='https://github.com/EthanRStokes/macros'
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('cargo' 'git' 'pnpm')
depends=(
    'gtk3' 'nss' 'alsa-lib' 'hicolor-icon-theme' 'webkit2gtk-4.1'
    'libgcc' 'glibc'
)
conflicts=('macros')
provides=('macros')
source=("$pkgname-$pkgver.tar.gz::https://github.com/EthanRStokes/macros/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9a997c09f340eed31e36663039cd5d58d26a31e22da5e4c049ab644a5b9b0e91')
options=('!lto')

prepare() {
    cd "$srcdir/Macros-$pkgver"

    cargo fetch
    pnpm install --dir ui
}

build() {
    cd "$srcdir/Macros-$pkgver"
    export MACROS_PNPM_OFFLINE=1
    cargo build --release --frozen
}

package() {
    cd "$srcdir/Macros-$pkgver"

    local libdir="$pkgdir/usr/lib/macros"

    # Binary's RUNPATH is $ORIGIN, so the CEF runtime payload (libcef.so,
    # GL/Vulkan shims, *.pak, icudtl.dat, locales/, ...) has to live alongside
    # it in a private libdir, not /usr/bin.
    install -Dm755 "target/release/macros"                     "$libdir/macros"
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
    ln -sf /usr/lib/macros/macros "$pkgdir/usr/bin/macros"

    install -Dm644 "res/icons/macros.png" "$pkgdir"/usr/share/icons/hicolor/256x256/apps/macros.png
    install -Dm644 "res/macros.desktop" "$pkgdir"/usr/share/applications/macros.desktop
}
