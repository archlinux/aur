pkgname=kalliope
pkgver=0.4.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Modular always-on voice controlled personal assistant designed for home automation"
depends=(portaudio python2-speechrecognition python2-markupsafe python2-pyaudio python2-pythondialog python2-jinja  python2-cffi python2-flask-restful python2-ipaddress python2-apscheduler python2-flask-testing python2-httpretty python2-requests svox-pico-bin mplayer python2-feedparser python2-mock python2-transitions python2-gitpython)
license=('MIT')
url="https://github.com/kalliope-project/kalliope"
source=("https://github.com/kalliope-project/kalliope/archive/v${pkgver}.tar.gz")
sha256sums=('fda4089fd22568d197049d8aa8789ec62db035e6b990f498bc922a6c1c767a2b')


prepare() {
  cd "$srcdir/kalliope-${pkgver}"
  sed -i "s|requests==2.12.4|requests|g" setup.py
  sed -i "s|flask==0.11.1|flask|g" setup.py
  sed -i "s|ipaddress==1.0.17|ipaddress|g" setup.py
  sed -i "s|jinja2==2.8|jinja2|g" setup.py
  sed -i "s|ansible==2.2.0.0|ansible|g" setup.py
}

build()
{
  cd "$srcdir/kalliope-${pkgver}"
  python2 setup.py build
}

package()
{
  cd "$srcdir/kalliope-${pkgver}"
  python2 setup.py install --root=${pkgdir} --optimize=1

  # hack: trigger/snowboy/x86_64/_snowboydetect.so is shipped linked against libcblas.so.3 not provided by cblas
  ln -sf /usr/lib/libcblas.so ${pkgdir}/usr/lib/libcblas.so.3
}
