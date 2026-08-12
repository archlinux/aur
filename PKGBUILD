# Maintainer: Robert Manner <rmanni@gmail.com>

# Split package: one recipe produces the library, the development files and the
# applications (matching how the upstream debian and alpine packaging is split).
# The dmenu/bemenu compatibility symlinks live in the separate
# widgie-menu-compat package.
pkgbase=widgie
pkgname=(widgie widgie-dev widgie-apps)
pkgver=0.3.8
pkgrel=2
pkgdesc="A lightweight widget library for applications which do not need a splashscreen."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/manner/widgie"
license=('GPL3')
makedepends=(wayland-protocols wayland libxkbcommon freetype2 libxkbcommon-x11 libxcb xcb-util-image xorgproto flint)
source=("https://gitlab.com/manner/widgie/-/archive/$pkgver/widgie-$pkgver.tar.gz")
options=('staticlibs')
sha256sums=('f662d2bdde9c3fdce8f2b71b6b059e28497fa2648ee2bcaa9a656d348bc0a0e3')

_builddir="widgie-$pkgver"

build() {
    cd "$_builddir"
    ./configure --prefix=/usr --enable-release
    make -j$(nproc)
    # stage a full install once; each package_*() copies its own subset below
    make DESTDIR="$srcdir/staging" install
}

check() {
    cd "$_builddir"
    make check
}

package_widgie() {
    pkgdesc="$pkgdesc (shared libraries)"
    depends=(wayland libxkbcommon freetype2 fontconfig libxkbcommon-x11 libxcb xcb-util-image)
    optdepends=("ttf-nerd-fonts-symbols: (or a nerd font) for icon support")
    conflicts=(widgie-git)
    install -d "$pkgdir/usr/lib"
    cp -a "$srcdir/staging/usr/lib/"*.so "$pkgdir/usr/lib/"
}

package_widgie-dev() {
    pkgdesc="Development files (headers, static library) for widgie."
    depends=(widgie)
    conflicts=(widgie-dev-git)
    install -d "$pkgdir/usr/lib" "$pkgdir/usr/include"
    cp -a "$srcdir/staging/usr/lib/"*.a "$pkgdir/usr/lib/"
    cp -a "$srcdir/staging/usr/include/widgie" "$pkgdir/usr/include/"
}

package_widgie-apps() {
    pkgdesc="Small applications written in widgie: widgie-menu, widgie-stopper, widgie-counter, widgie-calculator, pinentry-widgie."
    depends=(widgie flint)
    conflicts=(widgie-apps-git)
    install -d "$pkgdir/usr/bin"
    cp -a "$srcdir/staging/usr/bin/." "$pkgdir/usr/bin/"
}
