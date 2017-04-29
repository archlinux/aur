# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=jhbuild
pkgver=3.15.92+1134+g595267a9
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
_commit=595267a9
source=("$pkgname::git+https://git.gnome.org/browse/jhbuild#commit=$_commit"
        "module_args.patch")
sha256sums=('SKIP'
            '8146e4acf09541ffb307ca6cc57ef011d8ae42c1215d97d1a805f139d1097e25')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  msg2 "Set parameters known to be required in Arch Linux"
  patch -p1 -i "$srcdir/module_args.patch"
  
    # Set the proper filename for python2 binary
    # (see jhbuild commit id=ffd00eea72bfdfac02846a46559904bd8fa09d57)
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

# list of dependencies reported by 'jhbuild sysdeps'
depends+=(anthy argyllcms caribou cmake cups docbook-utils docbook-xsl dotconf doxygen espeak exempi git gmime gperf gtkspell3 hyphen intltool itstool kyotocabinet libatasmart libcanberra libdmapsharing libdvdread libgexiv2 libgphoto2 libhangul libical libmusicbrainz5 libndp liboauth libpwquality libraw libvirt libvpx mpc ninja openldap opus plymouth poppler-glib ppp python-cairo ragel ruby smbclient startup-notification taglib v4l-utils vala wavpack wget wireless_tools xf86-input-wacom xmlto xorg-server-xwayland xorg-util-macros xtrans)
