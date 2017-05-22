# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0

pkgname=nemo-git
pkgver=3.4.1.r35.gd8f6d611
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
    'python')
makedepends=('git'
    'gnome-common'
    'gobject-introspection'
    'gtk-doc'
    'intltool'
    'python-gobject'
    'python2-gobject'
    'python-polib')
optdepends=('ffmpegthumbnailer: support for video thumbnails')
conflicts=('nemo')
provides=('nemo')
options=('!emptydirs')
source=("git+https://github.com/linuxmint/nemo#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd nemo
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/nemo

  # Rename 'Files' app name to avoid having the same as nautilus
  sed -i 's/^Name\(.*\)=.*/Name\1=Nemo/' data/nemo.desktop.in.in
}

build() {
  cd $srcdir/nemo

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/nemo \
      --disable-update-mimedb \
      --disable-tracker \
      --disable-gtk-doc-html \
      --disable-schemas-compile \
      --enable-selinux=no

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $srcdir/nemo
  make DESTDIR="$pkgdir" install
  
  # Remove D-Bus activation file to avoid conflict with nautilus-desktop
  rm "$pkgdir/usr/share/dbus-1/services/org.nemo.freedesktop.FileManager1.service"
}
