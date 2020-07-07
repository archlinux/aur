# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xdialog
pkgver=2.3.1
pkgrel=9
pkgdesc="A drop-in replacement for the 'dialog' or 'cdialog' programs"
url="http://xdialog.dyns.net/"
arch=('x86_64')
depends=('gtk2')
license=('GPL')
source=("http://xdialog.free.fr/Xdialog-${pkgver}.tar.bz2"
	"xdialog-2.3.1-gtk2.patch")
sha512sums=('2a0f6e15297ae3ef54a41da1b1fe2ef376d28757d47433df2b8e9918cd4f95871a630b94ec544bd848e518df7f86934030a71bf0371a1466286bf7d912335525'
            'e1a1d4e93946f89a9f4d2a619fcb0069cd5e6ec1b0c3a3ebcd87b1b601c07a7941ad1edeb1cbe89f22f993667c4431c496a6c9b35a13fd9e7d1b8dbd89546694')

build() {
  cd "$srcdir"/Xdialog-$pkgver
  patch -p1 <../xdialog-$pkgver-gtk2.patch
  ./configure --prefix=/usr \
    --mandir="$pkgdir"/usr/share/man --with-gtk2
  # Fix bugs in automake - see Xdialog.spec
  sed -i -e "s:RANLIB = @RANLIB@:RANLIB = /usr/bin/ranlib:" lib/Makefile
  sed -i -e "s;XGETTEXT = :;XGETTEXT = /usr/bin/xgettext;" po/Makefile
  make
}

package() {
  cd "$srcdir"/Xdialog-${pkgver}
  make prefix="$pkgdir"/usr install
}
