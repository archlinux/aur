# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=freetube-vue-git
_pkgname=FreeTube-Vue
pkgver=290
pkgrel=1
pkgdesc='Rewrite of the open source desktop YouTube player built with privacy in mind.'
arch=('x86_64' 'arm')
license=('AGPL3')
makedepends=('git' 'npm')
url=https://freetubeapp.io
source=(git+https://github.com/FreeTubeApp/FreeTube-Vue
        package-only-necessary.diff
        freetube-vue-git.desktop)
sha256sums=(SKIP SKIP SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
}

prepare() {
  patch "$srcdir/$_pkgname/_scripts/build.js" < package-only-necessary.diff
}

build() {
  cd "$srcdir/$_pkgname"
  npm install
  npm run build
}

package() {
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -R "./$_pkgname/build/linux-unpacked" "$pkgdir/opt/$pkgname"
  ln -s "/opt/$pkgname/freetube-vue" "$pkgdir/usr/bin/$pkgname"
  
  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/256x256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  cd ..
  install -Dm644 "freetube-vue-git.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
