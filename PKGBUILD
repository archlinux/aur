# Maintainer: AkusenArcade <akudesyn@gmail.com>

pkgname=genoma
_tag=v0.1.22
pkgver=0.1.22
pkgrel=1
pkgdesc="A Wayland shell toolkit: a Rust core drawing through Vulkan, interfaces written in Luau and reloaded live"
arch=('x86_64' 'aarch64')
url="https://github.com/AkusenArcade/Genoma"
license=('GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'wayland'
    'libxkbcommon'
    # Everything is drawn through wgpu's Vulkan backend, and there is no
    # other: without a driver nothing is drawn at all.
    'vulkan-icd-loader'
    'vulkan-driver'
    # Audio: devices, streams and levels (@genoma/audio).
    'libpipewire'
    # The session lock's password (@genoma/lock).
    'pam'
)
optdepends=(
    'udisks2: removable drives (@genoma/drives)'
    'ddcutil: external monitors in @genoma/brightness'
    'accountsservice: users and their pictures (@genoma/accounts)'
    'xdg-desktop-portal: appearance settings, file chooser (@genoma/portal)'
    'wl-screenrec: screen recording (@genoma/kit/record)'
    'wf-recorder: screen recording without wl-screenrec'
)
makedepends=('cargo' 'clang')
# libspa builds a small C shim that makepkg's LTO turns into bitcode, which
# Rust's linker cannot resolve (undefined spa_format_parse_libspa_rs).
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('e005d07a67025253c86b4ff008532717465bc7e77243cb90defbafcc9cebe887')

_srcdir() {
    printf '%s/Genoma-%s' "$srcdir" "${_tag#v}"
}

prepare() {
    cd "$(_srcdir)"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$(_srcdir)"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --package genoma
}

package() {
    cd "$(_srcdir)"
    install -Dm755 target/release/genoma "$pkgdir/usr/bin/genoma"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
