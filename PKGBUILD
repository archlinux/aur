# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-standalone-git
pkgver=r620.6437f0d
pkgrel=2
pkgdesc='Stylish top panel that holds indicators and spawns an application launcher (without Gala dependencies)'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel'
license=('GPL3')
groups=('pantheon-qq')
depends=(lib{gee,granite.so,wnck3} 'cogl')
makedepends=('meson' 'libgranite.so' 'git' 'vala')
optdepends=("pantheon-applications-menu-git: Application launcher"
            wingpanel-indicator-{a11y,bluetooth,datetime,keyboard,network,notifications,power,session,sensors,sound}-git": Tray applet"
            wingpanel-indicator-{ayatana,namarupa}-git": Display Unity 7 tray applets"
            "indicator-powersave: On the fly power savings and performance toggles"
            "glippy-indicator: Excellent clipboard manager applet"
            "ubuntu-indicator-weather: Simple weather applet")
provides=(wingpanel{,{,-standalone}-bzr,-git} libwingpanel{,-3.0}.so)
#provides=(wingpanel{,{,-standalone}-bzr,-git} 'libwingpanel-2.0.so')
conflicts=(wingpanel{,{,-standalone}-bzr,-git} libwingpanel{,-3.0}.so)
#conflicts=(wingpanel{,{,-standalone}-bzr,-git} 'libwingpanel-2.0.so')
replaces=('wingpanel-standalone-bzr')
source=('git+https://github.com/elementary/wingpanel.git'
        'minus-backgroundmanager.patch'
        'minus-galaplugin.patch'
        'autohide.patch'
        'fix-for-openbox.patch'
        'no-mutter-typelib.patch')
sha256sums=('SKIP'
            '4d674f514d68c87ff5c23d0daa58a6d7e7c62c67142ebc734e88c45e940f7751'
            'aa0a27e41df60a7b15e2fd7e0d06551663b98917b7632e4067e6b9a39407de1c'
            '6d4c88c4b6dd13fc7ca60f2e2387f3af86d804f89591bd7826cf93a946b6f1b6'
            'aa15974b87a1000ab432bb048bc8a6ba0f36edd24e682d4e57833179c7b93f45'
            '5b29e24b4dc9076d54621334b839d2dbfa6a6adce1e8b444e38c2412f314f8c7')

pkgver() {
  cd wingpanel

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel

  #Lie
  #msg2 "FAKE 2.0 API"
  #git revert -n c6313641f56fd12d14ad4d064dd64422f1140ff3

  #Autohide
  msg2 "Autohide"
  patch -Np1 < ../autohide.patch
  #patch -Np2 < ../autohide-testing.patch

  #Fixes
  msg2 "Fix multiple-monitor strut method for openbox"
  patch -Np1 < ../fix-for-openbox.patch

  #Standalone patches
  msg2 "Remove Gala dependecies"
  rm -rf wingpanel-interface
  rm src/Services/BackgroundManager.vala
  patch -Np2 < ../minus-backgroundmanager.patch
  patch -Np2 < ../minus-galaplugin.patch
  patch -Np2 < ../no-mutter-typelib.patch
  #rm vapi/meson.build

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
