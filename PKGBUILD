# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube
_pkgname=FreeTube
pkgver=0.14.0
pkgrel=2
pkgdesc='An open source desktop YouTube player built with privacy in mind.'
arch=('x86_64' 'aarch64' 'armv7h')
license=('AGPL3')
depends=( 'gtk3' 'nss' 'electron13' )
makedepends=('npm' 'nodejs')
url=https://freetubeapp.io
source=(https://github.com/FreeTubeApp/FreeTube/archive/v$pkgver-beta.tar.gz
        package-only-necessary.diff
        freetube.desktop
        freetube.sh)
sha256sums=(3caf44e1a9d4eab8bd944145ca2f616febd739c234d5063406410b1d00c57fd6
            40bc70f6e2996ba6d2e77e385a618737b7f4c68c9c0bc52bbb2de93dbb01de2f
            1b518ac2f42db51294316b15313e997c7f0ff6245cf1eb74830fe7caeea4e70b
            e4dab57eefc975469edf981984c76be17b574a51438e86f0df159ca6e2d8d637)

prepare() {
  patch "$srcdir/$_pkgname-$pkgver-beta/_scripts/build.js" < package-only-necessary.diff
}

build() {
  cd "$srcdir/$_pkgname-$pkgver-beta"
  npm --cache "${srcdir}/npm-cache" install
  npm --cache "${srcdir}/npm-cache" run build
}

package() {
  install -d "${pkgdir}"/{usr/bin,usr/lib/freetube}
  cp -R "./$_pkgname-$pkgver-beta/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./freetube.sh" "$pkgdir/usr/bin/$pkgname"
  
  cd $_pkgname-$pkgver-beta
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  cd ..
  install -Dm644 "freetube.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
