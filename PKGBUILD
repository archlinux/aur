# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=MycroftPlasmoid
pkgname=plasma5-applets-mycroft-git
pkgver=r10.c3a46f6
pkgrel=1
pkgdesc="Mycroft Ai Plasmoid / Widget for KDE Plasma 5 Desktop"
arch=("x86_64" "i686")
url="https://github.com/AIIX/MycroftPlasmoid"
license=('GPL3')
depends=('qt5-websockets' 'qt5-quickcontrols2') # 'mycroft-core')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'plasma-framework' 'python')
provides=("plasma5-applets-mycroft")
conflicts=("plasma5-applets-mycroft")
install=$pkgname.install
source=('git+https://github.com/AIIX/MycroftPlasmoid.git'
        'mycroft-location.patch')
sha512sums=('SKIP'
            '42076d6fb29c002dcda804263ce40fa621a3de4487fecd433bc4acb42564c46138cc409c58e450ef962bb720e98f7ad73eefd1176e0d0b7c68bb7161da24e6de')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#  cd $srcdir/$_pkgname
#  patch -p1 < $srcdir/mycroft-location.patch
#}

build() {
  cd $srcdir/$_pkgname
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

#check() {
#	cd "$srcdir/${pkgname%-VCS}"
#	make -k check
#}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir/" install
  chmod +x $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.projectmycroftplasmoid/contents/code/{startservice,stopservice}.sh
  sed -i 's:cd /home/$USER/mycroft-core*/:/usr/share/mycroft-core/:' $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.projectmycroftplasmoid/contents/code/startservice.sh
  sed -i 's:cd /home/$USER/mycroft-core*/:/usr/share/mycroft-core/:' $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.projectmycroftplasmoid/contents/code/stopservice.sh
}
