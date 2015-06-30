# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

pkgname=icu-staticlibs
pkgver=55.1
pkgrel=1
pkgdesc="International Components for Unicode library with staticlibs enabled"
arch=(i686 x86_64)
url="http://www.icu-project.org/"
license=('custom:icu')
depends=('gcc-libs>=4.7.1-5' 'sh')
options=(staticlibs)
#makedepends=('clang')
source=(#http://download.icu-project.org/files/icu4c/${pkgver}/icu4c-${pkgver/./_}-src.tgz
	    http://download.icu-project.org/files/icu4c/${pkgver}/icu4c-${pkgver//./_}-src.tgz
	    icu.8198.revert.icu5431.patch)
md5sums=('e2d523df79d6cb7855c2fbe284f4db29'
         'ebd5470fc969c75e52baf4af94a9ee82')

prepare() {
  cd icu/source
  # fix Malayalam encoding https://bugzilla.redhat.com/show_bug.cgi?id=654200
  patch -Rp3 -i ${srcdir}/icu.8198.revert.icu5431.patch
}

build() {
  cd icu/source
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man \
	--sbindir=/usr/bin \
	--enable-static
  make
}

check() {
  cd icu/source
  make -k check # passes all
}

package() {
  cd icu/source
  make -j1 DESTDIR=${pkgdir} install

  # Install license
  install -Dm644 ${srcdir}/icu/license.html ${pkgdir}/usr/share/licenses/icu/license.html
}
