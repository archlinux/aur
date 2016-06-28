# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=jhbuild
pkgver=3.15.92
pkgrel=4
pkgdesc='Tool to build the whole GNOME desktop from sources'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Projects/Jhbuild'
license=('GPL')
depends=(python2 git)
makedepends=(gnome-common intltool yelp-tools)
optdepends=('subversion: fetch subversion repositories'
            'cvs: fetch CVS repositories'
            'bzr: fetch Bazaar repositories'
            'mercurial: fetch Mercurial repositories'
            'darcs: fetch Darcs repositories')
install=jhbuild.install
source=("https://git.gnome.org/browse/jhbuild/snapshot/jhbuild-$pkgver.tar.xz"
        "update-default-jhbuildrc-000f820.patch" "module_autogenargs.patch")
sha256sums=('c1be78139ee9d566a042a7b4c1d61ad435bc70b75d3f1b84de0a1038fc59cab6'
            'b39be32d3f16f58fc7da2e468cb75ad3e9abc59adbc1c26143ec11449f839c38'
            '273d53cb976642692eb9ed8536a02b0fe677c47662bbef8b50d1a8bcb292665f')

prepare() {
    cd $pkgname-$pkgver
    msg2 "Update to gnome-3.22 moduleset and other options" 
    patch -p1 -i "$srcdir/update-default-jhbuildrc-000f820.patch"
    msg2 "Set parameters known to be required for Arch Linux"
    patch -p1 -i "$srcdir/module_autogenargs.patch"
}

build() {
    cd $pkgname-$pkgver
    ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
    install -Dm644 examples/sample.jhbuildrc "$pkgdir/usr/share/jhbuild/examples/sample.jhbuildrc"
    install -Dm644 examples/wayland.jhbuildrc "$pkgdir/usr/share/jhbuild/examples/wayland.jhbuildrc"
    sed -i "s|$srcdir|$HOME/jhbuild|g" "${pkgdir}"/usr/bin/jhbuild
}
