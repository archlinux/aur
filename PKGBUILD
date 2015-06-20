# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeworlds-hunter
pkgver=0.6.2.r6.944705e
pkgrel=1
pkgdesc="A customized server by bluelightzero where a Tee hunts everyone else"
arch=('i686' 'x86_64')
url="https://www.teeworlds.com/forum/viewtopic.php?id=10408"
license=('custom')
depends=('gcc-libs')
makedepends=('python' 'bam' 'mesa' 'unzip')
source=(git+https://github.com/bluelightzero/$pkgname.git
        0001-Enabled-mastersrv-and-versionsrv-as-they-are-require.patch
        server.sh.in
        README)
md5sums=('SKIP'
         'a76fcf155a7a38a51d95ad1ff0050472'
         '529146a3b13993770fa414f66c67fa26'
         '81785338a2084be394a997a465e33027')

pkgver() {
  cd $pkgname
  v=`grep "GAME_VERSION " src/game/version.h | cut -d\" -f2`
  r=`git rev-list --count HEAD`
  h=`git rev-parse --short HEAD`
  echo $v.r$r.$h
}

prepare() {
  cd $pkgname
  git apply ../0001-Enabled-mastersrv-and-versionsrv-as-they-are-require.patch || true
}

build() {
  cd $pkgname
  bam server_release
}

package() {
  cd $pkgname  
  install -Dm755 teeworlds_srv "$pkgdir"/usr/share/$pkgname/teeworlds_srv
  install -Dm644 SERVER_CFG/hunter.cfg "$pkgdir"/usr/share/$pkgname/server.cfg
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/license
  install -Dm644 ../README "$pkgdir"/usr/share/doc/$pkgname/README
    
  install -Dm755 ../server.sh.in "$pkgdir"/usr/bin/${pkgname}_srv
  sed -i "s/@MODNAME@/$pkgname/" "$pkgdir"/usr/bin/${pkgname}_srv
}
