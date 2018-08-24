# Maintainer: aksr <aksr at t-com dot me>
pkgname=nawk-git
pkgver=20180823.r9.0f4e1ba
pkgrel=2
epoch=
pkgdesc='The version of awk described in "The AWK Programming Language".'
arch=('i686' 'x86_64')
url="https://github.com/onetrueawk/awk"
license=('MIT')
groups=()
depends=(glibc)
makedepends=(git)
optdepends=()
checkdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=('!makeflags')
changelog=
install=
source=("$pkgname::git+$url" manpage-naming.patch)
noextract=()
md5sums=('SKIP' 'f79cfc163176b6b06891f4dbeadc218f')
sha1sums=('SKIP' 'a729df9321d409402c023937260e5627fa72f811')
sha256sums=('SKIP' '5f0e0e737626b5060559a1a97dfc191875d6b2f784aa4fe2256add03d38f968b')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(grep '*version' main.c | sed 's/.*version //;s/";//')" \
                     "$(git rev-list --count HEAD)" \
                     "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 awk.1 ../manpage-naming.patch
}

build() {
  cd "$srcdir/$pkgname"
  make "CPPFLAGS=-DHAS_ISBLANK $CPPFLAGS" "LDFLAGS=$LDFLAGS" "CFLAGS=$CFLAGS"
}

check() {
  cd "$srcdir/$pkgname"
  ./REGRESS
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 a.out "$pkgdir/usr/bin/nawk"
  install -Dm644 awk.1 "$pkgdir/usr/share/man/man1/nawk.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nawk/LICENSE"
}

