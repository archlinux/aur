pkgname='rum'
pkgver=0.7.3
pkgrel=1
pkgdesc='Game library management'
arch=('x86_64')
url='https://github.com/jc141x/rum'
license=('GPL3')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips udev)
makedepends=(cargo npm git squashfs-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jc141x/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('d7a40e7cb5c5b9c1d046f6a08a8de2cb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
    sed -i 's/pnpm/npm run/' src-tauri/tauri.conf.json
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    npm install
    npm run tauri build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "src-tauri/target/release/$pkgname"
    install -Dm644 ./$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 ./icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}

