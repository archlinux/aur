# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=paketkoll
_pkgver=0.1.2
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Fast integrity check for files installed by pacman"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/VorpalBlade/paketkoll"
license=('MPL-2.0')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$_pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-${_pkgver}.crate")
sha256sums=('a534d8ff5d676b6acaf222838f463e71b9d6c0efdf8d2e887c311722eab45947')

prepare() {
    cd "$pkgname-$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features --features=arch_linux
}

check() {
    cd "$pkgname-$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --no-default-features --features=arch_linux
}

package() {
    cd "$pkgname-$_pkgver"
    local _cmd_name="target/release/${pkgname}"
    # The directory has a random hash in it, so we need to find it
    local _completions_dir=$(ls -d target/debug/build/paketkoll-*/out)
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_cmd_name"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/"
    install -m644 "${_completions_dir}/_${pkgname}" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -m644 "${_completions_dir}/${pkgname}.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -m644 "${_completions_dir}/${pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
