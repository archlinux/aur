# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-standalone-git
pkgver=r367.6284121
pkgrel=1
pkgdesc='Stylish top panel that holds indicators and spawns an application launcher (without Gala dependencies)'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel'
license=('GPL3')
groups=('pantheon-unstable' 'pantheon-qq')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'mutter'
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
            '67ffdac17cd4f46fb866eb8d33dd06db918bca16ae8ed4b2a2a00c3112f87a2b'
            '7f972d79b4d72f7b274a96e1a5150cba0e3869ad85215ae01ad2bc19802cdbb9'
            '20ec1d51a6610bf0105c772e4d1d4ac8f35ea0ee33b066981db57dc19fe3bdc6'
            'b1902c1d44ac546df63cd0224a7d2ef2cb6394ca556512c30c370d387db7bbab'
            '33ab0e02839c31850437994d4f6a636890f758d78ebd592552b9372200669e96'
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
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
