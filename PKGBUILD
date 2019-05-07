# Maintainer: Térence Clastres <t.clastres@gmail.com>
# Maintainer: Robin Broda <robin@broda.me>
# Contributor: X0rg
# Contributor: marlock <marlock87@hotmail.com>
# Contributor: Diogo Leal <estranho@diogoleal.com>

pkgname=psensor-git
pkgver=v1.2.0.r70.gd9832db
pkgrel=1
pkgdesc='A graphical hardware temperature monitor for Linux'
arch=('x86_64')
url='https://gitlab.com/jeanfi/psensor'
license=('GPL2')
depends=('lm_sensors' 'dconf' 'gtk3' 'udisks2' 'curl' 'libgtop' 'libnotify'
         'libxnvctrl' 'json-c' 'libmicrohttpd')
makedepends=('help2man')
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git"
        'is_error.patch')
sha512sums=('SKIP'
            'fa1f0a8cdbd75fba2ad980a5beb1807e533ef12154db1f0cc97c9130080584cb0251e29a56068b0400f152e540f326a7b16749bf11b1e844d1d519d7bb0e71ed')


pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  patch -Np1 -i "${srcdir}/is_error.patch"
}

build() {
  cd "$pkgname"

  autoreconf -i

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="${pkgdir}/" install
}
