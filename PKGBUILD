# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=golden-cheetah-rc
_pkgver="3.5-RC2X"
pkgver=${_pkgver//-/_}
pkgrel=1
epoch=0
pkgdesc="Official Golden Cheetah developement releases, release candidates and stable releases"
arch=('x86_64')
url="http://www.goldencheetah.org/"
license=('GPL')
makedepends=('bison' 'flex' 'qt5-tools')
depends=('python' 'python-sip' 'qt5-base' 'qt5-svg' 'qt5-location' 'qt5-webengine' 'qt5-declarative' 'qt5-webchannel' 'qt5-sensors' 'qt5-serialport' 'qt5-webkit' 'qt5-multimedia' 'qt5-script' 'qt5-connectivity' 'qt5-charts' 'vlc' 'libsamplerate' 'libftd2xx' 'libical' 'libusb-compat')
optdepends=('srmio' 'libkml')
options=('!strip' '!buildflags' 'staticlibs')

conflicts=('golden-cheetah-git' 'golden-cheeta-dev' 'golden-cheetah')
provides=('golden-cheetah')
source=("https://github.com/GoldenCheetah/GoldenCheetah/archive/V${_pkgver}.tar.gz")
md5sums=('aa3ba5daeee0a0ef0dfb790d62c0a325')


prepare() {
  cd "${srcdir}/GoldenCheetah-${_pkgver}/"
  cp qwt/qwtconfig.pri.in qwt/qwtconfig.pri
  cp src/gcconfig.pri.in src/gcconfig.pri
  # make a relese build
  sed -i "s|#\(CONFIG += release.*\)|\1 static|" src/gcconfig.pri
  # user WEBENGINE
  echo DEFINES += NOWEBKIT >> src/gcconfig.pri  
  # lrelease command
  sed -i "s|#\(QMAKE_LRELEASE = \).*|\1 lrelease|" src/gcconfig.pri
  # Enable -lz
  sed -i "s|^#LIBZ_LIBS|LIBZ_LIBS|" src/gcconfig.pri
  # ICAL
  # TODO: build seems to be broken
  #sed -i "s|#\(ICAL_INSTALL =.*\)|\1 /usr|" src/gcconfig.pri
  # LIBUSB
  sed -i "s|#\(LIBUSB_INSTALL =\).*|\1 /usr|" src/gcconfig.pri
  sed -i "s|#\(LIBUSB_LIBS    =.*\)|\1 /usr/lib/libusb.so -lusb-1.0 -ldl -ludev|" src/gcconfig.pri
  # VLC & VIDEO
  sed -i "s|#\(VLC_INSTALL =.*\)|\1 /usr|" src/gcconfig.pri
  sed -i "s|#\(VLC_LIBS    =.*\)|\1 -lvlc|" src/gcconfig.pri
  sed -i "s|^#HTPATH|HTPATH|" src/gcconfig.pri
  sed -i "s|\(DEFINES += GC_VIDEO_NONE.*\)|#\1 |" src/gcconfig.pri
  sed -i "s|#\(DEFINES += GC_VIDEO_VLC.*\)|\1|" src/gcconfig.pri
  # R
  sed -i "s|#\(DEFINES += GC_WANT_R.*\)|\1|" src/gcconfig.pri
  # Enable CloudDB
  #sed -i "s|^#CloudDB|CloudDB|" src/gcconfig.pri
  # LIBKML
  #sed -i "s|#\(KML_INSTALL =\).*|\1 /usr|" src/gcconfig.pri
  # D2XX
  sed -i "s|#\(D2XX_INCLUDE =.*\)|\1 /usr|" src/gcconfig.pri
  # SAMPLERATE
  sed -i "s|#\(SAMPLERATE_INSTALL =\).*|\1 /usr|" src/gcconfig.pri
  # SRMIO
  #sed -i "s|#\(SRMIO_INSTALL =.*\)|\1 /usr/|" src/gcconfig.pri

  # Python
  echo DEFINES += GC_WANT_PYTHON >> src/gcconfig.pri
  echo PYTHONINCLUDES = -I/usr/include/python3.8 >> src/gcconfig.pri
  echo PYTHONLIBS = -L/usr/lib/python3.8/config-3.8-x86_64-linux-gnu -lpython3.8 -lutil >> src/gcconfig.pri

  #qmake-qt5 -recursive QMAKE_LRELEASE=/usr/bin/lrelease-qt5 QMAKE_DEFAULT_INCDIRS=
  
  # fix for https://github.com/GoldenCheetah/GoldenCheetah/issues/3270
  sed -i 's,#include <QVector>,#include <QVector>\n#include <QMap>,g' src/Metrics/PowerProfile.h

  # fix chart include for qtwebthingy
  #sed -i 's,QT += widgets concurrent serialport multimedia multimediawidgets,QT += widgets concurrent serialport multimedia multimediawidgets webkitwidgets,g' src/src.pro
  #sed -i 's,#include <QWebEngineSettings>,#include <QtWebEngineWidgets/QWebEngineSettings>,g' src/Charts/PythonChart.cpp
  #sed -i 's,#include <QWebEngineView>,#include <QtWebEngineWidgets/QWebEngineView>,g' src/Charts/PythonChart.h
  #sed -i 's,#include <QWebEngineView>,#include <QtWebEngineWidgets/QWebEngineView>,g' src/Python/SIP/Bindings.cpp

  sed -i 's,SIP_MODULE_NAME,"sip",g' src/Python/SIP/sipgoldencheetahcmodule.cpp

  #qmake-qt5 -recursive QMAKE_LRELEASE=/usr/bin/lrelease-qt5 QMAKE_DEFAULT_INCDIRS=
  qmake -recursive
  make clean

  #curl https://github.com/KiCad/kicad-source-mirror/commit/5685174808f5ca973e916a10f9f93660ee4dc4f2.patch | patch -p1
}

build() {
  cd "${srcdir}/GoldenCheetah-${_pkgver}/"
  make
}

package() {
  cd "${srcdir}/GoldenCheetah-${_pkgver}/"

  mkdir -p "$pkgdir/usr/bin/"
  cp src/GoldenCheetah "${pkgdir}/usr/bin/golden-cheetah"
  
  #mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
  
  mkdir -p "${pkgdir}/usr/share/applications/"
  cat >"${pkgdir}/usr/share/applications/GoldenCheetah.desktop" <<EOF
[Desktop Entry]
Version=${_pkgver}
Type=Application
Name=GoldenCheetah
Comment=Cycling Power Analysis Software.
Exec=golden-cheetah
Icon=gc
Categories=Science;Sports;
EOF

  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  cp src/Resources/images/gc.png "${pkgdir}/usr/share/pixmaps/."
}
