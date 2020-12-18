# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube
_pkgname=FreeTube
pkgver=0.10.0
pkgrel=1
pkgdesc='An open source desktop YouTube player built with privacy in mind.'
arch=('x86_64' 'arm')
license=('AGPL3')
depends=('libxss' 'nss' 'gtk3')
makedepends=('npm')
conflicts=('freetube-git' 'freetube-bin')
url=https://freetubeapp.io
source=(https://github.com/FreeTubeApp/FreeTube/archive/v0.10.0-beta.tar.gz
        package-only-necessary.diff
        freetube.desktop)
sha256sums=(d53dbb88c7c3a09196bc3b7af16924ccb63d7ce748f3aa1388962c7ccef2f932
            SKIP SKIP)

prepare() {
  patch "$srcdir/$_pkgname-$pkgver-beta/_scripts/build.js" < package-only-necessary.diff
}

build() {
  cd "$srcdir/$_pkgname-$pkgver-beta"
  npm install
  npm run build
}

package() {
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -R "./$_pkgname-$pkgver-beta/build/linux-unpacked" "$pkgdir/opt/$pkgname"
  ln -s "/opt/$pkgname/freetube" "$pkgdir/usr/bin/$pkgname"
  
  chmod 4755 $pkgdir/opt/$pkgname/chrome-sandbox
  
  cd $_pkgname-$pkgver-beta
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/256x256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  cd ..
  install -Dm644 "freetube.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
