# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Denis Kasak <dkasak|AT|termina.org.uk>

pkgname=ekho
pkgver=8.6
pkgrel=1
pkgdesc="Chinese text-to-speech (TTS) software for Cantonese, Mandarin, Zhaoan Hakka, Tibetan, Ngangien and Korean"
arch=('i686' 'x86_64')
url="https://www.eguidedog.net/ekho.php"
license=('GPL')
depends=('espeak-ng' 'lame' 'festival')
source=("https://downloads.sourceforge.net/e-guidedog/ekho-${pkgver}.tar.xz")
sha512sums=('cca7b95efe04fa377bec557c792bf6c7788caf5c0275c00979c20fd8c8acd20193c9968499ab3c1f3ee4bb29b0b43eabafd154d7a76ee87971430c1ea890ea39')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  CXXFLAGS="${CXXFLAGS} -fopenmp"
  if [ "${CARCH}" == "x86_64" ]; then
    CXXFLAGS="${CXXFLAGS} -D_x86_64"
  fi

  # fix undefined references to tget* functions
  sed -ie \
    's/^\(\s*LIB_FESTIVAL=.*\)-lncurses\(.*\)/\1-Wl,--push-state,--no-as-needed,-lncurses,--pop-state\2/' \
    $srcdir/$pkgname-$pkgver/configure

  CXXFLAGS="${CXXFLAGS}" \
  LDFLAGS="${LDFLAGS}" \
  ./configure --prefix=/usr --with-mp3lame --enable-festival
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
