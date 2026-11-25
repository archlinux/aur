# Maintainer: Bernardo Pinto Gomes <bernardopgomes@hotmail.com>
# Development package: builds the latest commit of the main branch.
pkgname=bitter-browser-git
pkgver=0.6.2.r0.ge005603
pkgrel=1
pkgdesc='Focused, native web browser for the Linux desktop'
arch=('x86_64')
url='https://browser.bebitterbebetter.com.br/'
license=('MPL-2.0')
depends=('dconf' 'glib2' 'glibc' 'gtk4' 'hicolor-icon-theme' 'libadwaita' 'libgcc' 'libsoup3' 'pango' 'webkitgtk-6.0')
optdepends=('gst-plugins-good: VP9, WebM and Opus video, as used by YouTube'
            'gst-plugins-bad: Media Source Extensions demuxers and AV1 decoding'
            'gst-libav: H.264 and AAC video'
            'gst-plugin-va: hardware video decoding on Intel and AMD graphics'
            'xdg-desktop-portal: camera, microphone and screen sharing'
            'xdg-utils: make Bitter Browser the default browser on every desktop'
            'geoclue: location for sites you allow'
            'hunspell-en_us: spell checking dictionary (install the ones for your languages)')
makedepends=('cargo' 'git' 'meson')
# The bundled SQLite is C; makepkg LTO turns it into GCC bitcode that the Rust linker cannot read.
options=('!lto')
provides=('bitter-browser')
conflicts=('bitter-browser' 'bitter-browser-bin')
source=('git+https://github.com/bernardopg/bitter-browser.git')
sha256sums=('SKIP')

pkgver() {
    cd bitter-browser
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd bitter-browser
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd bitter-browser
    export RUSTUP_TOOLCHAIN=stable CARGO_NET_OFFLINE=true
    arch-meson . build
    meson compile -C build
}

check() {
    cd bitter-browser
    export RUSTUP_TOOLCHAIN=stable CARGO_NET_OFFLINE=true CARGO_TARGET_DIR=build/cargo-target
    # The browser crate's tests need a display; these run anywhere, also in a clean chroot.
    cargo test --frozen --release -p bitter-core -p bitter-adblock -p bitter-cli
}

package() {
    cd bitter-browser
    meson install -C build --destdir "$pkgdir"
}
