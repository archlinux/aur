# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=urlview
pkgver=0.9
pkgrel=10
_patchlevel=19
pkgdesc="A curses URL parser for text files"
arch=('i686' 'x86_64' 'armv7h')
url="http://packages.qa.debian.org/u/urlview.html"
license=('GPL')
depends=('bash')
source=(http://ftp.debian.org/debian/pool/main/u/urlview/${pkgname}_$pkgver.orig.tar.gz \
        http://ftp.debian.org/debian/pool/main/u/urlview/${pkgname}_$pkgver-$_patchlevel.diff.gz)
sha256sums=('746ff540ccf601645f500ee7743f443caf987d6380e61e5249fc15f7a455ed42'
            '056883c17756f849fb9235596d274fbc5bc0d944fcc072bdbb13d1e828301585')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver.orig

  patch -Np1 -i "${srcdir}"/${pkgname}_${pkgver}-$_patchlevel.diff
  aclocal
  automake --foreign --ignore-deps --add-missing
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver.orig

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver.orig

  install -d "${pkgdir}"/etc/urlview "${pkgdir}"/usr/share/man/man1
  make prefix="${pkgdir}"/usr mandir="${pkgdir}"/usr/share/man install

  install -Dm755 url_handler.sh "${pkgdir}"/etc/urlview/url_handler.sh
  install -Dm644 sample.urlview "${pkgdir}"/etc/urlview/system.urlview
  install -d "${pkgdir}"/usr/bin
  ln -fs /etc/urlview/url_handler.sh "${pkgdir}"/usr/bin/url_handler.sh
}
