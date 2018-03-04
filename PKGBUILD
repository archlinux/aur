# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-standalone-git
pkgver=r345.ec08fc6
pkgrel=1
pkgdesc='Stylish top panel that holds indicators and spawns an application launcher (without Gala dependencies)'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel'
license=('GPL3')
groups=('pantheon-unstable' 'pantheon-qq')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'mutter'
         'libgranite.so')
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
        'autohide-evbox.patch')
sha256sums=('SKIP'
            '4d413e38bdb0dc408dbbe115c0cf192172dd5efb8a8e28b2b2a2c809f6bf7f5c'
            '49e077acacfec80696a3ec29f13ed1e3c7cdcae54b53a419f5e9bc853c4684e3'
            '47934e9aff119cedcfe7d184078ad60d3d715e07f1ca7cb1715e50b2e0c517e8'
            'b1902c1d44ac546df63cd0224a7d2ef2cb6394ca556512c30c370d387db7bbab'
            '1f4ca296885c1c47724c13e5911b8f23fa674cfba1ae4fa922a733a59e74c29d')

pkgver() {
  cd wingpanel

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel

  #autohide
  msg2 "autohide"
  patch -Np2 < ../autohide-evbox.patch

  #Standalone patches
  msg2 "minus background manager"
  patch -Np2 < ../minus-backgroundmanager.patch
  msg2 "minus gala plugin"
  patch -Np2 < ../minus-galaplugin.patch
  msg2 "minus gala"
  patch -Np2 < ../minus-gala.patch

  #Cogl can't be found when not using gala's cmake package; wtf?
  msg2 "minus cogl"
  patch -Np2 < ../y-is-broken-cogl.patch

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
