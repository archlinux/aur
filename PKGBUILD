# Maintainer: Steven Allen <steven {at} stebalien {dot} com>
# Contributor: Reverie <reverie@takhis.net>

pkgname=wordnet
pkgver=3.1
_srcver=3.0
pkgrel=2
pkgdesc="An Electronic Lexical Database from Princeton University"
arch=('i686' 'x86_64')
url="http://wordnet.princeton.edu/"
license=("custom")
options=(staticlibs)
depends=('tk')
source=("http://wordnetcode.princeton.edu/${_srcver}/WordNet-${_srcver}.tar.bz2"
        "http://wordnetcode.princeton.edu/wn${pkgver}.dict.tar.gz"
        wordnet.desktop
        wordnet.png)
sha256sums=('6c492d0c7b4a40e7674d088191d3aa11f373bb1da60762e098b8ee2dda96ef22'
            '3f7d8be8ef6ecc7167d39b10d66954ec734280b5bdcd57f7d9eafe429d11c22a'
            '10a4011b3d9705b2b0a1f496b33d926d4be21439c63f039b871d93f2d143ed0c'
            '9ab9f761a3fabd278fd05d755fec8a403874f899d7e40347f1da48bf93a67e97')

build() {
  cd "$srcdir/WordNet-$_srcver"
  ./configure --prefix=/usr --mandir=/usr/share/man \
              CFLAGS="${CFLAGS} -fPIC -DUSE_INTERP_RESULT" \
              CXXFLAGS="${CXXFLAGS} -fPIC"
  sed 's:#define DEFAULTPATH "/usr/dict":#define DEFAULTPATH "/usr/share/wordnet/dict":' -i config.h
  sed 's:"/usr/local/WordNet-3.0/lib/wnres":"/usr/share/wordnet/wnres":' -i src/wnb
  make
}

package() {
  cd "${srcdir}/WordNet-${_srcver}"
  make DESTDIR="$pkgdir" install
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/wordnet"
  mv "${pkgdir}/usr/lib/wnres" "${pkgdir}/usr/share/wordnet/wnres"
  rm -fr "${pkgdir}/usr/include/tk"

  # Replace dictionary files
  cp -a "${srcdir}/dict/" "${pkgdir}/usr/share/wordnet/dict"
  chmod -R u=rwX,go=rX "${pkgdir}/usr/share/wordnet/dict"
  rm -fr "${pkgdir}/usr/dict"

  install -D -m644 "${srcdir}/wordnet.desktop" "${pkgdir}/usr/share/applications/wordnet.desktop"
  install -D -m644 "${srcdir}/wordnet.png" "${pkgdir}/usr/share/pixmaps/wordnet.png"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}
