# Maintainer: Jens Staal <staal1978@gmail.com>

_gitname=busybox
pkgname=$_gitname-static-musl-git
pkgver=20151016.13801
pkgrel=1
pkgdesc="Combines common UNIX utilities into a single small executable, statically linked with musl libc"
arch=('i686' 'x86_64')
url="http://www.busybox.net/"
license=('GPL')
provides=("$_gitname")
conflicts=("$_gitname")
makedepends=('git' 'musl' 'kernel-headers-musl') #musl-git also good
source=(git://git.busybox.net/"$_gitname" 'config')
# 'https://raw.github.com/chneukirchen/sabotage/master/KEEP/busybox.patch'
md5sums=(SKIP 'fb3b07db81c75456365414e1f65e6463')

pkgver() {
  cd   "$srcdir"/"$_gitname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cp -ar $srcdir/$_gitname $srcdir/build
  cp     $srcdir/config    $srcdir/build/.config
  cd     $srcdir/build

  CC=musl-gcc                             \
  HOSTCC=gcc                              \
  CFLAGS='-Os -static'                    \
  HOSTCFLAGS='-D_POSIX_C_SOURCE=200112L'  \
  CFLAGS_busybox="-Wl,-z,muldefs"         \
  make
}

package() {
 mkdir   -p    $pkgdir/usr/bin
 install -m755 $srcdir/build/busybox $pkgdir/usr/bin/
}