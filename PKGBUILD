pkgname=flatpak-git
pkgver=0.6.2.r1.gcb41e1b
pkgrel=1
pkgdesc="Application deployment framework for desktop apps"
url="http://flatpak.org"
arch=(i686 x86_64)
license=(GPL)
depends=(dbus systemd glib2 libsoup polkit xorg-xauth libgsystem ostree fuse
         json-glib libseccomp libarchive libelf libcap)
makedepends=(intltool python libxslt gobject-introspection gtk-doc git)
source=("flatpak-git::git+https://github.com/flatpak/flatpak"
        "git+https://git.gnome.org/browse/libglnx"
        "git+https://github.com/projectatomic/bubblewrap")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

provides=(flatpak)
conflicts=(flatpak)

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname

  git submodule init
  git config --local submodule.libglnx.url "$srcdir/libglnx"
  git config --local submodule.bubblewrap.url "$srcdir/bubblewrap"
  git submodule update

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --sbindir=/usr/bin --libexecdir=/usr/lib --disable-static \
    --enable-gtk-doc --with-priv-mode=setuid

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $pkgname
  make -k check
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install

  # Fixup mode to match polkit
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
