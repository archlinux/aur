# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Edoardo Morandi <morandidodo at gmail com>

_pkgname=flite
pkgname=$_pkgname-cmu-us-rms
pkgver=2.1
pkgrel=1
pkgdesc="A lightweight speech synthesis engine (cmu-us-rms library)"
arch=(i686 x86_64)
url="http://cmuflite.org"
license=(custom)
depends=(alsa-lib flite=${pkgver})
source=(http://festvox.org/flite/packed/flite-$pkgver/flite-$pkgver-release.tar.bz2 flite-ldflags.patch)
sha256sums=('c73c3f6a2ea764977d6eaf0a287722d1e2066b4697088c552e342c790f3d2b85'
            '5b55b00509cf0c024f01ea5da0472c3028067fae0c8b1d81e06dea438f597468')

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
