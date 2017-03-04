# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>
# Contributor: flamelab <panosfilip@gmail.com>

pkgname=wingpanel-standalone-bzr
pkgver=r172
pkgrel=1
pkgdesc='The Pantheon Panel (without Gala dependencies)'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel'
license=('GPL3')
groups=('pantheon-qq')
depends=('clutter' 'cogl' 'glib2' 'glibc' 'gtk3' 'libgee' 'mutter'
         'libgranite.so' 'slingshot-launcher-standalone-bzr')
makedepends=('bzr' 'cmake' 'vala')
optdepends=("indicator-powersave: On the fly power savings and performance toggles"
            wingpanel-indicator-{ayatana,bluetooth,datetime,network,power,sound}-bzr": Tray applet")
provides=(wingpanel{,-bzr} 'libwingpanel-2.0.so')
conflicts=(wingpanel{,-bzr})
install='wingpanel.install'
source=('wingpanel::bzr+lp:wingpanel'
        'minus-backgroundmanager.patch'
        'minus-galaplugin.patch'
        'disable-expanded.patch')
sha256sums=('SKIP'
            '0fd440cdb4b9871c5ee8812866b365e4a45b29813800345556db74429bacca3e'
            '1f50f34a7d36fc8331c1080c42c38f8208e35f4551eed97705919d304d410c95'
            '383e96233c95335d2ef4390e15c7c3cff1c146b6736390e90e96e5e59ea43f3e')

pkgver() {
  cd wingpanel

  echo "r$(bzr revno)"
}

prepare() {
  cd wingpanel

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  #Standalone patches
  patch -Np2 < ../minus-backgroundmanager.patch
  patch -Np2 < ../minus-galaplugin.patch

  #fix focus stealing
  patch -Np2 < ../disable-expanded.patch
}

build() {
  cd wingpanel/build

  cmake .. \
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
