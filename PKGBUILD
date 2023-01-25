# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=sylpheed
pkgver=3.8.0
pkgrel=1
pkgdesc="Lightweight and user-friendly e-mail client"
arch=(x86_64)
url="https://${pkgname}.sraoss.jp"
license=(GPL)
depends=(compface gpgme gtkspell libnsl)
makedepends=(openssl)
source=(https://${pkgname}.sraoss.jp/${pkgname}/v${pkgver::3}beta/${pkgname}-${pkgver}beta1.tar.bz2{,.asc})
sha512sums=('e84032324aec491e3f41ed39486f87df533ca659202361aec728c99f517bb01506750f826711e4d4cf05f3755987ac40272e97ef22df63c7b8b55b17b47c0c6e'
  'SKIP')
validpgpkeys=('8CF3A5AC417ADE72B0AA4A835024337CC00C2E26') # Hiroyuki Yamamoto <hiro-y@kcn.ne.jp>

prepare() {
  cd ${pkgname}-${pkgver}beta1
  # patch for enchant >= 2.1.3
  # https://www.archlinux.org/todo/enchant-221-rebuild/
  sed -i 's,enchant/,enchant-2/,g' src/compose.c
  sed -i 's/ enchant/ enchant-2/g' configure
}

build() {
  cd ${pkgname}-${pkgver}beta1
  ./configure --prefix=/usr \
    --enable-maintainer-mode \
    --enable-ldap
  make

  # Build Attachment-Tool Plug-in
  cd plugin/attachment_tool && make
}

package() {
  cd ${pkgname}-${pkgver}beta1
  make DESTDIR="$pkgdir/" LDFLAGS+="/usr/lib/enchant-2" install

  # Install Attachment-Tool Plug-in
  cd plugin/attachment_tool
  make DESTDIR="$pkgdir/" install-plugin
}
