#$Id$
# Maintainer:  Yegor Alexeyev
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=libcap-git
_gitname=libcap
pkgver=2.25
pkgrel=1
pkgdesc='POSIX 1003.1e capabilities'
arch=('i686' 'x86_64')
url='http://sites.google.com/site/fullycapable/'
license=('GPL2')
depends=('glibc' 'attr')
makedepends=('linux-api-headers')
source=("$_gitname::git://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git")
md5sums=('SKIP')
conflicts=('libcap')

prepare() {
  cd "$srcdir/$_gitname"
  sed -i "/SBINDIR/s#sbin#bin#" Make.Rules
}

build() {
  make -C $srcdir/$_gitname KERNEL_HEADERS=/usr/include
}

package() {
  cd "$srcdir/$_gitname"
  make prefix=/usr lib=/lib DESTDIR="$pkgdir" RAISE_SETFCAP=no install

  install -Dm644 pam_cap/capability.conf \
    "$pkgdir"/usr/share/doc/$pkgname/capability.conf.example
}
