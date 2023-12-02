# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributor: Stefan Husmann  <stefan.husmann@t-systems.com>
# Contributor: menta

pkgbase=tif22pnm-git
_pkgname=tif22pnm
pkgname=('tif22pnm-git' 'png22pnm-git')
pkgver=r36.22217c1
pkgrel=1
pkgdesc="TIFF to PNM and PNG to PNM converters"
arch=('x86_64')
depends=(
  'libpng'
  'libtiff'
)
makedepends=('git')
url="https://github.com/pts/$_pkgname"
license=('GPL')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  echo "PKGBUILD: running ./configure"
  ./configure --prefix="$pkgdir"/usr

  echo "PKGBUILD: sourcing cc_help.sh"
  source cc_help.sh
  L_CC="$CC -O2 -DNDEBUG"
  L_LD="$LD -s"

  echo "PKGBUILD: compiling tif22pnm"
  OS="ptspnm.o minigimp.o miniglib.o ptstiff3.o tif22pnm.o"
  for C in 'ptspnm.c minigimp.c miniglib.c ptstiff3.c tif22pnm.c'; do
    $L_CC $CPPFLAGS $CFLAGS $CFLAGSB -c $C
  done
  $L_LD $LDFLAGS $OS -o "tif22pnm" $LIBS_TIFF

  echo "PKGBUILD: compiling png22pnm"
  $L_CC $CPPFLAGS $CFLAGS $CFLAGSB -c 'png22pnm.c'
  $L_LD $LDFLAGS 'png22pnm.o' -o "png22pnm" $LIBS_PNG $LIBS_M -lz -lm
}

package_png22pnm-git() {
  cd "$srcdir/$_pkgname"
  depends=('libpng')
  provides=('png22pnm')
  conflicts=('png22pnm')
  install -Dm755 png22pnm "$pkgdir"/usr/bin/png22pnm
}

package_tif22pnm-git() {
  cd "$srcdir/$_pkgname"
  depends=('libtiff')
  provides=('tif22pnm')
  conflicts=('tif22pnm')
  install -Dm644 README "$pkgdir"/usr/share/tif22pnm/README
  install -Dm755 tif22pnm "$pkgdir"/usr/bin/tif22pnm
}
