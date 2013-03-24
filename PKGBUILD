# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: meklu <meklu at meklu dot org>
# Contributor: Samsagax <samsagax at gmail dot com>
# Contributor: Swift Geek <swiftgeek+spam@gmail.com>

pkgname=entrance-git
_pkgname=entrance
pkgver=0.0.4.x
pkgrel=1
pkgdesc="Enlightenment Display Manager"
url="http://trac.enlightenment.org/e"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('elementary')
makedepends=('git')
conflicts=('entrance-svn')
options=('debug')
source=("git://git.enlightenment.org/misc/$_pkgname.git"
        'entrance-pam'
        'entrance.service')
md5sums=('SKIP'
         '9a76cae5b3a0fcbb6116fa08c7a587b5'
         '8c6ff8570c3d689fda99e018e5428a67')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(grep -m 1 AC_INIT configure.ac | awk -F , '{print $2}' | tr -d '[ ]').$(git rev-list --count HEAD)
}

build () {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
	--prefix=/usr \
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
