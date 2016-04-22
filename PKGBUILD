# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>

pkgname=ekho
pkgver=6.5
pkgrel=1
pkgdesc="Chinese text-to-speech (TTS) software for Cantonese, Mandarin, Zhaoan Hakka, Tibetan, Ngangien and Korean"
arch=('i686' 'x86_64')
url="http://www.eguidedog.net/ekho.php"
license=('GPL')
depends=('libpulse' 'lame' 'festival' 'ncurses')
source=("http://downloads.sourceforge.net/e-guidedog/ekho-${pkgver}.tar.xz")
options=(!strip) #We have a lots of non executable data and only 2 executables

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  if [ "${CARCH}" == "x86_64" ]; then
    CXXFLAGS="${CXXFLAGS} -D_x86_64"
  fi

  # fix undefined references to tget* functions
  sed -ie                                                                                             \
    's/^\(\s*LIB_FESTIVAL=.*\)-lncurses\(.*\)/\1-Wl,--push-state,--no-as-needed,-lncurses,--pop-state\2/' \
    $srcdir/$pkgname-$pkgver/configure

  ./configure --prefix=/usr --with-mp3lame --enable-festival
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

md5sums=('d70ab33ee4070d62d452be595a92d2f2')
