# Maintainer: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=gtk+2.0, repo=wily
# vercheck-archlinux: name=gtk2, repo=extra, arch=x86_64
# vercheck-gnome: name=gtk+, majorver=2.24

pkgname=gtk2-ubuntu
_ubuntu_rel=1ubuntu1
pkgver=2.24.29
pkgrel=1
pkgdesc="GTK+ is a multi-platform toolkit (v2)"
arch=(i686 x86_64)
url="http://www.gtk.org/"
license=(LGPL)
depends=(atk pango libxcursor libxinerama libxrandr libxi libxcomposite
         libxdamage shared-mime-info cairo libcups gtk-update-icon-cache
         python2)
makedepends=(pkg-config gobject-introspection gtk-doc)
provides=("gtk2=${pkgver}")
conflicts=(gtk2)
replaces=(gtk2-docs)
backup=(etc/gtk-2.0/gtkrc)
install=gtk2.install
source=("http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${pkgver}.tar.xz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/gtk+2.0_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz"
        gtkrc
        xid-collision-debug.patch)
sha512sums=('3cdc868b74831c35b9181edfe29fc7743118b5db6b4e742cc684cf5b7d8e87686f53c4460ee14dee635c25cfd1fd7aefb5cc472d022f0f77d83b6d3a881eff26'
            '9cc52c0bdbeca0580196e677cd9fe8e632ea3f1a05e12420fa59cd726f3f8705f6d5cb072f4d3d42bde97045efda77d2e7a76eac95a93531d6de830dd3322908'
            'fb18f1937b117f97da1650fda2561e231cb5da108a9c04f3b27c19205843ea16402b52d9693eca63a8464bdfb1e6a0aedf81958ee3de75ce12aca4cce078bf23'
            '89e3223c86731a76b12d39245f1ec4cf8b4860ab1d11d74a10e5deb0db302f20b4bb5d9034da1d8aeb96369dbdeddcdd2f28943270dc501476c694562b960159')
prepare() {
  cd "gtk+-${pkgver}"

  patch -p1 -i ../xid-collision-debug.patch

  # Apply Ubuntu patches
    # Enable patches
      # Implement gtk-shell-shows-menubar from gtk3
        echo 'gtk-shell-shows-menubar.patch' > ../debian/patches/series
      # liboverlay-scrollbar.so: undefined symbol: ubuntu_gtk_set_use_overlay_scrollbar
        echo '100_overlay_scrollbar_loading.patch' >> ../debian/patches/series
      # Allow printing to printers advertised using Avahi/Bonjour when CUPS 1.6
        echo 'print-dialog-show-options-of-remote-dnssd-printers.patch' >> ../debian/patches/series
      # Make GTK 2 applications behave more like GTK 3 applications where the
      # windows can be dragged via the menubar.
        echo '062_dnd_menubar.patch' >> ../debian/patches/series
      # Make sure than an offscreen window does not grab the mouse pointer.
        echo '071_no_offscreen_widgets_grabbing.patch' >> ../debian/patches/series
      # Fix bug where the last menu item in a scrollable menu cannot be selected
        echo '095_git_menus_scrolling.patch' >> ../debian/patches/series
      # Fix bug for printers that don't print at 300 DPI
        echo '096_git_gtkprintsettings.patch' >> ../debian/patches/series
      # The list of printers should be searchable/sortable
        echo 'backport_search_printer_location.patch' >> ../debian/patches/series
      # Allow window dragging from empty areas of the menubar
        echo 'menubar_toolbar_dragging.patch' >> ../debian/patches/series

  for i in $(grep -v '#' ../debian/patches/series); do
    msg "Applying ${i}"
    patch -p1 -i "../debian/patches/${i}"
  done
}

build() {
  cd "gtk+-${pkgver}"

  autoreconf -vfi

  CXX=/bin/false ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-xinput=yes \
    --enable-test-print-backend

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "gtk+-${pkgver}"
  make DESTDIR="${pkgdir}" install

  sed -i "s#env python#env python2#" "${pkgdir}/usr/bin/gtk-builder-convert"

  install -Dm644 "${srcdir}/gtkrc" "${pkgdir}/usr/share/gtk-2.0/gtkrc"

  # Use the official gtk-update-icon-cache package
  rm -v "${pkgdir}/usr/bin/gtk-update-icon-cache"
}
