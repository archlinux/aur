# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=elbow
pkgname=$_pkgname-git
pkgver=r63.b41fd0b
pkgrel=1
pkgdesc="EFL based browser"
arch=('i686' 'x86_64')
url="https://github.com/bunhere/elbow"
license=('LGPL3')
depends=('elementary' 'ewebkit')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://github.com/bunhere/elbow.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i 's|THEME_BUILD_PATH "|"/usr/share/elbow|g' "$srcdir/$_pkgname"/src/{main,webview}.c
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWEBKIT_BACKEND=ewebkit2

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
  
  rm -rf "$pkgdir/themes"
  install -d "$pkgdir/usr/share/elbow/"
  install -m644 data/themes/*.edj "$pkgdir/usr/share/elbow/"
}
