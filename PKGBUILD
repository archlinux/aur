# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=jhbuild
pkgver=3.15.92
pkgrel=2
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
        'module_autogenargs.patch'
        'update-jhbuild-cfgs.sh')
sha256sums=('c1be78139ee9d566a042a7b4c1d61ad435bc70b75d3f1b84de0a1038fc59cab6'
            '273d53cb976642692eb9ed8536a02b0fe677c47662bbef8b50d1a8bcb292665f'
            '0fc1dfe50076b266157d033efd971b2eb4871a3c1abc5d180afa4c353ca427ea')

prepare() {
    cd $pkgname-$pkgver
    patch -p1 -i "$srcdir"/module_autogenargs.patch
}

build() {
    cd $pkgname-$pkgver
    ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
    cp -dr modulesets "$pkgdir/usr/share/jhbuild"
    sed -i "s|$srcdir|$HOME/jhbuild|g" "${pkgdir}"/usr/bin/jhbuild
    
    install -m755 "$srcdir"/update-jhbuild-cfgs.sh "$pkgdir"/usr/bin/update-jhbuild-cfgs
      # create dummy files for package controlling
    touch "$pkgdir/usr/share/jhbuild/modulesets"/gnome-apps-3.18.modules
    touch "$pkgdir/usr/share/jhbuild/modulesets"/gnome-suites-core-3.18.modules
    touch "$pkgdir/usr/share/jhbuild/modulesets"/gnome-suites-core-deps-3.18.modules
    touch "$pkgdir/usr/share/jhbuild/modulesets"/gnome-sysdeps-3.18.modules
    touch "$pkgdir/usr/share/jhbuild/modulesets"/gnome-apps-3.20.modules
    touch "$pkgdir/usr/share/jhbuild/modulesets"/gnome-suites-core-3.20.modules
    touch "$pkgdir/usr/share/jhbuild/modulesets"/gnome-suites-core-deps-3.20.modules
    touch "$pkgdir/usr/share/jhbuild/modulesets"/gnome-sysdeps-3.20.modules
    touch "$pkgdir/usr/share/jhbuild/modulesets"/gnome-apps-3.22.modules
    touch "$pkgdir/usr/share/jhbuild/modulesets"/gnome-suites-core-3.22.modules
    touch "$pkgdir/usr/share/jhbuild/modulesets"/gnome-suites-core-deps-3.22.modules
    touch "$pkgdir/usr/share/jhbuild/modulesets"/gnome-sysdeps-3.22.modules

}
