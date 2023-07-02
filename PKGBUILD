# Maintainer: malacology

pkgname=popart
pkgver=2019.07.15
pkgrel=4
pkgdesc="Full-feature software for haplotype network reconstruction. https://doi.org/10.1111/2041-210X.12410"
arch=('x86_64')
url="https://popart.maths.otago.ac.nz/"
license=('LGPL')
depends=('lpsolve' 'qt5-base' 'hicolor-icon-theme' 'marble')
makedepends=('git' 'gendesk' 'suitesparse')
source=("git+https://github.com/jessicawleigh/popart-current.git")
md5sums=('SKIP')
pkgver(){
  cd $srcdir/${pkgname}-current
  printf $(TZ=UTC git log --no-walk --pretty="%cd" --decorate=full --date=format-local:%Y.%m.%d | head -n 1)
}
build() {
  cd $srcdir/${pkgname}-current
  qmake -makefile LPSOLVEDIR=/usr/bin/lp_solve MARBLEDIR=/usr/bin/marble popart.pro
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
  install -Dm 644 ${size}x${size}/popart.png $pkgdir/usr/share/icons/hicolor/${size}x${size}/popart.png
done
}
