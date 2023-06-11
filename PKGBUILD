# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Raphael Scholer <rascholer@gmail.com>
# Contributors: Dan Serban, Dany Martineau, RTFreedman, Harvey, Jordi De Groof, qqqqqqqqq9
pkgname=mp3diags
pkgver=1.5.02
pkgrel=1
pkgdesc="Tool for finding and fixing problems in MP3 files; includes a tagger"
url="https://mp3diags.sourceforge.net/"
license=('GPL2')
arch=('x86_64')
depends=('boost-libs' 'qt5-base')
makedepends=('boost' 'qt5-tools')
optdepends=('mp3gain: MP3 normalization support')
source=("https://downloads.sourceforge.net/project/mp3diags/unstable/mp3diags-src/MP3Diags-unstable-${pkgver}.tar.gz")
sha256sums=('6dacea62988e7ffee79217cf404268ece22b3fee95474f021c22f854a9f3e8e6')

prepare() {
  cd "MP3Diags-unstable-$pkgver"
  sed -i 's/-unstable//g' desktop/MP3Diags-unstable.desktop
  sed -i 's/\/unstable//g' desktop/MP3Diags-unstable.desktop
}

build() {
  cd "MP3Diags-unstable-$pkgver"
  ./AdjustMt.sh
  qmake-qt5
  make
  lrelease src/translations/mp3diags_*.ts
}

package() {
  cd "MP3Diags-unstable-$pkgver"
  install -Dm755 bin/MP3Diags-unstable "$pkgdir/usr/bin/MP3Diags"
  install -Dm644 desktop/MP3Diags-unstable.desktop \
    "$pkgdir/usr/share/applications/MP3Diags.desktop"

  for i in 16 22 24 32 36 40 48; do
    install -Dm644 "desktop/MP3Diags-unstable${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/MP3Diags.png"
  done

  install -Dm644 src/translations/*.qm -t "$pkgdir/usr/share/mp3diags/translations/"
}
