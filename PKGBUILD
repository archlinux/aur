# Maintainer: Ethan McTague <ethan@tague.me>
# 
# Based off of the `oni` package, which is maintained by:
# - Amadeus Folego <amadeusfolego@gmail.com>
# - Terje Larsen <terlar@gmail.com>
pkgname=oni-git
pkgver=0.0.0
pkgrel=1
pkgdesc='An IDE built around Neovim - Master Branch'
arch=(x86_64)
url="https://github.com/onivim/oni"
license=('MIT')
depends=('neovim' 'nodejs' 'gconf' 'libxss')
makedepends=('tar')
source=("oni.sh"
        "oni.desktop"
        "icons.tar.gz")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

package() {
  cd ${srcdir}
  git clone https://github.com/onivim/oni.git oni-master
  cd oni-master
  git submodule update --init --recursive
  npm install
  npm run build
  install -d ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/oni-master/* ${pkgdir}/opt/${pkgname}
  install -Dm755 $srcdir/oni.sh ${pkgdir}/usr/bin/oni-git

  install -Dm644 ${srcdir}/oni.desktop "$pkgdir/usr/share/applications/oni-git.desktop"

  tar -xf ${srcdir}/icons.tar.gz
  for i in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024; do
    install -Dm644 ${srcdir}/icons/$i.png "${pkgdir}/usr/share/icons/hicolor/$i/apps/oni.png"
  done
}
# vim:set ts=2 sw=2 et:
