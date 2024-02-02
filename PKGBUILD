# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=funnyboat
pkgver=1.5
pkgrel=2
pkgdesc="side scrolling arcade shooter game on a steamboat equipped with a cannon and the ability to jump"
url="http://funnyboat.sourceforge.net/"
arch=(any)
license=('custom')
makedepends=('gendesk')
depends=(
  'python-pygame'
)
source=("https://sourceforge.net/projects/funnyboat/files/funnyboat/${pkgver}/funnyboat-${pkgver}-src.zip/download"
        "avoid_set_alpha_crash.patch"
        "fullscreen.patch"
        "funnyboat-cursor-patch.patch"
        "python3.patch"
        "save-sshot-in-homedir.patch"
        "screenshot_to_homedir.patch"
        "sink-the-titanic.patch")

md5sums=('71724a755614c286bd861864bd0062a6'
         'dd493ee09f1280748cf2dc0cc5b1c121'
         '664462d4bc962b6eace6c2da26ff9ec9'
         '2596477483f3c9ee2aa11e36709b70ae'
         '843bdfc14d4515c0c0e58611d2705995'
         '916afe671c14e5a0505f2f7471c7602e'
         '06761d4d402e8d9338157292f6dfb6e8'
         'c9a567c7fc04c944ea28659858c1a9f4')

prepare() {
  gendesk -f -n --pkgname funnyboat --pkgdesc "${pkgdesc}" --exec "funnyboat" --categories "Game;ArcadeGame"
  cd $srcdir/funnyboat
  for i in save-sshot-in-homedir \
           funnyboat-cursor-patch \
           fullscreen \
           avoid_set_alpha_crash \
           sink-the-titanic \
           python3
  do
    patch -p1 -i $srcdir/$i.patch
  done
}

package() {
  cd "${srcdir}/funnyboat"
  install -d "${pkgdir}/usr/share/funnyboat/data"
  install -Dm644 *.py "${pkgdir}/usr/share/funnyboat"
  install -Dm644 data/* "${pkgdir}/usr/share/funnyboat/data"
  install -Dm644 README.txt "${pkgdir}/usr/share/doc/funnyboat"
  install -Dm644 LICENSE-CODE.txt "${pkgdir}/usr/share/licenses/funnyboat/LICENSE-CODE.txt"
  install -Dm644 LICENSE-MEDIA.txt "${pkgdir}/usr/share/licenses/funnyboat/LICENSE-MEDIA.txt"
  install -Dm644 "${srcdir}/funnyboat.desktop" ${pkgdir}/usr/share/applications/funnyboat.desktop
  echo "#!/bin/sh" > funnyboat
  echo "cd /usr/share/funnyboat/" >> funnyboat
  echo "python3 main.py" >> funnyboat
  install -Dm755 funnyboat $pkgdir/usr/bin/funnyboat
}
