# Maintainer: alphazo <alphazo NOSPAM gmail.com>
# Contributor: nullren <chopflop NOSPAM gmail.com>
# Contributor: Richard Schwab <mail NOSPAM w.tf-w.tf>

_pkgname="libassuan"
pkgname=libassuan-git
pkgver=2.1.1+1_gfd255da
pkgrel=1
pkgdesc="An IPC library used by some GnuPG related softwareI (git version)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnupg.org/related_software/libassuan"
depends=('libgpg-error')
options=('!libtool')
provides=('libassuan')
conflicts=('libassuan')
install='libassuan.install'

source=('libassuan.install'
        'git://git.gnupg.org/libassuan.git')

sha512sums=('9b01f13a96ea6be9d2e8d42505f1ff862186b889e4d01d1d2eaf25e7642d8e5edcce82d155f15a315aebd3edfba0d544a513d59cf25a43d3c1a1a3e57da2a60c'
            'SKIP')

pkgver() {
        cd "$_pkgname"
	git describe | sed 's|libassuan-||;s|-|+|;s|-|_|'
}

build() {
   cd "$_pkgname"

   # patch things and don't build doc
   sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac
   sed -i '/doc.Makefile/d' configure.ac
   sed -i 's/src doc tests/src tests/' Makefile.am
   autoreconf -fiv --force
   ./configure --prefix=/usr --enable-maintainer-mode
   make
}

check() {
  cd "$_pkgname" 
  make check
}

package() {
  cd "$_pkgname"
  make DESTDIR="${pkgdir}" install
}

