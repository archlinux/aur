# Maintainer: Evert Vorster <evorster@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: IncredibleLaser
# Contributor: nous <nous at archlinux.us>
# Contributor: pressh



pkgname=kdenlive-release-git
pkgver=20.03.80.r12404.2824c27d2
pkgrel=1
pkgdesc="A non-linear video editor. Following latest released branch in git."
arch=('i686' 'x86_64')
url="http://www.kdenlive.org/"
license=('GPL')
depends=('breeze-icons' 'qt5-quickcontrols' 'qt5-webkit' 'kfilemetadata' 'knewstuff' 'kplotting' 'knotifyconfig' 'mlt' 
'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'v4l-utils')
optdepends=('ffmpeg: for FFmpeg plugin'
            'cdrkit: for creation of DVD ISO images'
            'dvdauthor: for creation of DVD'
            'dvgrab: for firewire capture'
            'libdv: for webcam capture (if FFmpeg is not installed)'
            'recordmydesktop: for screen capture'
            'xine-ui: for DVD preview'
	    'oxygen-icons: optional for xfce')
provides=('kdenlive')
conflicts=('kdenlive')
#source=(${pkgname}::git://anongit.kde.org/kdenlive)
#source=(git://anongit.kde.org/kdenlive) 
source=('git://anongit.kde.org/kdenlive#branch=release/20.04')
sha1sums=('SKIP')
install=$pkgname.install
options=(debug !strip)

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
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

