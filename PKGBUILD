# Maintainer: Steven Allen <steven {at} stebalien {dot} com>
# Contributor: Reverie <reverie@takhis.net>

pkgbase=wordnet
pkgname=(wordnet-common wordnet-tk wordnet-cli)
pkgver=3.1
_srcver=3.0
pkgrel=4
arch=('i686' 'x86_64')
url="https://wordnet.princeton.edu/"
license=("custom")
makedepends=('tk')
source=("https://wordnetcode.princeton.edu/${_srcver}/WordNet-${_srcver}.tar.bz2"
        "https://wordnetcode.princeton.edu/wn${pkgver}.dict.tar.gz"
        "https://git.savannah.gnu.org/cgit/guix.git/plain/gnu/packages/patches/wordnet-CVE-2008-2149.patch"
        "https://git.savannah.gnu.org/cgit/guix.git/plain/gnu/packages/patches/wordnet-CVE-2008-3908-pt1.patch"
        "https://git.savannah.gnu.org/cgit/guix.git/plain/gnu/packages/patches/wordnet-CVE-2008-3908-pt2.patch"
        wordnet.desktop
        wordnet.png)
sha256sums=('6c492d0c7b4a40e7674d088191d3aa11f373bb1da60762e098b8ee2dda96ef22'
            '3f7d8be8ef6ecc7167d39b10d66954ec734280b5bdcd57f7d9eafe429d11c22a'
            '668c60fcb8260bfe81cd9eea47c1ab6f62194d121c99ad18f985be8b31966020'
            '77dc51d27fb686443ce93f5adefb69d829f367776ad9fcb3413549883fad3048'
            '70874a9f77d12293990e988d44ab22fec77522cc11c2c6ebb420c7d0ac1a692f'
            '10a4011b3d9705b2b0a1f496b33d926d4be21439c63f039b871d93f2d143ed0c'
            '9ab9f761a3fabd278fd05d755fec8a403874f899d7e40347f1da48bf93a67e97')


prepare() {
  cd "$srcdir/WordNet-$_srcver"
  patch -Np1 -i ../wordnet-CVE-2008-2149.patch
  patch -Np1 -i ../wordnet-CVE-2008-3908-pt1.patch
  patch -Np1 -i ../wordnet-CVE-2008-3908-pt2.patch
}

build() {
  cd "$srcdir/WordNet-$_srcver"
  ./configure --prefix=/usr --mandir=/usr/share/man \
              CFLAGS="${CFLAGS} -fPIC -DUSE_INTERP_RESULT -Wno-error=format-security" \
              CXXFLAGS="${CXXFLAGS} -fPIC"
  sed 's:#define DEFAULTPATH "/usr/dict":#define DEFAULTPATH "/usr/share/wordnet/dict":' -i config.h
  sed 's:"/usr/local/WordNet-3.0/lib/wnres":"/usr/share/wordnet/wnres":' -i src/wnb
  make
}

package_wordnet-common() {
  pkgdesc="An Electronic Lexical Database from Princeton University"
  conflicts=('wordnet')

  cd "${srcdir}/WordNet-${_srcver}"
  make DESTDIR="$pkgdir" install

  # Remove "binary" stuff.
  rm -f "${pkgdir}/usr/doc/"{html/*.1WN.html,pdf/*.1.pdf,ps/*.1.ps}
  rm -fr "${pkgdir}/usr/share/man/man1"
  rm -fr "${pkgdir}/usr/bin"

  # Move the documentation into place.
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/wordnet"
  mv "${pkgdir}/usr/lib/wnres" "${pkgdir}/usr/share/wordnet/wnres"

  # Remove TK library stuff.
  rm -fr "${pkgdir}/usr/include/tk"

  # Replace dictionary files
  cp -a "${srcdir}/dict/" "${pkgdir}/usr/share/wordnet/dict"
  chmod -R u=rwX,go=rX "${pkgdir}/usr/share/wordnet/dict"
  rm -fr "${pkgdir}/usr/dict"

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}

package_wordnet-tk() {
  pkgdesc="A TK frontend for the WordNet Database"
  depends=('tk')
  conflicts=('wordnet')
  depends=('wordnet-common')

  cd "${srcdir}/WordNet-${_srcver}"

  # Install the GUI.
  install -D -m755 -t "${pkgdir}/usr/bin/" src/{wnb,wishwn}
  install -D -m644 -t "${pkgdir}/usr/share/wordnet/html/" doc/html/wnb.1WN.html
  install -D -m644 -t "${pkgdir}/usr/share/wordnet/pdf/" doc/pdf/wnb.1.pdf
  install -D -m644 -t "${pkgdir}/usr/share/wordnet/ps/" doc/ps/wnb.1.ps
  install -D -m644 -t "${pkgdir}/usr/share/man/man1/" doc/man/wnb.1

  install -D -m644 "${srcdir}/wordnet.desktop" "${pkgdir}/usr/share/applications/wordnet.desktop"
  install -D -m644 "${srcdir}/wordnet.png" "${pkgdir}/usr/share/pixmaps/wordnet.png"
}

package_wordnet-cli() {
  pkgdesc="A CLI fontend for the WordNet Database"
  provides=('wordnet')
  conflicts=('wordnet')
  depends=('wordnet-common')

  cd "${srcdir}/WordNet-${_srcver}"

  # Install the CLI.
  install -D -m755 -t "${pkgdir}/usr/bin/" src/wn
  install -D -m644 -t "${pkgdir}/usr/share/wordnet/html/" doc/html/wn.1WN.html
  install -D -m644 -t "${pkgdir}/usr/share/wordnet/pdf/" doc/pdf/wn.1.pdf
  install -D -m644 -t "${pkgdir}/usr/share/wordnet/ps/" doc/ps/wn.1.ps
  install -D -m644 -t "${pkgdir}/usr/share/man/man1/" doc/man/wn.1
}
