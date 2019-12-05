# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=jhbuild
pkgver=3.35.2+23+g75b39363
pkgrel=2
pkgdesc='Tool to build the whole GNOME desktop from sources'
arch=('any')
url='https://wiki.gnome.org/Projects/Jhbuild'
license=('GPL')
depends=(python git)
makedepends=(yelp-tools)
optdepends=('subversion: fetch subversion repositories'
            'cvs: fetch CVS repositories'
            'bzr: fetch Bazaar repositories'
            'mercurial: fetch Mercurial repositories'
            'darcs: fetch Darcs repositories')
_commit=75b39363
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/jhbuild.git#commit=$_commit"
        "module_args.patch")
sha256sums=('SKIP'
            '75f1d28a3b52f7889476f17c985a3c82d07c488283f591448dac6732be3db693')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  msg2 "Set parameters known to be required in Arch Linux"
  patch -p1 -i "$srcdir/module_args.patch"
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr
  make
}

check() {
  cd $pkgname
  make -k check || true
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 examples/sample.jhbuildrc "$pkgdir/usr/share/jhbuild/examples/sample.jhbuildrc"
  install -Dm644 examples/wayland.jhbuildrc "$pkgdir/usr/share/jhbuild/examples/wayland.jhbuildrc"
  install -Dm644 contrib/jhbuild_completion.bash "$pkgdir/usr/share/bash-completion/completions/jhbuild"
  sed -i "s|$srcdir/$pkgname|$HOME/jhbuild|g" "$pkgdir"/usr/bin/jhbuild

  # https://gitlab.gnome.org/GNOME/jhbuild/issues/51
  rm "$pkgdir/usr/bin/python2"
}

# 'jhbuild sysdeps --install' should install all extra dependencies,
# here is a list of packages that fail to install for some reason,
# as detailed below
depends+=(

     # at AUR, required by 'jhbuild sysdeps'
    plymouth
    fwupdate

     # from official repositories, but not found by 'jhbuild sysdeps'
    spice-protocol
    libmypaint
    gobject-introspection
    gtk-sharp-2

     # other reasons
    perl-sgmls # required by gnome-color-manager
    docbook-sgml # required by gnome-color-manager
    unicode-character-database # required by ibus
)
