# Maintainer: Josip Janzic <hi@josip.dev>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Scimmia

pkgbase=wayland-hi-res-scroll-git
pkgname=('wayland-hi-res-scroll-git' 'wayland-docs-hi-res-scroll-git')
pkgver=1.19.0.r3.gddf21af
pkgrel=1
pkgdesc='A computer display server protocol (git version). Patched with support for hi-res scroll event. https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/72'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'libffi' 'expat' 'libxml2')
makedepends=('git' 'meson' 'ninja' 'libxslt' 'doxygen' 'xmlto' 'graphviz' 'docbook-xsl')
source=('git+https://gitlab.freedesktop.org/wayland/wayland.git'
        '72.diff')
sha256sums=('SKIP'
        'SKIP')

pkgver() {
    git -C wayland describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    meson build wayland --buildtype='release' --prefix='/usr'
}


prepare() {
    cd wayland
    patch -Np1 -i ../72.diff
}


check() {
    ninja -C build test
}

package_wayland-hi-res-scroll-git() {
    provides=("wayland=${pkgver}")
    conflicts=('wayland')

    DESTDIR="$pkgdir" ninja -C build install
    mkdir -p docs/share
    mv "${pkgdir}/usr/share/"{doc,man} docs/share
    install -D -m644 wayland/COPYING "$p{kgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_wayland-docs-hi-res-scroll-git() {
    pkgdesc+=' (documentation)'
    arch=('any')
    depends=()
    provides=("wayland-docs=${pkgver}")
    conflicts=('wayland-docs')

    mv docs "${pkgdir}/usr"
    install -D -m644 wayland/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
