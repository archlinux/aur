pkgname=kalliope
pkgver=0.4.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Modular always-on voice controlled personal assistant designed for home automation"
depends=(portaudio python2-speechrecognition python2-markupsafe python2-pyaudio python2-pythondialog python2-jinja  python2-cffi python2-flask-restful python2-ipaddress python2-apscheduler python2-flask-testing python2-httpretty python2-requests svox-pico-bin mplayer python2-feedparser python2-mock python2-transitions python2-gitpython)
license=('MIT')
url="https://github.com/kalliope-project/kalliope"
source=("https://github.com/kalliope-project/kalliope/archive/v${pkgver}.tar.gz")
sha256sums=('98cfda9c7ac0ec19c00e2d2f55a36c060172059411320783187ca7e5b8832f5c')

prepare() {
  cd "$srcdir/kalliope-${pkgver}"
  sed -i "s|jinja2>=2.8,<2.9|jinja2>=2.8|g" setup.py
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
