# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=libreoffice-online
pkgver=5.4.2.2
pkgrel=1
pkgdesc="HTML5-based/cloud-based version of the office suite"
arch=('x86_64')
url="https://cgit.freedesktop.org/libreoffice/online/"
license=("MPL")
makedepends=("cppunit" "poco" "libreoffice-fresh-sdk>=5.4" "jake" "npm" "chrpath" "python-polib")
depends=("libpng12" "poco" "pcre" "cpio" "libreoffice" "openssl-1.0")
backup=("etc/libreoffice-online/loolwsd.xml")
install="libreoffice-online.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LibreOffice/online/archive/libreoffice-${pkgver}.tar.gz"
	"loolwsd.service"
	"build-fix.patch"
	"hack-annoying-errors.patch")
sha512sums=('0f49884e5e7ddea9cf1c97565f38e50b790da5c81486580dd77556995f6078be25c981b1496dcf488482bedbfe0fcffed9d45f52bb51e51f67f4527842025d47'
            '4a809d8420f42eef99a831b32c94d9ce336b5aa5ccac3c44b99346b94e9d7a6ae8b4e06760057f20e844837c3ab2175146bef63ba99e1a50d016a890704cc2c9'
            '049036898f59f1a7f18c6f186042b7ecee84b010256c813c633e0854b206b1b94343972cc8a374990eb22919a223429de4db712f70a89851f266e6500b67c2b1'
            '530dad9becee9504d1e2fff5c7e5115daf62ac48312c5cf42f9b44dc0f21665a05f5788606d988f631d3b6dc4dfcf866d564ac1f8bf087c4efe3c197b3206f2d')

prepare() {
  cd "${srcdir}/online-libreoffice-${pkgver}"
  patch -p1 <"$srcdir"/build-fix.patch
  patch -p1 <"$srcdir"/hack-annoying-errors.patch
}

build() {
  cd "${srcdir}/online-libreoffice-${pkgver}"
  ./autogen.sh
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  CPPFLAGS="-I/usr/include/openssl-1.0 -Wno-implicit-fallthrough -Wno-format-truncation" \
  CFLAGS="-I/usr/include/openssl-1.0" \
  LDFLAGS="-L/usr/lib/openssl-1.0" \
      ./configure --enable-silent-rules \
	--with-lokit-path=/usr/include/libreoffice \
	--with-lo-path=/usr/lib/libreoffice \
	--prefix=/usr \
	--sysconfdir=/etc
  BUILDING_FROM_RPMBUILD=yes make
}

package() {
  cd "${srcdir}/online-libreoffice-${pkgver}"
  BUILDING_FROM_RPMBUILD=yes make DESTDIR=${pkgdir} install
  install -Dm644 "${srcdir}/loolwsd.service" "${pkgdir}/usr/lib/systemd/system/loolwsd.service"
  mkdir -p "${pkgdir}/var/lib/lool"
  mkdir -p "${pkgdir}/var/cache/libreoffice-online"
  mkdir -p "${pkgdir}/var/lib/lool/child-roots"
  chmod u+w "${pkgdir}/var/lib/lool/child-roots"
  sed -i 's|/usr/var/cache/libreoffice-online|/var/cache/libreoffice-online|g' ${pkgdir}/etc/libreoffice-online/loolwsd.xml
  mkdir -p "${pkgdir}/usr/share/libreoffice-online/loleaflet"
  cp -r "loleaflet/dist" "${pkgdir}/usr/share/libreoffice-online/loleaflet/"
  chrpath -d "$pkgdir/usr/bin/"{loolmount,loolforkit}
}
