# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Scimmia

pkgbase=wayland-git
pkgname=(
    'wayland-git'
    'wayland-docs-git')
pkgver=1.24.91.r8.g25da99a
pkgrel=1
pkgdesc='A computer display server protocol (git version)'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=(
    'default-cursors'
    'expat'
    'glibc'
    'libffi'
    'libxml2')
makedepends=(
    'docbook-xsl'
    'doxygen'
    'git'
    'graphviz'
    'libxslt'
    'mdbook'
    'meson'
    'xmlto')
source=('git+https://gitlab.freedesktop.org/wayland/wayland.git')
sha256sums=('SKIP')

pkgver() {
    git -C wayland describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    arch-meson wayland build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package_wayland-git() {
    provides=(
        libwayland-{client,cursor,egl,server}.so
        "wayland=${pkgver}")
    conflicts=(
        'wayland')
    
    meson install -C build --destdir "$pkgdir"
    mkdir -p docs/share
    mv "${pkgdir}/usr/share/"{doc,man} docs/share
    install -D -m644 wayland/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
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
