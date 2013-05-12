# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: meklu <meklu at meklu dot org>
# Contributor: Samsagax <samsagax at gmail dot com>
# Contributor: Swift Geek <swiftgeek+spam@gmail.com>

pkgname=entrance-git
_pkgname=entrance
pkgver=0.0.4.19.7fd0458
pkgrel=2
pkgdesc="Enlightenment Display Manager"
url="http://trac.enlightenment.org/e"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('elementary')
makedepends=('git')
conflicts=('entrance-svn')
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
	--sysconfdir=/etc

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install pam file
  install -Dm644 "$srcdir/entrance-pam" "$pkgdir/etc/pam.d/entrance"

# install systemd files
  install -Dm644 "$srcdir/entrance.service" "$pkgdir/usr/lib/systemd/system/entrance.service"
}
