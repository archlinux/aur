# Maintainer: GhettoGirl <github.com/GhettoGirl>

# Borderless/Frameless Eye of GNOME
# Don't get annoyed by unnecessary UI elements!
# The window decoration needs to be disabled in your wm ;)

# PKGBUILD based on abs/extra/eog

# NOTE 1
# v3.14.4 is the latest version which has the ability to turn of menu bars.
# Later versions needs source code patching because of the GTK header bar.

# NOTE 2
# Run 'eog.bin' from terminal to access the menu to configure Eye of GNOME
# The plugin can be used for other GTK3 apps too if you want.

_pkgname=eog
_pkgver=3.14.4 # if you need another version, just modify this string
pkgname=$_pkgname-frameless
pkgver=3.14.4.6277.gc5db74d
pkgrel=1
pkgdesc="Eye of Gnome: An image viewing and cataloging program (frameless variant)"
url="https://wiki.gnome.org/Apps/EyeOfGnome"
arch=(i686 x86_64)
license=(GPL)
depends=(gnome-desktop libexif lcms2 exempi libpeas librsvg dconf)
makedepends=(intltool itstool gobject-introspection gtk-doc)
provides=("eog=$_pkgver")
conflicts=("eog" "eog-git")
groups=(gnome)
options=(!emptydirs)
source=("git+https://github.com/GNOME/eog.git"
        "eog.sh"
        "disable-menubar.c")
sha256sums=('SKIP'
            'fea96443a8c2bae34f49e25f15f88bdc0b7bdeb334b87d702c02594b8c2fc0b8'
            '94f0ae8e9fc8d3fd8699c419479541f955d0ff8343ba1bbd3f39fdacb91dc6d3')

pkgver() {
  cd "$_pkgname"
  echo $(git describe --tags | sed 's/-/\./g').$(git rev-list HEAD --count).g$(git rev-parse --short HEAD)
}

prepare() {
  cd "$_pkgname"
  git checkout "$_pkgver"
}

build() {
  # build eye of gnome
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --enable-compile-warnings=minimum --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j$(nproc)

  # build gtk menu bar disabler plugin
  cd ..
  gcc -shared -fPIC `pkg-config gtk+-x11-3.0 --cflags --libs` -o libnowinmenu.so disable-menubar.c
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install

  # install gtk menu bar disabler plugin
  install -Dm644 -T "$srcdir/libnowinmenu.so" "$pkgdir/usr/lib/gtk-3.0/modules/libnowinmenu.so"

  # install eog wrapper to use the menu bar disabler plugin
  # enabling that globally isn't a good idea ;)
  mv "$pkgdir/usr/bin/eog" "$pkgdir/usr/bin/eog.bin"
  install -Dm755 -T "$srcdir/eog.sh" "$pkgdir/usr/bin/eog"
}
