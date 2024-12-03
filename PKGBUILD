# Maintainer: envolution
# Contributor: Steven Allen <steven {at} stebalien {dot} com>
# Contributor: Reverie <reverie@takhis.net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgbase=wordnet
pkgname=(wordnet-common)
pkgver=3.1
_srcver=3.0
pkgrel=5
arch=('i686' 'x86_64')
url="https://wordnet.princeton.edu/"
license=("custom")
makedepends=('tk')
source=(
  #"https://wordnetcode.princeton.edu/${_srcver}/WordNet-${_srcver}.tar.bz2"
  "http://deb.debian.org/debian/pool/main/w/wordnet/wordnet_${_srcver}-38.debian.tar.xz"
  "http://deb.debian.org/debian/pool/main/w/wordnet/wordnet_${_srcver}.orig.tar.gz"
  "https://wordnetcode.princeton.edu/wn${pkgver}.dict.tar.gz"
  wordnet.desktop
  wordnet.png)
sha256sums=('84a0d648d879bca4b8514a24176260af7cecc3581a39980c6e1304c8ab641a53'
            '73572005ef8eb15be48ea1010d18082b80bfbf8684b78ce64bc3abf11db1f95f'
            '3f7d8be8ef6ecc7167d39b10d66954ec734280b5bdcd57f7d9eafe429d11c22a'
            '10a4011b3d9705b2b0a1f496b33d926d4be21439c63f039b871d93f2d143ed0c'
            '9ab9f761a3fabd278fd05d755fec8a403874f899d7e40347f1da48bf93a67e97')

prepare() {
  mapfile -t _patch_series <debian/patches/series
  cd "$srcdir/WordNet-$_srcver"
  for _patch in "${_patch_series[@]}"; do
    patch -Np1 -i "../debian/patches/$_patch"
  done
}

build() {
  cd "$srcdir/WordNet-$_srcver"
  sed 's:/usr/lib/wordnet/wishwn:/usr/bin/wishwn:g' -i src/wnb
  ./configure --prefix=/usr --mandir=/usr/share/man \
    CFLAGS="${CFLAGS} -fPIC -DUSE_INTERP_RESULT -Wno-error=format-security" \
    CXXFLAGS="${CXXFLAGS} -fPIC"
  make
}

package_wordnet-common() {
  pkgdesc="An Electronic Lexical Database from Princeton University"

  cd "${srcdir}/WordNet-${_srcver}"
  make DESTDIR="$pkgdir" install

  mv "${pkgdir}/usr/lib/wnres" "${pkgdir}/usr/share/wordnet/wnres"

  # Replace dictionary files
  chmod -R u=rwX,go=rX "${srcdir}/dict"
  cp -ar "${srcdir}/dict/"* "${pkgdir}/usr/share/wordnet/"
  rm -fr "${pkgdir}/usr/dict" #clean this default directory

  install -D -m644 "${srcdir}/wordnet.desktop" "${pkgdir}/usr/share/applications/wordnet.desktop"
  install -D -m644 "${srcdir}/wordnet.png" "${pkgdir}/usr/share/pixmaps/wordnet.png"

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}
# vim:set ts=2 sw=2 et:
