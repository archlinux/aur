# Maintainer: Evert Vorster <evorster@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: IncredibleLaser
# Contributor: nous <nous at archlinux.us>
# Contributor: pressh



pkgname=kdenlive-git
pkgver=16.07.70.r7612.9a6517c
pkgrel=1
pkgdesc="A non-linear video editor for Linux using the MLT video framework. KF5 Frameworks (Latest Applications GIT Version)"
arch=('i686' 'x86_64')
url="http://www.kdenlive.org/"
license=('GPL')
depends=('qt5-webkit' 'kfilemetadata' 'knewstuff' 'knotifyconfig' 'mlt' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'v4l-utils')
optdepends=('ffmpeg: for FFmpeg plugin'
            'cdrkit: for creation of DVD ISO images'
            'dvdauthor: for creation of DVD'
            'dvgrab: for firewire capture'
            'libdv: for webcam capture (if FFmpeg is not installed)'
            'recordmydesktop: for screen capture'
            'xine-ui: for DVD preview'
	    'oxygen-icons: optional for xfce'
	    'breeze-icons: otional for default theme')
provides=('kdenlive')
conflicts=('kdenlive')
#source=(${pkgname}::git://anongit.kde.org/kdenlive)
#source=(git://anongit.kde.org/kdenlive) 
source=('git://anongit.kde.org/kdenlive')
sha1sums=('SKIP')
install=$pkgname.install
#options=(debug !strip)

pkgver() {
  cd kdenlive
  _ver="$(cat CMakeLists.txt | grep KDE_APPLICATIONS | cut -d '"' -f2 | tr '\n' '.' | cut -d "." -f 1-3)"
  echo "$(echo ${_ver}).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare(){
  mkdir -p build
}

#To get debug info, change -DCMAKE_BUILD_TYPE=Release to either "Debug" or "RelWithDebInfo"

build() {
  cd build
  cmake ../kdenlive \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

