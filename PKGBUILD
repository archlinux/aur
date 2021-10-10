pkgname='chad_launcher-git'
_pkgname='chad_launcher'
pkgver=r228.f7753df
pkgrel=1
pkgdesc='GNU/LINUX GAMING UNLEASHED!'
arch=('x86_64')
url='https://gitlab.com/Gnurur/chad_launcher'
license=('GPL3')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips)
makedepends=(cargo npm git squashfs-tools patchelf)
conflicts=(chad_launcher-bin)
source=('git+https://notabug.org/johncena141/chad_launcher.git#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    #replace Exec=chad_launcher with chad-launcher
    sed -i 's/Exec=chad_launcher/Exec=chad-launcher/g' "$srcdir/$_pkgname/chad_launcher.desktop"
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
    install -Dm644 ./chad_launcher.desktop "$pkgdir/usr/share/applications/chad-launcher.desktop"
    install -Dm644 ./icon.svg "$pkgdir/usr/share/pixmaps/chad-launcher.svg"
}

