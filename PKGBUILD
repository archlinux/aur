# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>

pkgname=noteedit
pkgver=2.8.1
pkgrel=5
pkgdesc="A free music score editor for Linux."
arch=('i686' 'x86_64')
depends=('tse3' 'kdelibs3')
install=noteedit.install
license=('GPL')
url="http://noteedit.berlios.de/"
options=('!libtool' '!strip')
source=("http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz" \
	http://ftp.de.debian.org/debian/pool/main/n/noteedit/noteedit_2.8.1-3.diff.gz)
md5sums=('653985c131afce45f0aa401fe4930909'
         '52047ea2e7b4d7f7fcc77fbf338ef089')

#
# Remove KDE4 before building or patch PKGBUILD/noteedit build
# because it mess kde3 and kde4 libs.
#
build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 <../noteedit_2.8.1-3.diff

  ./configure --prefix=/usr --enable-debug --without-arts
  sed -i 's/kapp.h/kapplication.h/' noteedit/main.cpp
  sed -i -e 's#noteedit_LDFLAGS = $(KDE_RPATH)#noteedit_LDFLAGS = $(KDE_RPATH) -L/opt/kde/lib -L/opt/qt/lib -lkparts -lkdeui -lkdecore -lqt-mt#;' \
         -e 's/^KDE_CXXFLAGS = $/KDE_CXXFLAGS = $(USE_EXCEPTIONS) -fpermissive/;' \
         -e 's/-R \$(x_libraries)//' noteedit/Makefile
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
