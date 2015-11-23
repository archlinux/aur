pkgname=milter-manager-git
pkgver=20151116.5993.8c24a95
pkgrel=1
pkgdesc="A milter to use milters effectively."
arch=('x86' 'x86_64' 'armv7h')
url="http://milter-manager.sourceforge.net/"
license=('GPL3' 'GFDL' 'LGPL3')
depends=('sh')
makedepends=('git' 'ruby-glib2' 'rrdtool' 'glib2'
             'autoconf' 'automake' 'libtool' 'pkg-config' 'intltool'
             'gtk-doc' 'gnome-doc-utils' 'inkscape' 'ruby' 'libevent')
optdepends=('cutter-test_framework' 'ruby-rdtool' 'lcov')
provides=('libev')
conflicts=('libev')

source=("$pkgname"::"git://github.com/milter-manager/milter-manager.git"
        milter-manager.service)
sha1sums=('SKIP'
          'a2bf48052ba00fdddbf42810ba5ec70cbfd43b9f')

pkgver () {
  _date=`date +"%Y%m%d"`
  cd "${srcdir}/${pkgname}"
  echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
  cd "${srcdir}/${pkgname}"

  ./autogen.sh
  ./configure --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --enable-ruby-milter

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install=milter-manager.install
  make DESTDIR="$pkgdir/" install

  # remove conflicting file
  rm -f "$pkgdir"/usr/include/event.h

  install -Dm644 ../milter-manager.service "$pkgdir"/usr/lib/systemd/system/milter-manager.service
}
