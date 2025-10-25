# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xdialog
pkgver=2.3.1
pkgrel=10
pkgdesc="A drop-in replacement for the 'dialog' or 'cdialog' programs"
url="http://xdialog.free.fr/"
arch=('x86_64')
depends=('gtk2')
license=('GPL')
source=("http://xdialog.free.fr/Xdialog-${pkgver}.tar.bz2"
	"xdialog-2.3.1-gtk2.patch"
        "Xdialog-2.3.1-compilation.patch")
sha512sums=('2a0f6e15297ae3ef54a41da1b1fe2ef376d28757d47433df2b8e9918cd4f95871a630b94ec544bd848e518df7f86934030a71bf0371a1466286bf7d912335525'
            '3dd571b61a70a7215096c0973e9ba88a26d38e0f93e9149c9a386c7d2dee96a3539f27b3654e701b3fb496f245313e6a1ad6e67f95a142b76ede60f054c50ab5'
            '034b50d9f90e8e47392d584cbf87f9cafcea72145a28caa07f7b7a8da65cc6c1b0e33810452c181a1197030902683882ed1f247c41b259129a663204ec020d5b')

build() {
  cd "$srcdir"/Xdialog-$pkgver
  patch -p1 <../xdialog-$pkgver-gtk2.patch
  patch -p1 <../Xdialog-2.3.1-compilation.patch
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
