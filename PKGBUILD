# Maintainer: guangxifolk

pkgbase=wayland-asan-git
pkgname=('wayland-asan-git')
pkgver=1.22.0.r54.g47de872
pkgrel=1
pkgdesc='A computer display server protocol (git version, with address sanitizer)'
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
    meson build wayland --buildtype='debug' --prefix='/usr' -Db_sanitize='address'
}

check() {
    ASAN_OPTIONS='detect_odr_violation=0' ninja -C build test
}

package_wayland-asan-git() {
    provides=(
        "wayland=${pkgver}"
        "libwayland-client.so=0-64"
        "libwayland-cursor.so=0-64"
        "libwayland-egl.so=1-64"
        "libwayland-server.so=0-64"
    )
    conflicts=('wayland')
    
    DESTDIR="$pkgdir" ninja -C build install
    mkdir -p docs/share
    mv "${pkgdir}/usr/share/"{doc,man} docs/share
    install -D -m644 wayland/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
