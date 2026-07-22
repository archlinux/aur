# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: yuioto <yuiotochan@outlook.com>
# Contributor: Shunsuke Shibayama <sbym1346@gmail.com>

pkgname=erg-git
_pkg="${pkgname%-git}"
pkgver=0.6.53.r2.gb8bc4e33
pkgrel=1
pkgdesc='Statically typed language that builds upon the Python ecosystem'
url="https://github.com/erg-lang/erg"
license=('MIT OR Apache-2.0')
arch=(x86_64)
provides=("$_pkg")
conflicts=("$_pkg")
depends=(glibc libgcc libgcc_s.so)
makedepends=(cargo git)
optdepends=(python39 python310 python311)
source=("$_pkg::git+$url.git")
sha256sums=('SKIP')

# By enabling the --features flag, you can change the language in which error messages are displayed.
#
# Japanese
# cargo install erg --features japanese
#
# Chinese (Simplified)
# cargo install erg --features simplified_chinese
#
# Chinese (Traditional)
# cargo install erg --features traditional_chinese

pkgver() {
    git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd "$_pkg"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$_pkg"
    cargo build --release --frozen --features full
}

## Tests don't work with latest Arch release of Python
# check() {
#     export RUSTUP_TOOLCHAIN=stable
#     cd "$_pkg"
#     cargo test --frozen --features full -- --skip test_vm_embedding --no-capture
# }

package() {
    cd "$_pkg"
    install -Dm755 "target/release/$_pkg" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README{,_zh-CN,_zh-TW,_JA}.md -t "$pkgdir/usr/share/doc/$pkgname"
}
