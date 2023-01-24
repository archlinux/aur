# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=libuser
pkgver=0.64
pkgrel=1
pkgdesc='A standardized interface for manipulating and administering user and group accounts.'
arch=('x86_64')
license=('LGPL')
url='https://pagure.io/libuser/'
depends=('glib2' 'pam' 'popt' 'python')
makedepends=('autoconf' 'automake' 'gettext' 'libtool')
backup=('etc/libuser.conf')
source=("https://pagure.io/$pkgname/archive/$pkgname-$pkgver/$pkgname-$pkgname-$pkgver.tar.gz")
sha512sums=('7ca7aaa202072694977300b53f528aad562a92188d464e83f79902ee72b707be5eb850ec2c71a51076775b39c5c6f472f86c3578a66d3a92659b0a67b303118b')

prepare() {
  cd $pkgname-$pkgname-$pkgver

  sed -i '/^gtkdocize/ s/^/#/' autogen.sh # comment out `gtkdocize` call
  sed -i '/^SUBDIRS/d' docs/Makefile.am # remove `SUBDIRS` line
  sed -i '/^AC_CONFIG_FILES/ s_docs/reference/Makefile__' configure.ac # remove `docs/reference/Makefile` from `AC_CONFIG_FILES`
}

build() {
  cd $pkgname-$pkgname-$pkgver
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-gtk-doc \
    --disable-gtk-doc-html \
    --disable-rpath
  sed -i 's/SUBDIRS = po docs/SUBDIRS = po/' Makefile
  make
}

package() {
  cd $pkgname-$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
