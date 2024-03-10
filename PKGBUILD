# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=paketkoll-git
_pkgname=${pkgname%-git}
pkgver=0.1.3.r9.2fe1846
pkgrel=1
pkgdesc="Fast integrity check for files installed by pacman"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/VorpalBlade/paketkoll"
license=('MPL-2.0')
makedepends=('cargo' 'cmake' 'git')
options=('!lto')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('paketkoll::git+https://github.com/VorpalBlade/paketkoll')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s" "$(git describe --long --tags --match "${_pkgname}-v*" | sed "s/${_pkgname}-v//;"'s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${_pkgname}"
    # Needed to ensure that we can find the latest man page and completions
    rm -rf target/release/build/${_pkgname}-*
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features --features=arch_linux
}

check() {
    cd "$srcdir/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --no-default-features --features=arch_linux
}

package() {
    cd "$srcdir/${_pkgname}"
    local _cmd_name="target/release/${_pkgname}"
    # The directory has a random hash in it, so we need to find it
    local _build_dir=$(ls -d target/release/build/${_pkgname}-*/out)
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_cmd_name"
    install -Dm644 -t "$pkgdir/usr/share/man/man1/" "${_build_dir}/${_pkgname}"*".1"
    install -Dm644 "${_build_dir}/_${_pkgname}" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -Dm644 "${_build_dir}/${_pkgname}.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "${_build_dir}/${_pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
