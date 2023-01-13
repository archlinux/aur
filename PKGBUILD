# Maintainer: poly000 <1348292515@qq.com>
pkgname=yas-scanner
_pkgname=yas
pkgver=0.1.11.afcfa6a
pkgrel=5
pkgdesc="fast Artifact scanner for a specific anime game"
url="https://github.com/poly000/yas/tree/linux-x11-support"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')

license=('custom')
depends=('xorg-xwininfo' 'xdotool' 'libx11' 'libxrandr' 'libxcb' 'dbus')
makedepends=('cargo' 'git' 'git-lfs')
optdepends=('xdg-desktop-portal: screenshot on wayland compositors other than GNOME')

prepare() {
    cd "$srcdir"
    [ -d "yas" ] || git clone --depth 1 --branch linux-x11-support https://github.com/poly000/yas
    cd yas && git pull
}

pkgver() {
    cd "$srcdir/$_pkgname"
    echo 0.1.11.$(git describe --always)
}

build() {
    cd "$srcdir/$_pkgname"

    if [[ $CARCH != x86_64 ]]; then
        export CARGO_PROFILE_RELEASE_LTO=off
    fi

    cargo build --locked --release --target-dir target
}

package() {
   cd "$srcdir/$_pkgname"
   install -Dm755 target/release/yas ${pkgdir}/usr/bin/yas-scanner
}
