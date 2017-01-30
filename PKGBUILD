# Maintainer: Alessio Fachechi <alessio.fachechi@gmail.com>

pkgname=kitematic
pkgver=0.13.0
pkgrel=1
pkgdesc='Visual Docker Container Management'
arch=('x86_64')
url='https://github.com/docker/kitematic'
license=('Apache')
depends=('docker' 'nodejs')
makedepends=('git' 'npm' 'nodejs-grunt-cli')
conflicts=('kitematic')
source=(
  "$pkgname::git+https://github.com/docker/kitematic.git"
  "$pkgname.desktop"
  "$pkgname.svg"
)
sha256sums=(
  'SKIP'
  '448603660a205037c83125759e523cfec9cf1a93c0b1317482740a04292d5bdc'
  '954d9803f49e475bc3242ad8b5dbfe5f3be9b532434ff260e1cf5c929f018617'
)

build() {
  cd "$pkgname"
  git checkout tags/v$pkgver -b $pkgver
  npm install
  grunt babel less copy:dev shell:linux_npm electron-packager:build
}

package() {
  install -dm755 "$pkgdir"/{opt,usr/bin}
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

  cp -R "$pkgname/dist/Kitematic-linux-x64/" "$pkgdir/opt/$pkgname"
  ln -s "/opt/$pkgname/Kitematic" "$pkgdir/usr/bin/kitematic"
}
