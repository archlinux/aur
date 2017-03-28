# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=plasma-mycroft
pkgname=plasma5-applets-mycroft-git
pkgver=r9.e7bae6a
pkgrel=1
pkgdesc="Mycroft Ai Plasmoid / Widget for KDE Plasma 5 Desktop"
arch=("x86_64" "i686")
url="https://cgit.kde.org/plasma-mycroft.git/"
license=('GPL3')
depends=('qt5-websockets' 'qt5-quickcontrols2')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'plasma-framework' 'python')
optdepends=('mycroft-core: for using "Installed Using Mycroft Package"')
provides=("plasma5-applets-mycroft")
conflicts=("plasma5-applets-mycroft")
install=$pkgname.install
source=('git+https://anongit.kde.org/plasma-mycroft.git'
        'pkgstartservice.patch'
        'pkgstopservice.patch')
sha512sums=('SKIP'
            '2f0c41f27c25aa09c059730331255e6fbebb05cac24440d575476d8fab4983837b6cdb1d0bb35f3884ae1a2294c5873aa38ceb4e3aa1c932d3550178919c4ba0'
            '3112eecc59ff26ee6e9e2f07e41c5cd6584fa7311084681d0619c15a1c72771e58e411a76cfee56e56c27c886b88dae36312586be27540635fb0dba092eabd76')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir/" install
  patch -p0 $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.mycroftplasmoid/contents/code/pkgstartservice.sh < $srcdir/pkgstartservice.patch
  patch -p0 $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.mycroftplasmoid/contents/code/pkgstopservice.sh < $srcdir/pkgstopservice.patch
  chmod +x $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.mycroftplasmoid/contents/code/{startservice,stopservice,pkgstartservice,pkgstopservice}.sh
}
