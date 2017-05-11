# Maintainer:
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Justin van der Westhuizen <justin@giftsinc.co.za>

pkgname=qtchooser
pkgver=53
pkgrel=2
pkgdesc='Wrap the other Qt tools by searching for different instances of Qt on the system'
arch=('i686' 'x86_64')
url='http://code.qt.io/cgit/qt/qtchooser.git/'
license=('GPL')
backup=('etc/xdg/qtchooser/default.conf')
depends=('gcc-libs')
makedepends=('git')
source=("git://code.qt.io/qtsdk/qtchooser.git"
        {4,5}.conf)
md5sums=('SKIP'
         'aa4d49b269e1b806f5eea170801f0aa6'
         '3495288187be53396fe88fa5801b82c5')

pkgver() {
  cd $pkgname
  echo $(git rev-list --count HEAD)
}

prepare() {
  cd $pkgname
  sed -e 's|bindir = $(prefix)/bin|bindir = $(prefix)/lib/qtchooser|' -i Makefile -i src/qtchooser/Makefile
}

build() {
  cd $pkgname
  bindir=/usr/lib/qtchooser/ make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install

  install -d "$pkgdir"/etc/xdg/qtchooser
  install -m644 "$srcdir"/{4,5}.conf \
    "$pkgdir"/etc/xdg/qtchooser/

  # Set the default Qt
  ln -s /etc/xdg/qtchooser/5.conf \
    "$pkgdir"/etc/xdg/qtchooser/default.conf
}
