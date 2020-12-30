# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=golden-cheetah-rc
_pkgver="3.6-DEV2009"
pkgver=${_pkgver//-/_}
pkgrel=1
epoch=0
pkgdesc="Official Golden Cheetah developement releases, release candidates and stable releases"
arch=(x86_64)
url="http://www.goldencheetah.org/"
license=(GPL)
makedepends=(
bison
flex
qt5-tools
gendesk
)
depends=(
python
python-sip
qt5-base
qt5-svg
qt5-location
qt5-webengine
qt5-declarative
qt5-webchannel
qt5-sensors
qt5-serialport
qt5-webkit
qt5-multimedia
qt5-script
qt5-connectivity
qt5-charts
vlc
libsamplerate
libftd2xx
libical
libusb-compat
r
)
optdepends=(
srmio
libkml
)
options=('!strip' '!buildflags' 'staticlibs')

conflicts=('golden-cheetah-git' 'golden-cheeta-dev' 'golden-cheetah')
provides=('golden-cheetah')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GoldenCheetah/GoldenCheetah/archive/v${_pkgver}.tar.gz")
sha256sums=('b453fc0ae0322aedcfac08dbaa4c20b1b098904a5c77bb40a353d0e447c658d4')


prepare() {
  cd GoldenCheetah-${_pkgver}
  cp qwt/qwtconfig.pri.in qwt/qwtconfig.pri
  cp src/gcconfig.pri.in src/gcconfig.pri
  # Define GC version string, only for tagged builds
  if [ -n "$TRAVIS_TAG" ]; then echo DEFINES += GC_VERSION=VERSION_STRING >> src/gcconfig.pri; fi
  # make a release build
  sed -i "s|#\(CONFIG += release.*\)|\1 static|" src/gcconfig.pri
  sed -i "s|^#QMAKE_CXXFLAGS|QMAKE_CXXFLAGS|" src/gcconfig.pri
  # Enable -lz
  sed -i "s|^#LIBZ_LIBS|LIBZ_LIBS|" src/gcconfig.pri
  # ICAL
  sed -i "s|#\(ICAL_INSTALL =.*\)|\1 /usr|" src/gcconfig.pri
  # LIBUSB
  sed -i "s|#\(LIBUSB_INSTALL =\).*|\1 /usr/local|" src/gcconfig.pri
  sed -i "s|#\(LIBUSB_LIBS    =.*\)|\1 -lusb-1.0 -ldl -ludev|" src/gcconfig.pri
  sed -i "s|#\(LIBUSB_USE_V_1 = true.*\)|\1|" src/gcconfig.pri
  # VLC & VIDEO
  sed -i "s|#\(VLC_INSTALL =.*\)|\1 /usr|" src/gcconfig.pri
  sed -i "s|#\(VLC_LIBS    =.*\)|\1 -lvlc|" src/gcconfig.pri
  sed -i "s|^#HTPATH|HTPATH|" src/gcconfig.pri
  sed -i "s|\(DEFINES += GC_VIDEO_NONE.*\)|#\1 |" src/gcconfig.pri
  sed -i "s|#\(DEFINES += GC_VIDEO_VLC.*\)|\1|" src/gcconfig.pri
  # R
  sed -i "s|#\(DEFINES += GC_WANT_R.*\)|\1|" src/gcconfig.pri
  # Enable CloudDB
  sed -i "s|^#CloudDB|CloudDB|" src/gcconfig.pri
  # LIBKML
  #sed -i "s|#\(KML_INSTALL =\).*|\1 /usr|" src/gcconfig.pri
  # D2XX
  sed -i "s|#\(D2XX_INCLUDE =.*\)|\1 ../D2XX/release|" src/gcconfig.pri
  # SAMPLERATE
  sed -i "s|#\(SAMPLERATE_INSTALL =\).*|\1 /usr|" src/gcconfig.pri
  # SRMIO
  #sed -i "s|#\(SRMIO_INSTALL =.*\)|\1 /usr/local|" src/gcconfig.pri
  # Python
  echo DEFINES += GC_WANT_PYTHON >> src/gcconfig.pri
  echo PYTHONINCLUDES = $(pkg-config --cflags python3-embed) >> src/gcconfig.pri
  echo PYTHONLIBS = -L$(python -c "import sysconfig; print(sysconfig.get_config_var('srcdir'))") $(pkg-config --libs python3-embed) >> src/gcconfig.pri
  # GSL
  echo GSL_LIBS = -lgsl -lgslcblas -lm >> src/gcconfig.pri

  # sip fix
  echo 'DEFINES += SIP_MODULE_NAME=\\\"sip\\\"' >> src/gcconfig.pri

  # fix missing util link
  echo 'LIBS += -lutil' >> src/gcconfig.pri

  # fix for https://github.com/GoldenCheetah/GoldenCheetah/issues/3586
  curl https://patch-diff.githubusercontent.com/raw/GoldenCheetah/GoldenCheetah/pull/3590.patch | patch -p1

  gendesk -n \
    --pkgname=${pkgname} \
    --pkgdesc='Cycling power analysis software' \
    --categories='Science;Sports' \
    --exec=golden-cheetah \
    --icon=gc
}

build() {
  cd GoldenCheetah-${_pkgver}
  lupdate src/src.pro
  qmake -recursive QMAKE_CXXFLAGS_WARN_ON+="-Wno-deprecated-declarations -Wno-unused-value" QMAKE_CFLAGS_WARN_ON+="-Wno-deprecated-declarations -Wno-unused-value"
  make
}

package() {
  cd GoldenCheetah-${_pkgver}

  mkdir -p "$pkgdir/usr/bin/"
  cp src/GoldenCheetah "${pkgdir}/usr/bin/golden-cheetah"

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"  

  #mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
  
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  cp src/Resources/images/gc.png "${pkgdir}/usr/share/pixmaps/."
}
