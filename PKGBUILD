# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-standalone-git
pkgver=r382.dd64ba8
pkgrel=1
pkgdesc='Stylish top panel that holds indicators and spawns an application launcher (without Gala dependencies)'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel'
license=('GPL3')
groups=('pantheon-qq')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libwnck3')
makedepends=('cmake' 'git' 'granite-git' 'vala')
optdepends=("pantheon-applications-menu-git: Application launcher"
            wingpanel-indicator-{a11y,bluetooth,datetime,keyboard,network,notifications,power,session,sound}-git": Tray applet"
            "wingpanel-indicator-ayatana-git: Unity 7 Tray applets"
            "indicator-powersave: On the fly power savings and performance toggles"
            "glippy-indicator: Excellent clipboard manager applet"
            "indicator-sensors: Sensors readout applet"
            "ubuntu-indicator-weather: Simple weather applet")
provides=(wingpanel{,{,-standalone}-bzr,-git} 'libwingpanel-2.0.so')
conflicts=('wingpanel')
replaces=('wingpanel-standalone-bzr')
source=('git+https://github.com/elementary/wingpanel.git'
        'minus-backgroundmanager.patch'
        'minus-galaplugin.patch'
        'minus-gala.patch'
        'y-is-broken-cogl.patch'
        'autohide.patch'
        'reverse-105c1d0.patch')
sha256sums=('SKIP'
            '206e5e66501bd0aaefaa422edb4ef5b47dc5c1aff8a90410971b8be2147245e6'
            'aa0a27e41df60a7b15e2fd7e0d06551663b98917b7632e4067e6b9a39407de1c'
            '04fc55095e9fabc61862ef9a54934402b940b6cfa90fe5ed67462aa78e6e8f8e'
            'b1902c1d44ac546df63cd0224a7d2ef2cb6394ca556512c30c370d387db7bbab'
            '54d0fa9110eb948bc7a8ac55ed323b6979aabdf0657dcabfae2304b1dd16c194'
            '53bfa2220d14065ca848c36217abe812685c7d6e0d42251423d0faa2a0ac5394')

pkgver() {
  cd wingpanel

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel

  #Autohide
  msg2 "Autohide"
  patch -Np2 < ../autohide.patch
  #patch -Np2 < ../autohide-testing.patch

  #Reverse 105c1d0
  msg2 "Reverse commit 105c1d0"
  patch -Np1 < ../reverse-105c1d0.patch

  #Standalone patches
  msg2 "Remove Gala dependecies"
  rm -rf wingpanel-interface
  rm src/Services/BackgroundManager.vala
  patch -Np2 < ../minus-backgroundmanager.patch
  patch -Np2 < ../minus-galaplugin.patch
  patch -Np2 < ../minus-gala.patch

  #Cogl can't be found when not using gala's cmake package; wtf?
  msg2 "Remove CoglFixes (broken)"
  patch -Np2 < ../y-is-broken-cogl.patch

  [ ! -d build ] || rm -rf build
}

build() {
  cd wingpanel/
  arch-meson build
  ninja -C build
}

package() {
  cd wingpanel/
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
