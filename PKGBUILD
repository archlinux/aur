# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Scimmia

pkgbase=wayland-git
pkgname=('wayland-git' 'wayland-docs-git')
pkgver=1.18.0.r18.gef611a80
pkgrel=1
pkgdesc='A computer display server protocol (git version)'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'libffi' 'expat' 'libxml2')
makedepends=('git' 'meson' 'ninja' 'libxslt' 'doxygen' 'xmlto' 'graphviz' 'docbook-xsl')
source=('git+https://gitlab.freedesktop.org/wayland/wayland.git')
sha256sums=('SKIP')

pkgver() {
    git -C wayland describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    meson build wayland --buildtype='release' --prefix='/usr'
}

check() {
    ninja -C build test
}

package_wayland-git() {
    provides=("wayland=${pkgver}")
    conflicts=('wayland')
    
    DESTDIR="$pkgdir" ninja -C build install
    mkdir -p docs/share
    mv "${pkgdir}/usr/share/"{doc,man} docs/share
    install -D -m644 wayland/COPYING "$p{kgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_wayland-docs-git() {
    pkgdesc+=' (documentation)'
    arch=('any')
    depends=()
    provides=("wayland-docs=${pkgver}")
    conflicts=('wayland-docs')
    
    mv docs "${pkgdir}/usr"
    install -D -m644 wayland/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
