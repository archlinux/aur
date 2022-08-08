pkgname=flatpak-lol
pkgver=1.12.7
pkgrel=1
epoch=1
pkgdesc="Modified flatpak that removes restriction on modify_ldt syscall, allowing it to run League of Legends with Wine-GE-LoL in Lutris or Bottles"
url="https://flatpak.org"
arch=(x86_64)
license=(LGPL)
depends=(dbus glib2 libsoup polkit libxau ostree json-glib libseccomp libarchive
         python bubblewrap appstream-glib xdg-dbus-proxy systemd)
makedepends=(intltool gobject-introspection gtk-doc git docbook-xsl xmlto)
checkdepends=(valgrind socat)
provides=(libflatpak.so flatpak)
conflicts=(flatpak)
_commit=9a6b71b62662f761046b868b798dcef9224739db  # tags/1.12.7^0
source=("git+https://github.com/flatpak/flatpak#commit=$_commit"
        git+https://gitlab.gnome.org/GNOME/libglnx.git
        git+https://github.com/projectatomic/bubblewrap
        git+https://github.com/flatpak/xdg-dbus-proxy
        git+https://gitlab.gnome.org/alexl/variant-schema-compiler.git
        https://dl.flathub.org/repo/flathub.flatpakrepo
        flatpak-bindir.sh
	modify-ldt.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '3371dd250e61d9e1633630073fefda153cd4426f72f4afa0c3373ae2e8fea03a'
            '1824cb4eb1cc88702cb2b9f1c55b6dfdf20fca5eab83f6e8e532099281328745'
            '16150ef04626d478456e764f575eeaf9f4d15794fd2e05a14a2621fe352fcf2d')

pkgver() {
  cd flatpak
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd flatpak

  git submodule init
  git submodule set-url libglnx "$srcdir/libglnx"
  git submodule set-url bubblewrap "$srcdir/bubblewrap"
  git submodule set-url dbus-proxy "$srcdir/xdg-dbus-proxy"
  git submodule set-url variant-schema-compiler "$srcdir/variant-schema-compiler"
  git submodule update

  NOCONFIGURE=1 ./autogen.sh

  patch -Np1 --input="$srcdir/modify-ldt.patch"
}

build() {
  cd flatpak

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --disable-static \
    --enable-gtk-doc \
    --with-system-bubblewrap \
    --with-system-dbus-proxy \
    --with-dbus-config-dir=/usr/share/dbus-1/system.d

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd flatpak
  make -k check
}

package() {
  depends+=(xdg-desktop-portal)

  make -C flatpak DESTDIR="$pkgdir" install

  install -Dt "$pkgdir/etc/profile.d" -m644 flatpak-bindir.sh
  install -Dt "$pkgdir/etc/flatpak/remotes.d" flathub.flatpakrepo

  # Fixup mode to match polkit
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}

