
# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=gconf-editor
pkgver=3.0.1
pkgrel=5
pkgdesc="Graphical gconf registry editor"
arch=(x86_64)
license=('GPL')
depends=('gconf' 'gtk3')
makedepends=('pkgconfig' 'intltool' 'gnome-doc-utils')
url="https://www.gnome.org"
options=(!emptydirs)
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2
        fix-assertion-failed-crash.patch)
sha256sums=('9afc4fc0d0afe019998736f06c04cbfa0393c813e2aa755133d95e83835f8869'
            '6550714ee06d09632244d0f4f41402224599f5230ef71376ea34291ce0d651bc')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../fix-assertion-failed-crash.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
     --localstatedir=/var --disable-scrollkeeper
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}"/usr/share/gconf/schemas
  gconf-merge-schema "${pkgdir}"/usr/share/gconf/schemas/$pkgname.schemas --domain gconf-editor "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas
}
