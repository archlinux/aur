# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=tap-plugins
pkgver=1.0.1
pkgrel=1
pkgdesc="Tom's LADSPA Plugins"
arch=('x86_64')
url="http://tap-plugins.sourceforge.net/"
license=('GPL2')
groups=('ladspa-plugins' 'pro-audio')
depends=('glibc')
makedepends=('ladspa')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tomszilagyi/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('25f72bba83a5a40d480bc9d4659b64096102281d02e43ad93d5064b0ef7972184db40162d1ef78fd783f431740a4c4d5e03160cdd5f43da3bc1570ff462c863a')
b2sums=('2b8ac9a26197f5c980512d33daf4c604d7bb3046fb40e3826d559d4420921a0e124a5577d53d0896bc92111f69765f714d5f55a9da60546e2e6f29e5c851b2a5')

prepare() {
  cd "${pkgname}-${pkgver}"
  # correct install path and add external LDFLAGS to achieve full RELRO
  sed -e 's|/usr/local/|$(DESTDIR)/usr/|' \
      -e 's/LDFLAGS = /LDFLAGS += /g' \
      -i Makefile
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 {CREDITS,README} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
