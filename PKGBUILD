# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: SanskritFritz (gmail)
# Contributor: György Balló <ballogy@freestart.hu>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Jonathan Liu <net147@hotmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_pkgname=awn-extras
pkgname=${_pkgname}-applets-git
pkgver=0.4.1.r3544
pkgrel=1
pkgdesc='Applets for avant-window-navigator (git version)'
arch=('i686' 'x86_64')
url='https://launchpad.net/awn-extras'
license=('GPL')
depends=('avant-window-navigator-git' 'python2-notify' 'vte' 'gnome-menus' 'gnome-menus2')
makedepends=('intltool' 'vala' 'git')
optdepends=('python2-feedparser: comics, feeds, mail applets'
            'python2-rsvg: comics, cairo-clock, hardware-sensors applets'
            'python2-dateutil: cairo-clock (optional), calendar applets'
            'python2-vobject: calendar applet'
            'python2-pyinotify: thinkhdaps applet (optional)'
            'gnome-python-desktop: stacks applet'
            'python2-wnck: slickswitcher applet'
            'fortune-mod: animal-farm applet'
            'upower: battery applet'
            'gnome-applets: cpufreq applet'
            'hddtemp: hardware-sensors applet (optional)'
            'lm_sensors: hardware-sensors applet (optional)')
options=('!libtool')
conflicts=("${pkgname/-git/}")
provides=("${pkgname/-git/}=${pkgver/\.r*/}")
source=("${_pkgname}"::git+https://github.com/p12tic/awn-extras.git
        remove-settings-menu.patch
        check-dependencies.patch
        dont_build_cairo_menu.patch)
sha256sums=('SKIP'
            '4a37d04ccf2e01c2dedc13ca2c518556c1f8abe78a302e85ace8df95808206f0'
            'bcb3dae957c3cebbd5ce233e5a0fc08bd33dac319b8ebde40e08467ca03c4aa4'
            '88a93eb240255087178c3c2375e150c68295866990ead18d7f3fb87ddc18fd5e')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $( grep -A 1 'AC_INIT.*awn-extras' configure.ac | tail -1 | grep -E -o '[0-9](\.[0-9]+)*' ).r$( git rev-list --count HEAD )
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  patch -uNp2 -r- -i "$srcdir/remove-settings-menu.patch"
  patch -uNp2 -r- -i "$srcdir/check-dependencies.patch"

  # Python2 fix
  find . -type f -name *.py | xargs sed -i 's@^#.*python$@#!/usr/bin/python2@'
  sed -i 's/async(\"python \"/async(\"python2 \"/' applets/maintained/shiny-switcher/shinyswitcherapplet.c

  msg "Disabling cairo-menu (build failures)"
  patch -uNp2 -r- -i "$srcdir/dont_build_cairo_menu.patch"
  rm -fr applets/maintained/cairo-menu
  sed -i '/applets\/maintained\/cairo-menu/d' configure.ac
  msg "Disabling volume-control (gstreamer0.10 is deprecated)"
  sed -i '/maintained\/volume-control/d' configure.ac applets/Makefile.am
  msg "Disabling media-player (gstreamer0.10 is deprecated)"
  sed -i '/maintained\/media-player/d' configure.ac applets/Makefile.am
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
              --disable-static \
              --disable-pymod-checks \
              --with-gconf \
              --enable-indicator-applet \
              PYTHON=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

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
