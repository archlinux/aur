# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=jhbuild
pkgver=3.15.92
pkgrel=3
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
        'update-jhbuild-cfgs.sh')
sha256sums=('c1be78139ee9d566a042a7b4c1d61ad435bc70b75d3f1b84de0a1038fc59cab6'
            'd80a964961ed212581cac0d4fb93a8e3384baff48d8796cf373f964133e014b9')

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
      # create dummy files for package controlling, further they will be replaced
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
