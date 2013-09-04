# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: meklu <meklu at meklu dot org>
# Contributor: Samsagax <samsagax at gmail dot com>
# Contributor: Swift Geek <swiftgeek+spam@gmail.com>

pkgname=entrance-git
_pkgname=${pkgname%-*}
pkgver=0.0.4.30.e51ff8c
pkgrel=1
pkgdesc="Enlightenment Display Manager"
url="http://www.enlightenment.org/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('elementary')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/misc/$_pkgname.git"
        'entrance-pam'
        'entrance.service')
md5sums=('SKIP'
         '9a76cae5b3a0fcbb6116fa08c7a587b5'
         '257ac00eb2fe4c6b7578094ff1a90a0d')

pkgver() {
  cd "$srcdir/$_pkgname"

  local _ver=$(awk -F , '/^AC_INIT/ {print $2}' configure.ac | tr -d '[ ]')

  echo $_ver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build () {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
	--prefix=/usr \
	--sbindir=/usr/bin \
	--sysconfdir=/etc \
	--disable-grub2

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install pam file
  install -Dm644 "$srcdir/entrance-pam" "$pkgdir/etc/pam.d/entrance"

# install systemd files
  install -Dm644 "$srcdir/entrance.service" "$pkgdir/usr/lib/systemd/system/entrance.service"

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
}
