# Maintainer: Robert Manner <rmanni@gmail.com>

# Split package: one recipe produces the library, the development files and the
# applications (matching how the upstream debian and alpine packaging is split).
# The dmenu/bemenu compatibility symlinks live in the separate
# widgie-menu-compat package.
pkgbase=widgie-git
pkgname=(widgie-git widgie-dev-git widgie-apps-git)
pkgver=0.3.8
pkgrel=1
pkgdesc="A lightweight widget library for applications which do not need a splashscreen."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/manner/widgie"
license=('GPL3')
makedepends=(git wayland-protocols wayland libxkbcommon freetype2 libxkbcommon-x11 libxcb xcb-util-image xorgproto flint)
source=("git+https://gitlab.com/manner/widgie")
sha256sums=(SKIP)
options=('staticlibs')

_builddir="widgie"

pkgver() {
    cd "$_builddir"
    git describe --tags | sed -e 's,-,.,g'
}

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

package_widgie-git() {
    pkgdesc="$pkgdesc (shared libraries)"
    depends=(wayland libxkbcommon freetype2 fontconfig libxkbcommon-x11 libxcb xcb-util-image)
    optdepends=("ttf-nerd-fonts-symbols: (or a nerd font) for icon support")
    provides=(widgie)
    conflicts=(widgie)
    install -d "$pkgdir/usr/lib"
    cp -a "$srcdir/staging/usr/lib/"*.so "$pkgdir/usr/lib/"
}

package_widgie-dev-git() {
    pkgdesc="Development files (headers, static library) for widgie."
    depends=(widgie-git)
    provides=(widgie-dev)
    conflicts=(widgie-dev)
    install -d "$pkgdir/usr/lib" "$pkgdir/usr/include"
    cp -a "$srcdir/staging/usr/lib/"*.a "$pkgdir/usr/lib/"
    cp -a "$srcdir/staging/usr/include/widgie" "$pkgdir/usr/include/"
}

package_widgie-apps-git() {
    pkgdesc="Small applications written in widgie: widgie-menu, widgie-stopper, widgie-counter, widgie-calculator, pinentry-widgie."
    depends=(widgie-git flint)
    provides=(widgie-apps)
    conflicts=(widgie-apps)
    install -d "$pkgdir/usr/bin"
    cp -a "$srcdir/staging/usr/bin/." "$pkgdir/usr/bin/"
}
