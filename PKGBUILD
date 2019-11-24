pkgname=kalliope
pkgver=0.5.5
pkgrel=1
arch=('x86_64')
pkgdesc="Modular always-on voice controlled personal assistant designed for home automation"
makedepends=('swig')
depends=(portaudio python-markupsafe python-pyaudio python-pythondialog python-jinja  python-cffi python-flask-restful python-ipaddress python-apscheduler python-flask-testing python-httpretty python-requests svox-pico-bin mplayer python-feedparser python-mock python-transitions python-gitpython python-pyalsaaudio python-soundfile python-sounddevice python-sox python-voicerss-tts python-paho-mqtt python-ansible python-cachingutil python-pip cblas python-gevent python-gtts python-sox python-speechrecognition python-configurationutil python-stateutil python-ruamel-yaml python-logging-tree python-classutils python-uiutil python-tableutil python-conversionutil python-openpyxl)
license=('MIT')
url="https://github.com/kalliope-project/kalliope"
source=("https://github.com/kalliope-project/kalliope/archive/v${pkgver}.tar.gz")
sha256sums=('3b2dbee3e380d3942491684a5c6dd00ab173dda3472faf71f08e138c8946cfbd')

prepare()
{
  cd "$srcdir/kalliope-${pkgver}"
  sed -i "s|ansible>=2.8.1,<2.9|ansible>=2.8|g" setup.py
}


build()
{
  cd "$srcdir/kalliope-${pkgver}"
  python setup.py build
  
  # rebuild snowboy
  SNOWBOY_VERSION=1.3.0
  curl -fSsLO https://github.com/Kitt-AI/snowboy/archive/v${SNOWBOY_VERSION}.tar.gz
  rm -rf snowboy-${SNOWBOY_VERSION}
  tar xzf v${SNOWBOY_VERSION}.tar.gz
  cd snowboy-${SNOWBOY_VERSION}/swig/Python
  sed -i "s|-lf77blas -lcblas -llapack -latlas|-lcblas|g" Makefile
  make
  python -c "import _snowboydetect; print('OK')"
  cd ../../..
  mkdir -p ./build/lib/kalliope/trigger/snowboy/x86_64/python38/
  cp ./snowboy-${SNOWBOY_VERSION}/swig/Python/_snowboydetect.so ./build/lib/kalliope/trigger/snowboy/x86_64/python38/
}

package()
{
  cd "$srcdir/kalliope-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
