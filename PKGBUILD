# Maintainer: Manuel Thalmann <m@nuth.ch>
_pkgname="swyh-rs"
_repo="dheijl/$_pkgname"
pkgname="$_pkgname-git"
pkgver=1.11.6.r15.g033a36e
pkgrel=2
pkgdesc="Stream What You Hear written in rust, inspired by SWYH."
arch=(any)
url=https://github.com/dheijl/swyh-rs/
license=('MIT')
groups=()
depends=()
makedepends=('cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=(!lto)
source=("$_pkgname"::git+https://github.com/$_repo#branch=master)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkgname"
    cargo fetch --locked
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$_pkgname"
    cargo build --release --frozen
    cargo build --release --frozen --bin swyh-rs-cli --features cli --no-default-features
}

package() {
    _desktopDir="$pkgdir/usr/share/applications"
    _iconDir="$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -dm755 "$_desktopDir" "$_iconDir"
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname/target/release/$_pkgname"{,-cli}
    install -Dm644 "$_pkgname/assets/swyh-rs logo RS_tall.svg" "$_iconDir/$_pkgname.svg"
    install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    printf "%s\n" \
        "[Desktop Entry]" \
        Type=Application \
        Exec=swyh-rs \
        Icon=$_pkgname > "$_desktopDir/$_pkgname.desktop"
}
