# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Based on: icu-git
# Maintainer: Azat Khuzhin <a3at.mail AT gmail.com>

pkgname=icu-git-static
pkgver=66.1.r137.gea9ce7e34f
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://site.icu-project.org/"
license=('custom:icu')
depends=('glibc' 'sh')
makedepends=('git')
provides=('icu' 'icu-git')
conflicts=('icu' 'icu-git')
source=("git+https://github.com/unicode-org/icu.git")
options=('staticlibs')
sha256sums=('SKIP')


pkgver() {
  cd "icu"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "icu/icu4c/source"

  export CC=gcc CXX=g++
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --enable-static
  make
}

check() {
  cd "icu/icu4c/source"

  make check
}

package() {
  cd "icu/icu4c/source"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/icu/icu4c/LICENSE" "$pkgdir/usr/share/licenses/icu/LICENSE"
}
