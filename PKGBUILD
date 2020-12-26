# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=freetube-git
_pkgname=FreeTube
pkgver=1217
pkgrel=5
pkgdesc='An open source desktop YouTube player built with privacy in mind - built from git source tree.'
arch=('x86_64' 'arm')
license=('AGPL3')
depends=('gtk3' 'nss' 'electron')
makedepends=('git' 'npm')
conflicts=('freetube' 'freetube-bin')
url=https://freetubeapp.io
source=(git+https://github.com/FreeTubeApp/FreeTube
        package-only-necessary.diff
        freetube.desktop
        freetube.sh)
sha256sums=(SKIP SKIP SKIP SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
}

prepare() {
  sed -i 's@"electron": "^11.1.0,"@@g' "$srcdir/$_pkgname/package.json"
  patch "$srcdir/$_pkgname/_scripts/build.js" < package-only-necessary.diff
}

build() {
  cd "$srcdir/$_pkgname"
  npm install
  npm run build
}

package() {
  install -d "${pkgdir}"/{usr/bin,usr/lib/freetube-git}
  cp -R "./$_pkgname/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./freetube.sh" "$pkgdir/usr/bin/freetube"
  
  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/256x256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  cd ..
  install -Dm644 "freetube.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
