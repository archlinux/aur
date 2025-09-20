#!/usr/bin/env bash
# Maintainer: Collins Kimutai <ngenocollins599@gmail.com>

_pkgname="shadowsocks-rust"
pkgname="$_pkgname-git"
pkgver=1.23.5.r61.g69119e3  # placeholder, will be dynamically set by pkgver()
pkgrel=1
pkgdesc="A Rust port of shadowsocks"
arch=('x86_64')
url="https://github.com/shadowsocks/shadowsocks-rust"
license=('MIT')

depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'clang' 'llvm')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=("git+https://github.com/shadowsocks/shadowsocks-rust.git"
        'shadowsocks-rust@.service'
        'shadowsocks-rust-server@.service')
noextract=("$_pkgsrc")
sha256sums=('SKIP'
            '93cd4fffaaf326beefd2657ed4f3c239d85c207210c63882c71ef0d724304da2'
            'cc1c7c30137e720500206cf0ba4e798ced439e8a01639d28064468e4a1205070')

pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
        | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgsrc"
    export LIBCLANG_PATH=/usr/lib
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgsrc"
    cargo build --release --frozen --features full-extra
}

check() {
   # cd "$_pkgsrc"
   # for test_bin in target/release/ss*; do
   #     [ -f "$test_bin" ] && "$test_bin"
   # done
   echo "Skipping tests because they require network/local_address"
}

package() {
    cd "$_pkgsrc"
    install -Dm755 target/release/{sslocal,ssserver,ssurl,ssmanager,ssservice} -t "$pkgdir"/usr/bin/
    install -Dm644 "$srcdir"/$_pkgname{@,-server@}.service -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm644 examples/config_ext.json "$pkgdir"/etc/$_pkgname/config_ext_rust.json.example
    install -Dm644 examples/config.json "$pkgdir"/etc/$_pkgname/config_rust.json.example
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

