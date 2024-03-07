# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Marcell Pardavi <marcell.pardavi@gmail.com>

# I saw upstream "closed" the Linux support issue and made the code repository
# public and open sourced it, so I thought "Yay"!. It turns out that was
# premature. The issue actually just got migrated and the source is open but
# still macOS only (builds with Xcode and targets Metal for the UI). So this
# package isn't going to work yet. That being said now that the source is
# public I kind of expect it won't take the community *so very long* to help
# port it to other platforms. As such I'll leave this up and keep working on it
# for when that actually happens. PKGREL=0 because not-yet-functional.

# git submodules with vendored dependencies
declare -gA _tags=(
    [protocol]="8645a138fb2ea72c4dab13e739b1f3c9ea29ac84"
)

pkgname=zed-editor
pkgver=0.126.0
_pkgver=$pkgver-pre
pkgrel=0
pkgdesc='high-performance, multiplayer code editor from the creators of Atom and Tree-sitter'
arch=(x86_64)
url=https://zed.dev
_url="https://github.com/zed-industries/zed"
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)
depends=(alsa-lib
         fontconfig
         gcc-libs
         glibc
         libxkbcommon-x11
         openssl
         vulkan-driver
         vulkan-icd-loader
         wayland
         zstd)
makedepends=(cargo
             # clang
             # gcc-objc
             # libdispatch
             # protobuf
             vulkan-headers
             vulkan-validation-layers
             # wasmtime
            )
_archive="zed-$_pkgver"
source=("$_url/archive/v$_pkgver/$_archive.tar.gz"
        "protocol-${_tags[protocol]}.tar.gz::https://github.com/livekit/protocol/archive/${_tags[protocol]}.tar.gz")
sha256sums=('d60cd49363585c6788bd92406de4562762365f84cb871ca45fdd76e21ae155d2'
            'cd26bc1015fa0b79154c23a385441ae81e9a4385211cf2989eb939ae83d0e414')

prepare() {
	cd "$_archive"

	rm -r crates/live_kit_server/protocol
	ln -sT "$srcdir/protocol-${_tags[protocol]}" crates/live_kit_server/protocol

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
}
