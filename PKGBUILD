# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatmkfn-git
pkgver=r118.dfde766
pkgrel=1
epoch=
pkgdesc="Generate font descriptions for neatroff"
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('ISC')
groups=()
depends=('gsfonts-type1')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('neatmkfn')
conflicts=('neatmkfn')
replaces=('mktrfn')
backup=()
options=()
changelog=
install=
source=("$pkgname::git://repo.or.cz/neatmkfn.git")
noextract=()
md5sums=('SKIP')

## Ghostscript Fonts Location:
FP="/usr/share/fonts/Type1/"

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make all
  ## Generate fonts descriptions for neatroff:
  mkdir fonts
  ./gen.sh $FP fonts
  sed -i 's|./mkfn|neatmkfn|g' gen.sh
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 mkfn $pkgdir/usr/bin/neatmkfn
  install -Dm644 gen.sh $pkgdir/usr/share/doc/${pkgname%-*}/gen.sh
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  mkdir -p $pkgdir/usr/share/neatroff/font/devutf/
  cp $srcdir/$pkgname/fonts/* $pkgdir/usr/share/neatroff/font/devutf/
}

