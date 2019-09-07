# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=jhbuild
pkgver=3.34.0
pkgrel=1
pkgdesc='Tool to build the whole GNOME desktop from sources'
arch=('any')
url='https://wiki.gnome.org/Projects/Jhbuild'
license=('GPL')
depends=(python2 git)
makedepends=(yelp-tools)
optdepends=('subversion: fetch subversion repositories'
            'cvs: fetch CVS repositories'
            'bzr: fetch Bazaar repositories'
            'mercurial: fetch Mercurial repositories'
            'darcs: fetch Darcs repositories')
_commit=b7665bca
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/jhbuild.git#commit=$_commit"
        "module_args.patch")
sha256sums=('SKIP'
            '570e199c0ac3e1aae5b39638f8f577d0c332133dbb6e099ab6b63c484cdad887')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  msg2 "Set parameters known to be required in Arch Linux"
  patch -p1 -i "$srcdir/module_args.patch"
  
    # Set the proper filename for python2 binary
    # see https://gitlab.gnome.org/GNOME/jhbuild/commit/ffd00eea
  sed -i jhbuild/modtypes/distutils.py \
      -e "/os.environ.get('PYTHON'/s/'python'/'python2'/"
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 examples/sample.jhbuildrc "$pkgdir/usr/share/jhbuild/examples/sample.jhbuildrc"
  install -Dm644 examples/wayland.jhbuildrc "$pkgdir/usr/share/jhbuild/examples/wayland.jhbuildrc"
  install -Dm644 contrib/jhbuild_completion.bash "$pkgdir/usr/share/bash-completion/completions/jhbuild"
  sed -i "s|$srcdir/$pkgname|$HOME/jhbuild|g" "$pkgdir"/usr/bin/jhbuild
}

# Here is a list of packages required by software built by JHBuild that
# can not be installed vi 'jhbuild sysdeps --install' for some reason
depends+=(

     # at AUR, required by 'jhbuild sysdeps'
    plymouth
    fwupdate

     # not found by 'jhbuild sysdeps'
    spice-protocol
    libmypaint
    gobject-introspection
    gtk-sharp-2

     # other reasons
    perl-sgmls # required by gnome-color-manager
    docbook-sgml # required by gnome-color-manager
    unicode-character-database # required by ibus
)
