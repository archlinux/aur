pkgname=kalliope
pkgver=0.7.1
pkgrel=1
arch=('x86_64')
pkgdesc="Modular always-on voice controlled personal assistant designed for home automation"
makedepends=('python-snowboy')
depends=(portaudio python-markupsafe python-pyaudio python-pythondialog python-jinja  python-cffi python-flask-restful python-ipaddress python-apscheduler python-flask-testing python-httpretty python-requests svox-pico-bin mplayer python-feedparser python-mock python-transitions python-gitpython python-pyalsaaudio python-soundfile python-sounddevice python-sox python-voicerss-tts python-paho-mqtt python-ansible python-cachingutil python-pip cblas python-gevent python-sox python-speechrecognition python-configurationutil python-stateutil python-ruamel-yaml python-logging-tree python-classutils python-uiutil python-tableutil python-conversionutil python-openpyxl python-flask-cors python-gtts python-pyasn1 python-werkzeug python-gevent)
license=('MIT')
url="https://github.com/kalliope-project/kalliope"
source=("https://github.com/kalliope-project/kalliope/archive/v${pkgver}.tar.gz")
sha256sums=('caa83bedbe76affb1cce128be61b404b94fa587134d48cd285284148b1c42db6')

prepare()
{
  cd "$srcdir/kalliope-${pkgver}"
  sed -i "s|Werkzeug==0.16.1|Werkzeug|g" setup.py
  sed -i "s|gevent==1.4.0|gevent|g" setup.py
}


build()
{
  cd "$srcdir/kalliope-${pkgver}"
  python setup.py build

  # bundle snowboy
  mkdir -p ./build/lib/kalliope/trigger/snowboy/x86_64/python38/
  cp /usr/lib/python3.8/site-packages/snowboy/_snowboydetect.so ./build/lib/kalliope/trigger/snowboy/x86_64/python38/
}

package()
{
  cd "$srcdir/kalliope-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  rm -r ${pkgdir}/usr/lib/python3.8/site-packages/kalliope/trigger/snowboy/armv*
}
