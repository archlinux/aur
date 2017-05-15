# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-standalone-git
pkgver=r283.54cd1fe
pkgrel=1
pkgdesc='Stylish top panel that holds indicators and spawns an application launcher (without Gala dependencies)'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel'
license=('GPL3')
groups=('pantheon-unstable' 'pantheon-qq')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'mutter'
         'libgranite.so')
makedepends=('cmake' 'git' 'granite-git' 'vala')
optdepends=("slingshot-launcher-standalone-bzr: Application launcher (without Gala dependencies)"
            wingpanel-indicator-{a11y,bluetooth,datetime,keyboard,network,notifications,power,session,sound}-git": Tray applet"
            "wingpanel-indicator-ayatana-bzr: Unity 7 Tray applets"
            "indicator-powersave: On the fly power savings and performance toggles"
            "glippy-indicator: Excellent clipboard manager applet"
            "indicator-sensors: Sensors readout applet")
provides=(wingpanel{,{,-standalone}-bzr,-git} 'libwingpanel-2.0.so')
conflicts=('wingpanel')
replaces=('wingpanel-standalone-bzr')
source=('git+https://github.com/elementary/wingpanel.git'
        'minus-backgroundmanager.patch'
        'minus-galaplugin.patch'
        'minus-gala-cmake.patch'
        'y-is-broken-cogl.patch'
        'autohide.patch')
sha256sums=('SKIP'
            '0fd440cdb4b9871c5ee8812866b365e4a45b29813800345556db74429bacca3e'
            '1f50f34a7d36fc8331c1080c42c38f8208e35f4551eed97705919d304d410c95'
            '910130e7033db8874ed8d5e1734c6eb0ce75eed7ddf2620400c2a129cf05755d'
            'df03ebb7fe08da77d51e6b96ab033b5c712530727d9fa2dd61420d2c7923fced'
            '2705bd49c38debd20ad2759fa880238661530abdd8962a5373d0b431cd7cf084')

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
  #msg2 "autohide"
  #patch -Np2 < ../autohide.patch

  #Cogl can't be found, although it is installed. Arch-specific? .so bump?
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
