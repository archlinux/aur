# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=midori
pkgver=0.5.11
pkgrel=9
pkgdesc='Lightweight web browser'
arch=('x86_64')
url='https://midori-browser.org/'
license=('LGPL')
provides=('midori')
replaces=('midori-gtk3')
depends=('aria2' 'gcr' 'libxss' 'webkit2gtk' 'zeitgeist')
makedepends=('bzr' 'cmake' 'intltool' 'ninja' 'vala')
optdepends=('gst-plugins-base: HTML5 OGG videos support'
            'gst-plugins-good: HTML5 H264 and WebM videos support'
            'gst-libav: HTML5 H264 videos support')
options=('!emptydirs')
source=("https://midori-browser.org/wp-content/uploads/2018/08/${pkgname}_${pkgver}_all_.tar.bz2")
sha256sums=('96191a96be71144ae848a409fae5a1d6d52a00e583f33122081f47ead9c49c3d')

# NOTE: Set GTK_CSD=1 for enabling client side decorations when running Midori

prepare() {
  cd "$pkgname-$pkgver"

  msg2 'Fixing issues in the Vala sources...'
  sed 's/protected Tally/public Tally/g' -i midori/midori-notebook.vala
  sed 's/%d other files/%u other files/g' -i extensions/transfers.vala
  for f in transfers adblock/widgets apps history-list notes; do
    sed 's,.remove (iter,.remove (ref iter,g' -i "extensions/$f.vala"
  done

  msg2 'Fixing constants that were deprecated in Gtk 3.10...'
  # https://lazka.github.io/pgi-docs/Gtk-3.0/constants.html
  find . -type f -regex '.*\.\(c\|vala\)' -exec sed -i \
    's/Gtk.STOCK_FILE/"text-x-generic"/g;s/Gtk.STOCK_CLOSE/"window-close"/g;s/Gtk.STOCK_ADD/"list-add"/g;s/Gtk.STOCK_HELP/"help-browser"/g;s/Gtk.STOCK_APPLY/""/g;s/Gtk.STOCK_CANCEL/""/g;s/Gtk.STOCK_COPY/"edit-copy"/g;s/Gtk.STOCK_DELETE/"edit-delete"/g;s/Gtk.STOCK_EDIT/""/g;s/Gtk.STOCK_OPEN/"document-open"/g;s/Gtk.STOCK_PREFERENCES/"preferences-system"/g;s/Gtk.STOCK_PROPERTIES/"document-properties"/g;s/Gtk.STOCK_SAVE/"document-save"/g;s/Gtk.STOCK_CLEAR/"edit-clear"/g;s/Gtk.STOCK_DIRECTORY/"folder"/g' \
    "{}" +;
  # https://i-hate-farms.github.io/parrot/gio-2.0/GLib.g_dbus_generate_guid.html
  find . -type f -regex '.*\.\(c\|vala\)' -exec sed -i \
    's/g_dbus_generate_guid/GLib.DBus.generate_guid/g' "{}" +;
}

build() {
  mkdir -p build
  cd build

  # CMake + Vala are not swayed by VALAFLAGS to build with PIC. Need to find a different method.
  #-DVALAFLAGS="$(for f in $(echo $CFLAGS $CXXFLAGS $LDFLAGS | tr ' ' '\n'); do echo -X "\"$f\""; done | xargs echo)" \
  #-DVALAFLAGS="-X -fPIC" \

  cmake "../$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DHALF_BRO_INCOM_WEBKIT2=ON \
    -DCMAKE_C_FLAGS="$CFLAGS -w" \
    -DVALA_CFLAGS="$CFLAGS -w" \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# getver: launchpad.net/midori/+download
# vim: ts=2 sw=2 et:
