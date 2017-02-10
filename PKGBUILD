# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=jhbuild
pkgver=3.15.92+1012+g88207c11
pkgrel=1
pkgdesc='Tool to build the whole GNOME desktop from sources'
arch=('any')
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
_commit=88207c11
source=("$pkgname-$_commit::git+https://git.gnome.org/browse/jhbuild#commit=$_commit"
        "module_autogenargs.patch")
sha256sums=('SKIP'
            '273d53cb976642692eb9ed8536a02b0fe677c47662bbef8b50d1a8bcb292665f')

pkgver() {
  cd $pkgname-$_commit
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname-$_commit
  msg2 "Set parameters known to be required for Arch Linux"
  patch -p1 -i "$srcdir/module_autogenargs.patch"
}

build() {
  cd $pkgname-$_commit
  ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2
  make
}

package() {
  cd $pkgname-$_commit
  make DESTDIR="$pkgdir" install
  install -Dm644 examples/sample.jhbuildrc "$pkgdir/usr/share/jhbuild/examples/sample.jhbuildrc"
  install -Dm644 examples/wayland.jhbuildrc "$pkgdir/usr/share/jhbuild/examples/wayland.jhbuildrc"
  install -Dm644 contrib/jhbuild_completion.bash "$pkgdir/usr/share/bash-completion/completions/jhbuild"
  sed -i "s|$srcdir|$HOME/jhbuild|g" "${pkgdir}"/usr/bin/jhbuild
}
