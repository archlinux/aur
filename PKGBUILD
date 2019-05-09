# Maintainer: aksr <aksr at t-com dot me>
pkgname=rc-duff-git
pkgver=r5.41568e6
pkgrel=1
epoch=
pkgdesc="Standalone port of rc shell written by Tom Duff with edit, history and completion support."
arch=('i686' 'x86_64')
url="https://github.com/benavento/rc"
license=('custom')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's!^\(PREFIX=/usr\)/local$!\1!' Make.Linux
  sed -i "s!^TARG=.*!TARG=${pkgname%-*}!" Makefile
  sed -i "s!man1!&/${pkgname%-*}.1!" Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/{bin,lib,share/{man/man1,doc/${pkgname%-*},licenses/${pkgname%-*}}}
  make PREFIX="$pkgdir/usr" install
  install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

