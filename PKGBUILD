pkgname='rum-git'
_pkgname=${pkgname%-git}
pkgver=r327.d9da55f
pkgrel=2
pkgdesc='Game library management - master branch'
arch=('x86_64')
url='https://johncena141.eu.org:8141/johncena141/rum'
license=('GPL3')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips udev)
makedepends=(cargo pnpm git squashfs-tools patchelf)
provides=('rum')
conflicts=('rum')
replaces=('chad-launcher-git')
source=("git+https://johncena141.eu.org:8141/johncena141/${_pkgname}.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    pnpm install
    pnpm run build
    pnpm run tauri build
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "src-tauri/target/release/rum"
    install -Dm644 ./rum.desktop "$pkgdir/usr/share/applications/rum.desktop"
    install -Dm644 ./icon.svg "$pkgdir/usr/share/pixmaps/rum.svg"
}

