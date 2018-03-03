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
            'bb9aa2a62256dc45633a7ee9fd9e0f3536f5dbce01e13ed138a8e7cb5a1da83a'
            '49e077acacfec80696a3ec29f13ed1e3c7cdcae54b53a419f5e9bc853c4684e3'
            '47934e9aff119cedcfe7d184078ad60d3d715e07f1ca7cb1715e50b2e0c517e8'
            'b1902c1d44ac546df63cd0224a7d2ef2cb6394ca556512c30c370d387db7bbab'
            '9e436ff3da488ed2ce9b74a3714d2766a19f27e54d48694d126d3d1db572c06d')

pkgver() {
  cd wingpanel

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel

  #Standalone patches
  msg2 "minus background manager"
  patch -Np2 < ../minus-backgroundmanager.patch
  msg2 "minus gala plugin"
  patch -Np2 < ../minus-galaplugin.patch
  msg2 "minus gala"
  patch -Np2 < ../minus-gala.patch

  #autohide
  msg2 "autohide"
  patch -Np2 < ../autohide-evbox.patch

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
