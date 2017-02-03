# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=libreoffice-online
pkgver=2.0.3
pkgrel=1
pkgdesc="HTML5-based/cloud-based version of the office suite"
arch=("x86_64")
url="https://cgit.freedesktop.org/libreoffice/online/"
license=("MPL")
makedepends=("cppunit" "poco" "libreoffice-fresh-sdk")
depends=("libpng12" "poco" "pcre" "cpio" "libreoffice")
backup=("etc/loolwsd/loolwsd.xml")
install="libreoffice-online.install"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LibreOffice/online/archive/${pkgver}.tar.gz"
	"loolwsd.service")
sha512sums=('4658238b6343a6ed1faf221737486fcbcfc9514d0a5d0e4c0df3c875ae6b78b745e4ea57f79b3e2be107b2acde7ace3d87990241205fcaa30c37fd96ec459203'
	    '71fd3aec864b1f084dafc602a7fadc91fed146b57dba8cacc7bc277a42f197616a6a43c07d13e2e74a604166cd691a81f5c7de447ddecb680919e3f6b451adb6')

build() {
  cd "${srcdir}/online-${pkgver}"
  ./autogen.sh
  ./configure --enable-silent-rules \
	--with-lokit-path=/usr/include/libreoffice \
	--with-lo-path=/usr/lib/libreoffice \
	--prefix=/usr \
	--sysconfdir=/etc
  BUILDING_FROM_RPMBUILD=yes make
}

package() {
  cd "${srcdir}/online-${pkgver}"
  BUILDING_FROM_RPMBUILD=yes make DESTDIR=${pkgdir} install
  install -Dm644 "${srcdir}/loolwsd.service" "${pkgdir}/usr/lib/systemd/system/loolwsd.service"
  mkdir -p "${pkgdir}/var/lib/lool"
  mkdir -p "${pkgdir}/var/cache/loolwsd"
  mkdir -p "${pkgdir}/var/lib/lool/child-roots"
  chmod u+w "${pkgdir}/var/lib/lool/child-roots"
  sed -i 's|/usr/var/cache/loolwsd|/var/cache/loolwsd|g' ${pkgdir}/etc/loolwsd/loolwsd.xml
}
