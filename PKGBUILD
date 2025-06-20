# Maintainer: malacology

pkgname=popart
pkgver=2019.07.15
pkgrel=7
pkgdesc="Full-feature software for haplotype network reconstruction. https://doi.org/10.1111/2041-210X.12410"
arch=('x86_64')
url="https://popart.maths.otago.ac.nz/"
license=('LGPL')
depends=('lpsolve' 'qt6-base' 'hicolor-icon-theme' 'marble-common')
makedepends=('git' 'gendesk' 'suitesparse')
source=("git+https://github.com/jessicawleigh/popart-current.git"
	"5to6.patch::https://github.com/jessicawleigh/popart-current/pull/18.patch")
md5sums=('SKIP'
         'bc4a0bdf908a2dfa43a719ca94084048')
pkgver(){
  cd $srcdir/${pkgname}-current
  printf $(TZ=UTC git log --no-walk --pretty="%cd" --decorate=full --date=format-local:%Y.%m.%d | head -n 1)
}
prepare() {
  cd $srcdir/${pkgname}-current
  patch -p1 < $srcdir/5to6.patch
}
build() {
  cd $srcdir/${pkgname}-current
  qmake6 -makefile LPSOLVEDIR=/usr/bin/lp_solve MARBLEDIR=/usr/bin/marble popart.pro
  make
  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec="$pkgname" --icon="$pkgname.png"
}

package() {
  cd $srcdir/$pkgname-current
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm755 $pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
cd icons
for size in 16 32 64 128 256
do
  install -Dm 644 ${size}x${size}/popart.png $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/popart.png
done
}
