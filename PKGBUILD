# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=krdc-git
_pkgname=krdc
pkgver=25.03.70.r85.g875407f
pkgrel=1
pkgdesc='Remote Desktop Client'
url='https://apps.kde.org/krdc/'
arch=(x86_64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         plasma-activities
         kbookmarks
         kcmutils
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kdnssd
         ki18n
         kio
         knotifyconfig
         kstatusnotifieritem
         kwidgetsaddons
         kwallet
         kxmlgui
         qt6-base)
makedepends=(extra-cmake-modules
             freerdp
             kdoctools
             libvncserver
             git)
optdepends=('libvncserver: VNC support'
            'libssh: VNC support'
            'freerdp: RDP support'
            'keditbookmarks: to edit bookmarks')
groups=(kde-applications
        kde-network)
source=(git+https://invent.kde.org/network/krdc)
sha256sums=('SKIP')
provides=(${_pkgname})
conflicts=(${_pkgname})

pkgver() {
  cd $_pkgname
  major=$(grep -m1 "VERSION_MAJOR" CMakeLists.txt | cut -d'"' -f2)
  minor=$(grep -m1 "VERSION_MINOR" CMakeLists.txt | cut -d'"' -f2)
  micro=$(grep -m1 "VERSION_MICRO" CMakeLists.txt | cut -d'"' -f2)
  blame=$(git blame CMakeLists.txt | grep -m1 "VERSION_MINOR" | cut -d' ' -f1)
  printf "%s.%s.%s.r%s.g%s" $major $minor $micro $(git rev-list --count $blame..HEAD) "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
