# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Ray Rashif <schiv [at] archlinux [dot] org>
# Contributor: Max a.k.a. Synthead <synthead [at] gmail [dot] com>
# Contributor: christhemonkey <christhemonkey [at] gmail [dot] com>

pkgname=flowcanvas
pkgver=0.7.1
pkgrel=5
pkgdesc="Gtkmm/Gnomecanvasmm widget for boxes-and-lines style environments"
arch=('i686' 'x86_64')
url="https://drobilla.net/software/flowcanvas.html"
depends=('libgnomecanvasmm' 'graphviz>=2.34')
makedepends=('boost' 'python2')
license=('GPL')
install=$pkgname.install
source=("https://download.drobilla.net/$pkgname-$pkgver.tar.bz2"{,.sig}
        "graphviz-2.30.patch")
sha256sums=('047928d858fd1e9296a9984de7468c86bbe23fc42e286691b8f273541402c596'
            'SKIP'
            'b5c0798ffc3ec9e0f4d6a0dde13a64f78daa7e61c4e221a8045b6acc52b49d98')
b2sums=('e37f557fdd850c35dc70fc7efe71e7d9be5c60a7920fcfdb38fc4a9eb4d1a44639688b50feae4b0f529469cc68e906ea75e0b870a82379212d94e27e4be8abb1'
        'SKIP'
        '432c458685f3bad94f13112aa9e8e06e8b8b92322ed68ef86f45c16eae8bfebb3ef580b00d255329b1ceccee57923583ff3c4f1a5edd46401d43e1116eefb4d9')
validpgpkeys=('38B6B5874F029137653BF39BC6F60E6529727060') # David Robillard <d@drobilla.net>

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # graphviz 2.30 compatibility
  # see http://dev.drobilla.net/ticket/888
  # adapted from FreeBSD patch (just stripped their stuff)
  # potentially unstable (nothing committed by developer yet)
  # may have to incorporate proposed patch for ganv (successor to this lib)
  patch -Np0 -i "$srcdir/graphviz-2.30.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  CXXFLAGS+=' -std=c++11'
  python2 waf configure --prefix=/usr
  python2 waf build $MAKEFLAGS
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 waf install --destdir="$pkgdir"
}
