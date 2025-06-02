# Maintainer: GhostNaN <GhostNaN@protonmail.com>
_gitname=mpvpaper
pkgname="$_gitname-git"
pkgver=r115.7342c53
pkgrel=1
pkgdesc="A video wallpaper program for wlroots based wayland compositors."
arch=('i686' 'x86_64')
url="https://github.com/GhostNaN/$_gitname"
license=('GPL3')
depends=('libmpv.so' 'libwayland-client.so' 'libwayland-egl.so')
makedepends=('git' 'meson' 'ninja' 'wayland-protocols')
optdepends=('socat: control via sockets')
provides=('mpvpaper')
source=("https://github.com/GhostNaN/$_gitname")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    # clean existing sources if any
    rm -rf "${srcdir}"/$_gitname
    # Clone manually to avoid downloading from the heavy "assets" branch
    git clone --single-branch https://github.com/GhostNaN/$_gitname.git
}

build() {
    cd "$srcdir/$_gitname"
    meson setup build --prefix=/usr
    ninja -C build
}

package() {
    cd "$srcdir/$_gitname"
    DESTDIR="$pkgdir" ninja -C build install
    install -D -m644 "mpvpaper.man" "$pkgdir/usr/share/man/man1/mpvpaper.1"
}
