# Maintainer: Evert Vorster <evorster@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: IncredibleLaser
# Contributor: nous <nous at archlinux.us>
# Contributor: pressh



pkgname=kdenlive-git
pkgver=23.11.70.r18365
pkgrel=1
pkgdesc="A non-linear video editor for Linux using the MLT video framework. KF5 Frameworks (Latest Applications GIT Version)"
arch=('i686' 'x86_64')
url="http://www.kdenlive.org/"
license=('GPL')
depends=( 'kfilemetadata' 'knewstuff' 'knotifyconfig' 
	  'mlt' 'hicolor-icon-theme' 'purpose' 'qt5-networkauth' 'python'
	)
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'v4l-utils')
optdepends=('ffmpeg: for FFmpeg plugin'
            'cdrkit: for creation of DVD ISO images'
            'dvdauthor: for creation of DVD'
            'dvgrab: for firewire capture'
            'libdv: for webcam capture (if FFmpeg is not installed)'
            'recordmydesktop: for screen capture'
            'xine-ui: for DVD preview'
	    'perl-image-exif-tool: for exif information'
	    'mediainfo: for exif information'
	    'oxygen-icons: optional for xfce'
	    'breeze-icons: otional for default theme'
	    'opentimelineio: interchange format for editorial timeline information'
	    'python-setuptools: for python modules'
	    'python-vosk-bin: open source speech recognition')
provides=('kdenlive')
conflicts=('kdenlive')
#source=(${pkgname}::git://anongit.kde.org/kdenlive)
#source=(git://anongit.kde.org/kdenlive) 
#The git repo has changed recently. To update your git repo to the new one
#and save yourself from downloading the entire repo again, do:
#git remote set-url https://invent.kde.org/multimedia/kdenlive
#in the kdenlive git directory
source=('git+https://invent.kde.org/multimedia/kdenlive')
sha1sums=('SKIP')
#install=$pkgname.install
#options=(debug !strip)

pkgver() {
  cd ${srcdir}/kdenlive
  _ver="$(cat CMakeLists.txt | grep RELEASE_SERVICE_VERSION | cut -d '"' -f2 | tr '\n' '.' | cut -d "." -f 1-3)"
  echo "$(echo ${_ver}).r$(git rev-list --count HEAD)"
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
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}


package() {
  DESTDIR="$pkgdir" cmake --install build
## These are not needed anymore, as the package has finally been updated.
#  cp -v ../frei0r_bigsh0t_hemi_to_eq.xml ${pkgdir}/usr/share/kdenlive/effects/
#  cp -v ../frei0r_bigsh0t_eq_to_rect.xml ${pkgdir}/usr/share/kdenlive/effects/
}

