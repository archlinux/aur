pkgname=kalliope
pkgver=0.3.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Modular always-on voice controlled personal assistant designed for home automation"
depends=(portaudio python2-speechrecognition python2-markupsafe python2-pyaudio python2-pythondialog python2-jinja  python2-cffi python2-flask-restful python2-wikipedia python2-pygmail python2-twitter python2-ipaddress python2-wakeonlan python2-apscheduler python2-flask-testing python2-httpretty python2-requests svox-pico-bin mplayer)
license=('MIT')
url="https://github.com/kalliope-project/kalliope"
source=("https://github.com/kalliope-project/kalliope/archive/v${pkgver}.tar.gz")
sha256sums=('7ddea6e381917f4f8c9a9984d393c997dbc8345dd58a377f63337cb0739416dc')

prepare() {
  cd "$srcdir/kalliope-${pkgver}"
  # https://github.com/kalliope-project/kalliope/pull/147
  sed -i "s|requests==2.12.1|requests==2.12.4|g" setup.py
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
