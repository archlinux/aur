# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Arthur Țițeică arthur.titeica/gmail/com
# Contributor: Thomas Laube <tomx3@tomtomtom.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=vokoscreenNG
pkgname=vokoscreen-git
pkgver=3.0.7.r46.g600669e0
pkgrel=1
epoch=1
pkgdesc='An easy to use screencast creator. Development version.'
arch=('i686' 'x86_64')
url='http://linuxecke.volkoh.de/vokoscreen/vokoscreen.html'
license=('GPL2')
depends=('qt5-x11extras' 'qt5-multimedia' 'qt-gstreamer'
	'gst-plugins-good' 'pulseaudio')
makedepends=('git' 'qt5-tools' 'libxrandr' 'bzip2')
optdepends=('gst-plugins-ugly: for x264 video codec'
	   'gst-plugins-bad: for faac')
provides=("${_pkgname%NG}=${pkgver}")
conflicts=("${_pkgname%NG}")
source=("git+https://github.com/vkohaupt/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags 2>/dev/null | sed -r 's/-/.r/' | tr - .
}

build() {
  [[ -d "${srcdir}"/build ]] || mkdir -p "${srcdir}"/build
  cd build
  qmake-qt5 ../${_pkgname}/src/ \
	    QMAKE_CFLAGS="${CFLAGS}" \
	    QMAKE_CXXFLAGS="${CXXFLAGS}" \
	    QMAKE_LDFLAGS="${LDFLAGS} -lbz2" \
	    CONFIG+=release \
	    CONFIG+=c++14 
  make
}

package() {
  install -Dm755 build/$_pkgname -t "$pkgdir"/usr/bin/
  install -Dm644 $_pkgname/src/applications/$_pkgname.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 $_pkgname/src/applications/$_pkgname.png -t "$pkgdir"/usr/share/pixmaps/
}
