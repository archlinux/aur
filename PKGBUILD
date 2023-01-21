# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: joyfulgirl@archlinux.us
# Contributor: nathan owe ndowens04 at gmail dot com

pkgname=cclive
pkgver=0.9.3
pkgrel=29
pkgdesc='Commandline downloader for popular video websites.'
arch=('x86_64')
url='http://cclive.sourceforge.net/'
license=('AGPL3')
depends=('boost-libs' 'pcre' 'curl' 'libquvi' 'glibmm')
makedepends=('boost')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"{,.sig}
        iostream.patch
        reproducible-date.patch
        boost-1.67.patch
        boost.m4) # https://github.com/tsuna/boost.m4
sha512sums=('0d8f6f870e24e2906542c1e02745009597fca2e879261bef7a81e07f8dec016ee200d8a4b37dd0f20b3ad27c12e2445fed1f6a9dc262a6c27e40222048bb5438'
            'SKIP'
            'dc6fb068d153e91c03533830e6d87bb292109e192b9fff7003a23fbe3ab5a786fee52a0f522788b5715511be0de55deed1b4a9b2369ac6d239074ec099e0e893'
            'bb0c71d3e726096c2856392cef10d8b62aa1a67b30171f079bdf7bd03b64d27a32e611633298889311c88929369a40dd7c56b6560afaa8c43578682b4ff55aa8'
            '8897a535aaa7d8acf3eea07f0e172423d59ec7ff051dbfc096661162649b589b23795f326aad7fa6370aad3174ec5b7e2125424d0425cff425f3dfa3ca660c9d'
            'fe459153907224948888dd6cf6d04b780867595e5e70661d50e3fc2976149f716b807c71d5bfed61566b069bddc955838fdcf441ba5110bea9b2bbaac5b99c84')
validpgpkeys=('E220FCFF9EADBA326FD6B23BBF1D59CCAD00BE50')  # Toni Gundogdu

prepare() {
  cd $pkgname-$pkgver

  patch -Np1 -i ../reproducible-date.patch

  # Update boost.m4 to support GCC > 5.1
  cp "$srcdir"/boost.m4 m4/
  autoconf

  patch -Np1 -i ../iostream.patch
  patch -Np1 -i ../boost-1.67.patch
}

build() {
  cd $pkgname-$pkgver

  # glibmm 2.46 uses C++11 features
  CXXFLAGS+=' -std=c++11'

  ./configure --prefix=/usr boost_cv_rpath_link_ldflag="-L/usr/lib"
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
