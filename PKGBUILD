# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=xdg-app
pkgver=0.3.5
pkgrel=1
pkgdesc='An application deployment framework for desktop apps'
arch=('i686' 'x86_64')
url='https://github.com/alexlarsson/xdg-app'
license=('GPL2')
depends=('ostree' 'libseccomp')
makedepends=('git')
_libglnxrev='d59a63e'
install='xdg-app.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexlarsson/xdg-app/archive/${pkgver}.tar.gz"
        "git://github.com/GNOME/libglnx.git#commit=${_libglnxrev}")
sha256sums=('3809082acf355de3cbaaa21265b0650a90df1509d6be6e0d0f0047faa3f52327'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  cp -r ../libglnx/* libglnx/
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # remove setuid flag, instead we set CAP_SYSADMIN and CAP_MKNOD in the install script
  chmod -s "$pkgdir/usr/bin/xdg-app-helper"
}

