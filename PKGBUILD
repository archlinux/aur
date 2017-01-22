# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=libreoffice-online
pkgver=2.0.2
pkgrel=2
pkgdesc="HTML5-based/cloud-based version of the office suite"
arch=("x86_64")
url="https://cgit.freedesktop.org/libreoffice/online/"
license=("MPL")
makedepends=("cppunit" "poco" "libreoffice")
depends=("libpng12" "poco" "pcre")
install="libreoffice-online.install"

source=("git+https://github.com/LibreOffice/core.git"
	"${pkgname}-${pkgver}-3.tar.gz::https://github.com/LibreOffice/online/archive/${pkgver}-3.tar.gz"
	"loolwsd.service")
sha512sums=('SKIP'
	    'a0c2084fbd14b01a344ca4a8839ac75ea3c9e35d05a2dea8a2f93d98c6ff22f891367069c8c9fe4a48ee1ffd17ff6ddf15ac61e4cafbc9e1ef0aff32963cb5ff'
	    '71fd3aec864b1f084dafc602a7fadc91fed146b57dba8cacc7bc277a42f197616a6a43c07d13e2e74a604166cd691a81f5c7de447ddecb680919e3f6b451adb6')

build() {
  cd "${srcdir}/online-${pkgver}-3"
  ./autogen.sh
  ./configure --enable-silent-rules \
	--with-lokit-path=${srcdir}/core/include \
	--with-lo-path=/usr/lib/libreoffice \
	--prefix=/
  #./configure --enable-silent-rules --with-lokit-path=/usr/include/libreoffice --with-lo-path=/usr/lib/libreoffice
  BUILDING_FROM_RPMBUILD=yes make
}

package() {
  cd "${srcdir}/online-${pkgver}-3"
  BUILDING_FROM_RPMBUILD=yes make DESTDIR=${pkgdir} install
  install -Dm644 "${srcdir}/loolwsd.service" "${pkgdir}/usr/lib/systemd/system/loolwsd.service"
  mv ${pkgdir}/bin ${pkgdir}/share ${pkgdir}/usr/
  mkdir -p "${pkgdir}/var/lib/lool"
  mkdir -p "${pkgdir}/var/cache/loolwsd"
  mkdir -p "${pkgdir}/var/lib/lool/child-roots"
  cp -r systemplate "${pkgdir}/var/lib/lool"
}
