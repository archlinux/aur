# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0

pkgname=nemo-git
pkgver=3.0.5.r4.g8d897c6
pkgrel=1
pkgdesc="Cinnamon file manager, git-version"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo"
_branch='master'
license=('GPL')
depends=('cinnamon-desktop'
	'cinnamon-translations'
	'dconf'
	'desktop-file-utils'
	'exempi'
	'gvfs'
	'libexif'
	'libnotify'
	'libxml2'
	'python2')
makedepends=('git'
	'gnome-common'
	'gobject-introspection'
	'gtk-doc'
	'intltool'
	'python2-gobject'
	'python2-polib')
conflicts=('nemo')
provides=('nemo')
options=('!emptydirs')
install=nemo.install
source=("git+https://github.com/linuxmint/nemo#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd nemo
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/nemo

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

build() {
  cd $srcdir/nemo

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/nemo \
      --disable-update-mimedb \
      --disable-tracker \
      --disable-gtk-doc-html \
      --disable-schemas-compile

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $srcdir/nemo

  make DESTDIR="$pkgdir" install
}
