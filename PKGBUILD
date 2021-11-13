# Maintainer: willemw <willemw12@gmail.com>
# Contributor: NicerSlicer <jans_coid at posteo dot de>
# Contributor: Christian Wieden <wiedenchr at gmail dot com>
# Contributor: Ricardo Band <me at xengi dot de>
# Contributor: Filip Szymański <fszymanski at, fedoraproject.org>

pkgname=hstr-git
pkgver=2.3.r3.g6507ac7
pkgrel=1
pkgdesc="Bash and Zsh shell history suggest box - easily view, navigate, search and manage your command history"
arch=('x86_64')
url="https://github.com/dvorka/hstr"
license=('Apache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -i "s|<ncursesw/curses.h>|<curses.h>|g" $pkgname/src/include/hstr{,_curses}.h
}

build() {
  cd $pkgname/build/tarball
  ./tarball-automake.sh

  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  cd ../..
  ./configure --prefix=/usr
  make
}

package() {
  install -Dm644 $pkgname/{Changelog,README.md} -t "$pkgdir/usr/share/doc/${pkgname%-git}"

  make -C $pkgname DESTDIR="$pkgdir/" install
  rm -f "$pkgdir/usr/bin/hh"
}

