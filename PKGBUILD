pkgname='chad-launcher-git'
_pkgname=${pkgname%-git}
pkgver=r254.18e56ea
pkgrel=1
pkgdesc='GNU/LINUX GAMING UNLEASHED!'
arch=('x86_64')
url='https://notabug.org/johncena141/chad_launcher'
license=('GPL3')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips)
makedepends=(cargo npm git squashfs-tools patchelf)
provides=('chad-launcher')
replaces=(chad_launcher-git)
source=("git+https://notabug.org/johncena141/${_pkgname}.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    npm install
    npm run build
    npm run tauri build
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "src-tauri/target/release/chad-launcher"
    install -Dm644 ./chad-launcher.desktop "$pkgdir/usr/share/applications/chad-launcher.desktop"
    install -Dm644 ./icon.svg "$pkgdir/usr/share/pixmaps/chad-launcher.svg"
}

