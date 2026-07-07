# Maintainer: Evert Vorster <evorster@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: IncredibleLaser
# Contributor: nous <nous at archlinux.us>
# Contributor: pressh



pkgname=kdenlive-release-git
pkgver=26.04.3.r23784
pkgrel=1
pkgdesc="A non-linear video editor for Linux using the MLT video framework. KF6 Frameworks (Latest Applications GIT Version)"
arch=('x86_64')
url="http://www.kdenlive.org/"
license=('GPL-2.0-or-later')
depends=( 'karchive' 'kbookmarks' 'kcodecs' 'kcolorscheme' 'kcompletion'
          'kconfig' 'kconfigwidgets' 'kcoreaddons' 'kcrash' 'kdbusaddons'
          'kddockwidgets' 'kfilemetadata' 'kguiaddons' 'ki18n' 'kiconthemes'
          'kio' 'kitemviews' 'knewstuff' 'knotifications' 'knotifyconfig'
          'ktextwidgets' 'kwidgetsaddons' 'kxmlgui'
          'ffmpeg' 'frei0r-plugins' 'mlt' 'opentimelineio' 'purpose'
          'qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-networkauth' 'qt6-svg'
          'solid' 'hicolor-icon-theme' 'python' 'qqc2-desktop-style'
	)
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'v4l-utils' 'qt6-tools')
optdepends=('cdrkit: for creation of DVD ISO images'
            'dvdauthor: for creation of DVD'
            'dvgrab: for firewire capture'
            'libdv: for webcam capture (if FFmpeg is not installed)'
            'recordmydesktop: for screen capture'
            'xine-ui: for DVD preview'
	    'perl-image-exiftool: for exif information'
	    'mediainfo: for exif information'
	    'oxygen-icons: optional for xfce'
	    'breeze-icons: optional for default theme'
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
source=('git+https://invent.kde.org/multimedia/kdenlive#branch=release/26.04')
sha1sums=('SKIP')
#install=$pkgname.install
#options=(debug !strip)

pkgver() {
  cd ${srcdir}/kdenlive
  _ver="$(cat CMakeLists.txt | grep RELEASE_SERVICE_VERSION | cut -d '"' -f2 | tr '\n' '.' | cut -d "." -f 1-3)"
  echo "$(echo ${_ver}).r$(git rev-list --count HEAD)"
}

#To get debug info, change -DCMAKE_BUILD_TYPE=Release to either "Debug" or "RelWithDebInfo"

build() {
  cmake -B build -S kdenlive \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

