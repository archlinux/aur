# Maintainer: talone <talone@boxph.one>
 
pkgname="authenticator"
pkgver=3.32.2
pkgrel=6
pkgdesc="2FA code generator for GNOME"
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=("GPL3")
depends=('python' 'gtk3' 'pyzbar' 'python-pyotp' 'python-pillow' 'appstream-glib' 'python-beautifulsoup4' 'python-yoyo-migrations' 'python-requests' 'libhandy0' 'python-pyfavicon' 'python-sqlparse')
makedepends=('meson' 'ninja' 'gobject-introspection' 'git')
source=("$pkgname::git+https://gitlab.gnome.org/World/Authenticator.git?unsigned#tag=${pkgver}"
        'git+https://gitlab.gnome.org/GNOME/libgd.git'
        'remove_references.patch')
sha256sums=('SKIP' 'SKIP' '7fe9740a0418214a6f4447ace5107b4f57f862f0b2dabf1fc518585a9d85a379')

prepare() {
    cp remove_references.patch $pkgname/
    cd $pkgname
    git apply remove_references.patch
    git submodule init
    git config --local submodule.subprojects/libgd.url "$srcdir/libgd"
    git submodule update
}

build() {
    arch-meson $pkgname build
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
