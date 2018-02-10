pkgname=kalliope
pkgver=0.5.0
pkgrel=1
arch=('x86_64')
pkgdesc="Modular always-on voice controlled personal assistant designed for home automation"
makedepends=(swig)
depends=(portaudio python-speechrecognition python-markupsafe python-pyaudio python-pythondialog python-jinja  python-cffi python-flask-restful python-ipaddress python-apscheduler python-flask-testing python-httpretty python-requests svox-pico-bin mplayer python-feedparser python-mock python-transitions python-gitpython python-pyalsaaudio python-rpi.gpio python-soundfile python-sounddevice python-sox python-voicerss-tts python-paho-mqtt cblas)
license=('MIT')
url="https://github.com/kalliope-project/kalliope"
source=("https://github.com/kalliope-project/kalliope/archive/v${pkgver}.tar.gz")
sha256sums=('e4e1930a6cbacd4b6c28f41a4c7a900c25deb0951c9de8716becffef4e329fe0')

prepare()
{
  cd "$srcdir/kalliope-${pkgver}"
  sed -i "s|jinja2>=2.8,<=2.9.6|jinja2>=2.8|g" setup.py
  sed -i "s|ansible>=2.3,<2.4|ansible>=2.3|g" setup.py

  # rebuild snowboy
  SNOWBOY_VERSION=1.2.0
  wget -c https://github.com/Kitt-AI/snowboy/archive/v${SNOWBOY_VERSION}.tar.gz
  rm -rf snowboy-${SNOWBOY_VERSION}
  tar xzf v${SNOWBOY_VERSION}.tar.gz
  cd snowboy-${SNOWBOY_VERSION}/swig/Python
  sed -i "s|-lf77blas -lcblas -llapack_atlas -latlas|-lcblas|g" Makefile
  make
  python -c "import _snowboydetect; print('OK')"
  cd ../../..
  cp ./snowboy-1.2.0/swig/Python/_snowboydetect.so ./kalliope/trigger/snowboy/x86_64/python36/
}


build()
{
  cd "$srcdir/kalliope-${pkgver}"
  python setup.py build
}

package()
{
  cd "$srcdir/kalliope-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}
