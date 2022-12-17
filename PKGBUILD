# Maintainer: aksr <aksr at t-com dot me>
pkgname=nawk-git
pkgver=20221215.r240.5e49ea4
pkgrel=1
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
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(grep '*version' main.c | sed 's/.*version //;s/";//')" \
                     "$(git rev-list --count HEAD)" \
                     "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's/^\.TH AWK/.TH NAWK/;s/awk/nawk/g;s/Awk/Nawk/' awk.1
  sed -i '/^\.CT .*/d;/^\.TF .*/d' awk.1

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

