# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Eddie Lozon <almostlucky@attbi.com>
# Contributor: Sickhate
# Contributor: KittyKatt <kittykatt AT silverirc.com>
# Contributor: UnCO <undercooled AT lavabit com>
pkgname='pekwm-git'
_pkgname='pekwm'
epoch=1
pkgver=0.1.17.r120.ge1cb85a
pkgrel=1
pkgdesc='Small, fast, functional, and flexible window manager'
arch=('x86_64' 'i686')
license=('GPL')
url='http://www.pekwm.org/'
depends=('libjpeg' 'libxft' 'libxinerama' 'libxpm' 'libxrandr')
makedepends=('gendesk>=0.6' 'git')
optdepends=('lxappearance: feature-rich GTK+ theme switcher'
            'nitrogen: background browser and setter'
            'tint2: basic, good-looking task manager')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=(etc/pekwm/autoproperties
        etc/pekwm/autoproperties_typerules
        etc/pekwm/config
        etc/pekwm/config_system
        etc/pekwm/keys
        etc/pekwm/menu
        etc/pekwm/mouse
        etc/pekwm/mouse_click
        etc/pekwm/mouse_sloppy
        etc/pekwm/mouse_system
        etc/pekwm/start
        etc/pekwm/vars)
#source=("$pkgname::git+http://www.pekwm.org/git/pekwm.git")
source=("$pkgname::git+http://projects.pekdon.net/git/pekwm.git"
        'harbour-no-border.patch')
md5sums=('SKIP'
         '74c74a53743dab90e605eb73e0579528')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,^release-,,;s,-([0-9][0-9]*),.r\1,;s,[-_],.,g'
}

prepare() {
  gendesk -f -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" --name PekWM
  gendesk -f -wm --pkgname "${_pkgname}_kdm" --exec "$_pkgname" --name PekWM
  # Harbour without border
  cd $pkgname
  patch -p1 -i "$srcdir"/harbour-no-border.patch
}

build() {
  cd $pkgname
  sed -i 's/libpng12/libpng/g' configure.ac
  ./autogen.sh
  # Default settings:
  #    --enable-shape --enable-menus \
  #    --disable-pcre --disable-debug  \
  #    --enable-xft --enable-image-xpm --enable-image-jpeg \
  #    --enable-image-png --enable-xrandr
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  install -Dm644 "$srcdir/${_pkgname}.desktop" \
    "$pkgdir/usr/share/xsessions/${_pkgname}.desktop"
  install -Dm644 "$srcdir/${_pkgname}_kdm.desktop" \
    "$pkgdir/usr/share/apps/kdm/sessions/${_pkgname}_kdm.desktop"
}

# vim: ts=2 sw=2 et
