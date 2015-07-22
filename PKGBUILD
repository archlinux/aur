# Maintainer: jchamplin <jake.champlin.27@gmail.com>

pkgname=abiword-minimal
pkgver=3.0.1
pkgrel=1
pkgdesc="A fully-featured word processor"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.abisource.com"
makedepends=('boost')
depends=('fribidi' 'wv' 'librsvg' 'enchant' 'desktop-file-utils' 'goffice0.8')
conflicts=('abiword' 'abiword-plugins')
provides=('abiword')
install=abiword-minimal.install
options=('!makeflags' '!libtool')
source=("http://www.abisource.com/downloads/abiword/${pkgver}/source/abiword-${pkgver}.tar.gz"
	abiword-3.0.0-librevenge.patch
        abiword-3.0.0-link-grammar-5.patch
        abiword-3.0.0-link-grammar-5-second.patch
        link-grammar-panic.patch
        aiksaurus-plugin.m4
        gnutls-3.4.0.patch)
sha256sums=('e094f6fbf0afc5c5538b4894888e7c346f8ee8f49c9d24821dd696d0734865c6'
            '77b52a3722096cec3bfbe4fff3802f51b6c9e0ff7aaa30028c29825fd4e6a65f'
            '6d88800f1e16becd69ed93d5f070793a56b9f162f7d886c71756643bcaed7ef5'
            'd2c80da81a339634a7a4ee4cef12f7ee968f2c2a8c2f75533b6713b71f0d61fd'
            '94d1e638f7b85123dc2282d2e59b982bde6ad0dbbe1b6b54351e610c5a0ea578'
            '5f80a2f94f9929cdba9809c5e1a87cd5d537a2518bb879bfb9eab51a71c8dac1'
            'b393e26c19f92901f64d2bae54c86708ea7dd0b647572088a8ac0cd2eec89100')


prepare() {
  cd "${srcdir}/abiword-${pkgver}"

  # fix build with librevenge based import filters
  patch -Np0 -i ../abiword-3.0.0-librevenge.patch

  # Fix build with recent versions of link-grammar
  patch -Np1 -i ../abiword-3.0.0-link-grammar-5.patch
  patch -Np1 -i ../abiword-3.0.0-link-grammar-5-second.patch
  patch -Np0 -i ../link-grammar-panic.patch
  # Fix build with new gnutls 3.4.x
  patch -Np0 -i ../gnutls-3.4.0.patch
  
  # Install missing m4 file
  install -m644 ../aiksaurus-plugin.m4 plugins/aiksaurus/plugin.m4

  # Generate m4 file for configure
  find plugins -name plugin.m4 | xargs cat > plugin-configure.m4

  libtoolize --force
  autoreconf -fi
}

build() {
  cd "${srcdir}/abiword-${pkgver}"
  ./configure --prefix=/usr --enable-clipart --enable-templates \
	      --without-gnomevfs --with-gio --disable-default-plugins \
	      --disable-builtin-plugins --disable-static \
	      --with-psiconv-config=/nothere --with-goffice \
	      --enable-plugins="opendocument openwriter openxml pdf goffice"
  make
}

package() {
  cd "${srcdir}/abiword-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
