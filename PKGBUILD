# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: meklu <meklu at meklu dot org>
# Contributor: Samsagax <samsagax at gmail dot com>
# Contributor: Swift Geek <swiftgeek+spam@gmail.com>

pkgname=entrance-git
pkgver=20130324
pkgrel=1
pkgdesc="Enlightenment Display Manager"
url="http://trac.enlightenment.org/e"
license=("GPL")
arch=("i686" "x86_64")
depends=('elementary')
makedepends=('git')
conflicts=('entrance-svn')
source=('entrance-pam'
        'entrance.service')
md5sums=('9a76cae5b3a0fcbb6116fa08c7a587b5'
         '8c6ff8570c3d689fda99e018e5428a67')

_gitroot="git://git.enlightenment.org/misc/entrance.git"
_gitname="entrance"

build () {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh \
	--prefix=/usr \
	--sysconfdir=/etc

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

# install pam file
  install -Dm644 "$srcdir/entrance-pam" "$pkgdir/etc/pam.d/entrance"

# install systemd files
  install -Dm644 "$srcdir/entrance.service" "$pkgdir/usr/lib/systemd/system/entrance.service"
}
