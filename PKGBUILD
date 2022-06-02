# Maintainer: Austin Anderson <austin@angerson.org>
_xsnowver=1.42
_pkgname=xsnow-comp-patch
pkgname=$_pkgname-git
pkgver=16
pkgrel=2
pkgdesc="Compositor-friendly patch for Xsnow"
arch=('i686' 'x86_64')
url="https://github.com/protractorninja/$_pkgname"
license=('MIT' 'custom')
depends=('libxpm')
makedepends=('git' 'imake')
provides=('xsnow')
conflicts=('xsnow')
options=()
source=("git+https://github.com/protractorninja/$_pkgname.git" "http://janswaal.home.xs4all.nl/Xsnow/xsnow-$_xsnowver.tar.gz")
md5sums=('SKIP'
         '451d8fc0a2b5393b428faa496a556036')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
}

prepare() {
  cd "$srcdir/xsnow-$_xsnowver"
  rm -f PATCH_LICENSE
  patch -p1 -i "$srcdir/xsnow-comp-patch/xsnow-comp.patch"
}

build() {
  cd "$srcdir/xsnow-$_xsnowver"

  sed -n '/Copyright$/,/ facilitate this./p' README > XSNOW_LICENSE
  xmkmf
  make depend
  make
}

package() {
  cd "$srcdir/xsnow-$_xsnowver"

  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install.man
  install -D -m644 XSNOW_LICENSE $pkgdir/usr/share/licenses/$pkgname/XSNOW_LICENSE
  install -D -m644 PATCH_LICENSE $pkgdir/usr/share/licenses/$pkgname/PATCH_LICENSE
}
