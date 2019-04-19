# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Scimmia

pkgbase=wayland-git
pkgname=('wayland-git' 'wayland-docs-git')
pkgver=1.17.0.r6.gb77cf86
pkgrel=1
pkgdesc='A computer display server protocol'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'libffi' 'expat' 'libxml2')
makedepends=('git' 'libxslt' 'doxygen' 'xmlto' 'graphviz' 'docbook-xsl')
source=('git+https://gitlab.freedesktop.org/wayland/wayland.git')
sha256sums=('SKIP')

prepare() {
    mkdir -p docs/share
}

pkgver() {
    cd wayland
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd wayland
    
    ./autogen.sh \
        --prefix='/usr' \
        --disable-static
        
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    
    make
}

check() {
    cd wayland
    
    make check
}

package_wayland-git() {
    provides=("wayland=${pkgver}")
    conflicts=('wayland')
    
    cd wayland
    
    make DESTDIR="$pkgdir" install
    
    mv "$pkgdir"/usr/share/{doc,man} "${srcdir}/docs/share"
    
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_wayland-docs-git() {
    pkgdesc+=' (documentation)'
    arch=('any')
    depends=()
    provides=("wayland-docs=${pkgver}")
    conflicts=('wayland-docs')
    
    cd wayland
    
    mv "${srcdir}/docs" "${pkgdir}/usr"
    
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
