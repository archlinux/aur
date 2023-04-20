# Maintainer: wankong <gomu012003@163.com>
pkgname=gephgui-wry-git
_pkgname=gephgui-wry
pkgver=r104.a13d3e5
pkgrel=1
pkgdesc="Geph connects you with the censorship-free Internet, even when nothing else works"
arch=('x86_64')
url="https://github.com/geph-official/gephgui-wry"
license=('custom')
depends=(
  webkit2gtk
  gdk-pixbuf2
  libappindicator-gtk3
)
makedepends=(
  npm
  git
  cargo
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/geph-official/gephgui-wry.git"
        "io.geph.GephGui.png"
        "$_pkgname.desktop"
        "pac"
        "pac-real")
sha512sums=('SKIP'
            '4ab4ea78bfea63c48a0e802c984062d112db295db7b2c8ad24788cf7256e033d367323ee88099bf4b72e8ce96a4dbc1ff50b60147b9ed4859ed3915581f2a255'
            '963079a21066ca08f1ded7f2e30205d2690a368493656861da89271a315edc38ea23535b159d222e51d1c1eb95c2714560019fe855332966fd3313acc6af7f56'
            '5482fddc0fa1ed911f8b85893b6f928b2350ca7e42be7dec09183921aa3c463688d833be35fc2768b6b2ca5e6bd0229c37a5ee67b520de6563ae8f242db8160e'
            '57a848b3992e6687d115987f7ae45e479db08bb908a10ae4eeaf0978b48f54a767a4fb401862a37593701f211c0a74969be9814ca43922b49f60a805477368b9')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    git submodule update --init --recursive
    mkdir -p target
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname/gephgui"
    npm install --devDependencies
    npm run build
    cd ".."
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --features tray
}

package() {
    cd "$_pkgname"
    install -Dm 644 "$srcdir/io.geph.GephGui.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
    install -Dm 644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -D "$srcdir/pac" -t "$pkgdir/usr/bin"
    install -D "$srcdir/pac-real" -t "$pkgdir/usr/bin"
    install -D "target/release/$_pkgname" -t "$pkgdir/usr/bin"
}
