# Maintainer: envolution
# Contributor: Steven Allen <steven {at} stebalien {dot} com>
# Contributor: Reverie <reverie@takhis.net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgbase=wordnet
pkgname=(
  wordnet-common 
  wordnet-progs
  wordnet-dictd
)
pkgver=3.1
_srcver=3.0
pkgrel=16
arch=('i686' 'x86_64')
url="https://wordnet.princeton.edu/"
license=('GPL-2.0-only' 'LicenseRef-custom')
depends=(glibc python tcl tk ghostscript dictd) # dictd needed for dictzip command during build
source=(
  #"https://wordnetcode.princeton.edu/${_srcver}/WordNet-${_srcver}.tar.bz2"
  "http://deb.debian.org/debian/pool/main/w/wordnet/wordnet_${_srcver}-39.debian.tar.xz"
  "http://deb.debian.org/debian/pool/main/w/wordnet/wordnet_${_srcver}.orig.tar.gz"
  "https://wordnetcode.princeton.edu/wn${pkgver}.dict.tar.gz"
  wordnet.desktop
  wordnet.png
  wordnet-dictd.install)
sha256sums=('0e3001b38c6f77aaa276deff6276c9bbcb31dd17f32a9d2ee30e806bb4315c6e'
            '73572005ef8eb15be48ea1010d18082b80bfbf8684b78ce64bc3abf11db1f95f'
            '3f7d8be8ef6ecc7167d39b10d66954ec734280b5bdcd57f7d9eafe429d11c22a'
            '10a4011b3d9705b2b0a1f496b33d926d4be21439c63f039b871d93f2d143ed0c'
            '9ab9f761a3fabd278fd05d755fec8a403874f899d7e40347f1da48bf93a67e97'
            '6b6f7a11e781635e015da79cb8828d691073b6ae28f9b08c2065f3f3bd7a9f5f')

prepare() {
  find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +
  mapfile -t _patch_series <debian/patches/series
  cd "$srcdir/WordNet-$_srcver"
  for _patch in "${_patch_series[@]}"; do
    patch -Np1 -i "../debian/patches/$_patch"
  done
  sed -i '/dictzip -n wn.dict/s/ -n//' contrib/wordnet_structures/Makefile*

  #retain makefile(s) and use 3.1 (db)files
  find dict/ -type f ! -name 'Makefile*' -delete
  cp -a $srcdir/dict/. dict/ #upgrade to 3.1
  #3.1 expects frames.vrb rather than verb.FramesText
  mv -f dict/dbfiles/verb.Framestext dict/frames.vrb
  #point to 3.1 grind log file
  sed -i 's/log\.grind\.3\.0/log.grind.3.1/g' dict/Makefile.in

  autoconf -fvi
}

build() {
  cd "$srcdir/WordNet-$_srcver"
  sed 's:/usr/lib/wordnet/wishwn:/usr/bin/wishwn:g' -i src/wnb
  ./configure --prefix=/usr --mandir=/usr/share/man \
    CFLAGS="${CFLAGS} -std=gnu89 -fPIC -DUSE_INTERP_RESULT -Wno-error=format-security" \
    CXXFLAGS="${CXXFLAGS} -fPIC"
  make
}

package_wordnet-dictd() {
  pkgdesc="Wordnet dictd files"
  arch=(any)
  provides=(dict-wn)
  conflicts=(dict-wn)
  license=('GPL-2.0-only' 'LicenseRef-custom')
  install=${pkgname}.install
  cd "${srcdir}/WordNet-${_srcver}"
  install -Dm644 contrib/wordnet_structures/wn.{dict.dz,index} -t "${pkgdir}"/usr/share/dictd/
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
  install -D -m644 contrib/wordnet_structures/COPYING \
    "${pkgdir}/usr/share/licenses/$pkgname/contrib-COPYING"
  
}
package_wordnet-common() {
  depends+=(wordnet-progs wordnet-dictd)
  pkgdesc="An Electronic Lexical Database from Princeton University"
  license=('LicenseRef-custom')
  arch=(any)

  cd "${srcdir}/WordNet-${_srcver}"
  make DESTDIR="$pkgdir" install
  # Replace dictionary files
  cp -ar "${pkgdir}/usr/dict/"* "${pkgdir}/usr/share/wordnet/"
  cp -an "$srcdir/dict/"* "$pkgdir/usr/share/wordnet/" #add 3.1 dict files
  rm -rf "${pkgdir}/usr/dict" #clean this default directory
  rm -rf "${pkgdir}/usr/"{lib,include,bin,dict}
  rm -rf "${pkgdir}/usr/share/man"
  rm -rf "${pkgdir}/usr/share/dictd" #moved to wordnet-dictd
  ln -s /usr/share/wordnet "${pkgdir}/usr/share/wordnet/dict" #support some old scripts
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}
package_wordnet-progs() {
  arch=(i686 x86_64)
  depends=(tcl tk glibc)
  pkgdesc="An Electronic Lexical Database from Princeton University (CLI and GUI tools)"
  license=('LicenseRef-custom')

  cd "${srcdir}/WordNet-${_srcver}"
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}/usr/dict"
  rm -rf "${pkgdir}/usr/share/dictd"
  rm -rf "${pkgdir}/usr/share/wordnet/"*

  mv "${pkgdir}/usr/lib/wnres" "${pkgdir}/usr/share/wordnet/wnres"

  install -D -m644 "${srcdir}/wordnet.desktop" "${pkgdir}/usr/share/applications/wordnet.desktop"
  install -D -m644 "${srcdir}/wordnet.png" "${pkgdir}/usr/share/pixmaps/wordnet.png"

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}
# vim:set ts=2 sw=2 et:
