# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Eddie Lozon <almostlucky@attbi.com>
# Contributor: Sickhate
# Contributor: KittyKatt <kittykatt AT silverirc.com>
# Contributor: UnCO <undercooled AT lavabit com>
pkgname=pekwm-git
_pkgname=pekwm
epoch=1
pkgver=0.2.0.r57.gac6a637
pkgrel=1
pkgdesc='Tabbed X11 window manager'
arch=(x86_64 i686)
license=(GPL)
url='https://github.com/pekdon/pekwm'
makedepends=(cmake gendesk git ninja)
depends=(libjpeg libpng libxft libxinerama libxpm libxrandr bash)
optdepends=('lxappearance: feature-rich GTK+ theme switcher'
            'nitrogen: background browser and setter'
            'tint2: basic, good-looking task manager')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
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
        etc/pekwm/panel
        etc/pekwm/start
        etc/pekwm/vars)
source=("$pkgname::git+https://github.com/pekdon/pekwm.git"
        'harbour-no-border.patch')
md5sums=('SKIP'
         '74c74a53743dab90e605eb73e0579528')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,^release-,,;s,-([0-9][0-9]*),.r\1,;s,[-_],.,g'
}

prepare() {
  gendesk -f -n --pkgname $_pkgname --pkgdesc "$pkgdesc" --name PekWM
  gendesk -f -n -wm --pkgname ${_pkgname}_kdm --exec $_pkgname --name PekWM
  # Harbour without border
  cd $pkgname
  patch -p1 -i "$srcdir"/harbour-no-border.patch
}

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -G Ninja \
    -S $pkgname
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 $_pkgname.desktop \
    "$pkgdir"/usr/share/xsessions/$_pkgname.desktop
  install -Dm644 ${_pkgname}_kdm.desktop \
    "$pkgdir"/usr/share/apps/kdm/sessions/$_pkgname.desktop
}

# vim: ts=2 sw=2 et
