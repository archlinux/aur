# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>

_pkgname=flite
pkgname=$_pkgname-cmu-us-rms
pkgver=2.0.0
pkgrel=3
pkgdesc="A lightweight speech synthesis engine (cmu-us-rms library)"
arch=(i686 x86_64)
url="http://cmuflite.org"
license=(custom)
depends=(alsa-lib flite=${pkgver})
source=(http://festvox.org/flite/packed/flite-${pkgver%.*}/flite-$pkgver-release.tar.bz2 flite-ldflags.patch)
md5sums=('645db96ffc296cbb6d37f231cc1cc6b2'
         '937197bf549c92e5ce6dd9f0d3a5cafa')

prepare() {
  cd $_pkgname-$pkgver-release
  sed '/^#VOXES.*$/d; s/+//g; s/cmu_indic_lex/&\nVOXES = cmu_us_kal16 cmu_us_slt/' config/android.lv >config/archlinux.lv
  sed -i '/$(INSTALL) -m 755 $(BINDIR)\/flite_time $(DESTDIR)$(INSTALLBINDIR)/d' main/Makefile

# Fix linking (Gentoo)
  patch -p1 -i ../flite-ldflags.patch
}

build() {
  cd $_pkgname-$pkgver-release
  ./configure --prefix=/usr --enable-shared \
                            --with-audio=alsa \
			    --with-langvox=archlinux 
  make
}

package() {
  cd $_pkgname-$pkgver-release
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/include "$pkgdir"/usr/bin "$pkgdir"/usr/lib/{libflite.*,libflite_cmulex*,libflite_usenglish*}
}
