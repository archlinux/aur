pkgname=flite-unpatched
_pkgname=flite
pkgver=2.2
pkgrel=1
pkgdesc="A lightweight speech synthesis engine (built without Arch linux patches)"
arch=(x86_64)
url="http://www.festvox.org/flite/"
license=(custom)
depends=(alsa-lib)
makedepends=(chrpath)
source=(https://github.com/festvox/flite/archive/v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('ab1555fe5adc3f99f1d4a1a0eb1596d329fd6d74f1464a0097c81f53c0cf9e5c')

prepare() {
  cd $_pkgname-$pkgver
  #sed '/^#VOXES.*$/d; s/+//g; s/cmu_indic_lex/&\nVOXES = cmu_us_kal16 cmu_us_slt/' config/android.lv >config/archlinux.lv
  #sed -i '/$(INSTALL) -m 755 $(BINDIR)\/flite_time $(DESTDIR)$(INSTALLBINDIR)/d' main/Makefile
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --enable-shared
  make
  make get_voices
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

# Fix rpath
  chrpath -d "$pkgdir"/usr/bin/*
}

