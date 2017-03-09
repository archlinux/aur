# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=libreoffice-online-git
pkgver=2.0.branch.point.r620.gaf3a9110
pkgrel=2
pkgdesc="HTML5-based/cloud-based version of the office suite"
arch=('x86_64' 'i686')
url="https://cgit.freedesktop.org/libreoffice/online/"
license=("MPL")
makedepends=("cppunit" "poco" "libreoffice-fresh-sdk" "jake" "npm" "chrpath")
depends=("libpng12" "poco" "pcre" "cpio" "libreoffice")
backup=("etc/loolwsd/loolwsd.xml")
provides=('libreoffice-online')
conflicts=('libreoffice-online')
install="libreoffice-online.install"

source=("git+git://gerrit.libreoffice.org/online.git"
	"loolwsd.service"
	"git-fixes.patch")
sha512sums=('SKIP'
	    '71fd3aec864b1f084dafc602a7fadc91fed146b57dba8cacc7bc277a42f197616a6a43c07d13e2e74a604166cd691a81f5c7de447ddecb680919e3f6b451adb6'
	    'abb8f72a19baa4c10e0bcf97f4a037d24bd6dfe1bbc49af18f800d6a7ccbefddd02a27a3a8ce60f0a79f7f882a5ffc63c01102307b78cf1a0466f428dd469fb4')

pkgver() {
  cd "online"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/collabora.online.//g'
}

prepare() {
  cd "${srcdir}/online"
  patch -p0 -i "${srcdir}/git-fixes.patch"
}

build() {
  cd "${srcdir}/online"
  ./autogen.sh
  ./configure --enable-silent-rules \
	--with-lokit-path=/usr/include/libreoffice \
	--with-lo-path=/usr/lib/libreoffice \
	--prefix=/usr \
	--sysconfdir=/etc
  BUILDING_FROM_RPMBUILD=yes make
  cd loleaflet
  make
}

package() {
  cd "${srcdir}/online"
  BUILDING_FROM_RPMBUILD=yes make DESTDIR=${pkgdir} install
  install -Dm644 "${srcdir}/loolwsd.service" "${pkgdir}/usr/lib/systemd/system/loolwsd.service"
  mkdir -p "${pkgdir}/var/lib/lool"
  mkdir -p "${pkgdir}/var/cache/loolwsd"
  mkdir -p "${pkgdir}/var/lib/lool/child-roots"
  chmod u+w "${pkgdir}/var/lib/lool/child-roots"
  sed -i 's|/usr/var/cache/loolwsd|/var/cache/loolwsd|g' ${pkgdir}/etc/loolwsd/loolwsd.xml
  mkdir -p "${pkgdir}/usr/share/loolwsd/loleaflet"
  cp -r "loleaflet/dist" "${pkgdir}/usr/share/loolwsd/loleaflet/"
  chrpath -d "$pkgdir/usr/bin/"{loolmount,loolforkit}
}
