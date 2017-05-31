# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-standalone-git
pkgver=r288.0b6d486
pkgrel=2
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
        'minus-gala-cmake.patch'
        'y-is-broken-cogl.patch'
        'autohide-evbox.patch')
sha256sums=('SKIP'
            '0fd440cdb4b9871c5ee8812866b365e4a45b29813800345556db74429bacca3e'
            '1f50f34a7d36fc8331c1080c42c38f8208e35f4551eed97705919d304d410c95'
            '910130e7033db8874ed8d5e1734c6eb0ce75eed7ddf2620400c2a129cf05755d'
            'df03ebb7fe08da77d51e6b96ab033b5c712530727d9fa2dd61420d2c7923fced'
            '7cf4d73688e7edc258a9ed2803fa018250a9ec3307b4d1399298d567459fb87a')

pkgver() {
  cd wingpanel

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  #Standalone patches
  msg2 "minus bgm"
  patch -Np2 < ../minus-backgroundmanager.patch
  msg2 "minus gpg"
  patch -Np2 < ../minus-galaplugin.patch
  msg2 "minus gcm"
  patch -Np2 < ../minus-gala-cmake.patch

  #autohide
  msg2 "autohide"
  patch -Np2 < ../autohide-evbox.patch

  #Cogl can't be found when not using gala's cmake package; wtf?
  msg2 "minus cgl"
  patch -Np2 < ../y-is-broken-cogl.patch
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
