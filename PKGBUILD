# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=jhbuild
pkgver=3.15.92+1268+gf8a3fb2a
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
_commit=f8a3fb2a
source=("$pkgname::git+https://git.gnome.org/browse/jhbuild#commit=$_commit"
        "module_args.patch")
sha256sums=('SKIP'
            'f2c25fd732971383f13559a3ed646b91d561f4eb10de91551f3eea15090c49e2')

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
depends+=(anthy argyllcms caribou check cmake cups docbook-sgml docbook-utils docbook-xsl dotconf doxygen espeak exempi git gmime gperf gtkspell3 hyphen intltool itstool kyotocabinet libatasmart libcanberra libdmapsharing libdvdread libgexiv2 libgphoto2 libhangul libical libmusicbrainz5 libndp liboauth libpwquality libraw libunwind libvirt libvpx mpc ninja openldap opus plymouth poppler-glib ppp python-cairo ragel ruby smbclient startup-notification taglib udisks2 v4l-utils vala wavpack wget wireless_tools xf86-input-wacom xmlto xorg-server-xwayland xorg-util-macros xtrans)
