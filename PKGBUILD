# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>
# vim: set ts=2 tw=2 sts=2 et ft=sh :

pkgname='poppler-minimal'
pkgver=0.26.4
pkgrel=1
arch=(i686 x86_64)
license=('GPL')
makedepends=('icu')
options=('!libtool' '!emptydirs')
pkgdesc="PDF rendering library based on xpdf 3.0 (minimal non-X version)"
depends=('fontconfig' 'gcc-libs')
conflicts=("poppler")
provides=("poppler")
url="http://poppler.freedesktop.org/"
source=(http://poppler.freedesktop.org/poppler-${pkgver}.tar.xz)
sha1sums=('26ff3310cb4866829030c73070df4ae9aa4f6cac')

build() {
  cd "${srcdir}/poppler-${pkgver}"

  sed -i -e '/AC_PATH_XTRA/d' configure.ac
  sed -i "s:AM_CONFIG_HEADER:AC_CONFIG_HEADERS:" configure.ac
  autoreconf -fi

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --without-x \
      --disable-splash-output \
      --disable-poppler-cpp \
      --disable-libpng \
      --enable-cms=none \
      --disable-cairo-output
  make
}

package() {
  cd "${srcdir}/poppler-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
