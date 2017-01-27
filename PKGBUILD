# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=libreoffice-online-git
pkgver=2.0.branch.point.r484.g545e2a2a
pkgrel=1
pkgdesc="HTML5-based/cloud-based version of the office suite"
arch=("x86_64")
url="https://cgit.freedesktop.org/libreoffice/online/"
license=("MPL")
makedepends=("cppunit" "poco" "libreoffice")
depends=("libpng12" "poco" "pcre" "cpio")
backup=("etc/loolwsd/loolwsd.xml")
provides=('libreoffice-online')
conflicts=('libreoffice-online')
install="libreoffice-online.install"

source=("git+git://gerrit.libreoffice.org/core.git"
	"git+git://gerrit.libreoffice.org/online.git"
	"loolwsd.service")
sha512sums=('SKIP'
	    'SKIP'
	    '71fd3aec864b1f084dafc602a7fadc91fed146b57dba8cacc7bc277a42f197616a6a43c07d13e2e74a604166cd691a81f5c7de447ddecb680919e3f6b451adb6')

pkgver() {
  cd "online"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/collabora.online.//g'
}

build() {
  cd "${srcdir}/online"
  ./autogen.sh
  ./configure --enable-silent-rules \
	--with-lokit-path=${srcdir}/core/include \
	--with-lo-path=/usr/lib/libreoffice \
	--prefix=/usr \
	--sysconfdir=/etc
  #./configure --enable-silent-rules --with-lokit-path=/usr/include/libreoffice --with-lo-path=/usr/lib/libreoffice
  BUILDING_FROM_RPMBUILD=yes make
}

package() {
  cd "${srcdir}/online"
  BUILDING_FROM_RPMBUILD=yes make DESTDIR=${pkgdir} install
  install -Dm644 "${srcdir}/loolwsd.service" "${pkgdir}/usr/lib/systemd/system/loolwsd.service"
  #mv ${pkgdir}/bin ${pkgdir}/share ${pkgdir}/usr/
  mkdir -p "${pkgdir}/var/lib/lool"
  mkdir -p "${pkgdir}/var/cache/loolwsd"
  mkdir -p "${pkgdir}/var/lib/lool/child-roots"
  chmod u+w "${pkgdir}/var/lib/lool/child-roots"
  sed -i 's|/usr/var/cache/loolwsd|/var/cache/loolwsd|g' ${pkgdir}/etc/loolwsd/loolwsd.xml
}
