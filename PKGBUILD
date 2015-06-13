# Maintainer: SanskritFritz (gmail)
# Contributor: György Balló <ballogy@freestart.hu>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Jonathan Liu <net147@hotmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=awn-extras-applets
_pkgname=awn-extras
pkgver=0.4.0
pkgrel=16
pkgdesc='Collection of applets for avant-window-navigator'
arch=('i686' 'x86_64')
url='https://launchpad.net/awn-extras'
license=('GPL')
depends=('avant-window-navigator' 'python2-notify' 'vte' 'gnome-menus' 'gnome-menus2' 'webkitgtk2')
makedepends=('intltool' 'vala')
optdepends=('python2-feedparser: comics, feeds, mail applets'
            'python2-rsvg: comics, cairo-clock, hardware-sensors applets'
            'gstreamer0.10-python: media-player, volume-control applets'
            'python2-dateutil: cairo-clock (optional), calendar applets'
            'python2-gdata: calendar applet'
            'python2-vobject: calendar applet'
            'python2-pyinotify: thinkhdaps applet (optional)'
            'python2-libgnome: stacks applet'
            'python2-gnomedesktop: stacks applet'
            'python2-wnck: slickswitcher applet'
            'fortune-mod: animal-farm applet'
            'upower: battery applet'
            'gnome-applets: cpufreq applet'
            'hddtemp: hardware-sensors applet (optional)'
            'lm_sensors: hardware-sensors applet (optional)')
options=('!libtool')
install=$pkgname.install
source=(http://launchpad.net/$_pkgname/0.4/$pkgver/+download/$_pkgname-$pkgver.tar.gz
        awn-extras-libnotify0.7.patch
        remove-settings-menu.patch
        add-battery-upower-support.patch
        fix-shinyswitcher-scrolling.patch
        fix-weather-applet.patch
        awn-extras-glib2.32.patch
        cairo-menu-upower.patch
        check-dependencies.patch)
md5sums=('b559d68cd6ad295c961c20fcc5d9f9c0'
         '2df8dfd8f0f1d458c09b56983c7d049f'
         '52f8ce6a4eca862b0740e29a84db8ae5'
         '26b56106b63b14ba3c99f1a2e96da05d'
         '755c57dfbb65a314f247277918ec95ac'
         'bc22bb3e81aca0f651ae8acee1ce2f00'
         '1cfcd1e5dc92c4c7c306472d42a21c2d'
         'f9715f531947967d6549a358ea8d2979'
         '8f920c7dde987d66eef7d3739df1051d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -i "$srcdir/awn-extras-libnotify0.7.patch"
  patch -Np1 -i "$srcdir/remove-settings-menu.patch"
  patch -Np0 -i "$srcdir/add-battery-upower-support.patch"
  patch -Np0 -i "$srcdir/fix-shinyswitcher-scrolling.patch"
  patch -Np1 -i "$srcdir/fix-weather-applet.patch"
  patch -Np0 -i "$srcdir/awn-extras-glib2.32.patch"
  patch -Np1 -i "$srcdir/cairo-menu-upower.patch"
  patch -Np1 -i "$srcdir/check-dependencies.patch"

  # Python2 fix
  find . -type f -name *.py | xargs sed -i 's@^#.*python$@#!/usr/bin/python2@'
  sed -i 's/async(\"python \"/async(\"python2 \"/' applets/maintained/shiny-switcher/shinyswitcherapplet.c

  ./configure --prefix=/usr --sysconfdir=/etc \
              --disable-static \
              --disable-pymod-checks \
              --with-webkit \
              PYTHON=/usr/bin/python2
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/awn-extras.schemas" "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -r "$pkgdir"/etc

  # Remove bandwidth-monitor applet, because it's not compatible with latest netstat
  rm -R "$pkgdir"/usr/share/avant-window-navigator/applets/bandwidth-monitor*

  # Remove pandora applet, because gtkmozembed is not available
  rm -R "$pkgdir"/usr/share/avant-window-navigator/applets/pandora*
}

# vim:set ts=2 sw=2 et:
