# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube
_pkgname=FreeTube
pkgver=0.13.1
pkgrel=1
pkgdesc='An open source desktop YouTube player built with privacy in mind.'
arch=('x86_64' 'aarch64' 'armv7h')
license=('AGPL3')
depends=( 'gtk3' 'nss' 'electron' )
makedepends=('npm' 'nodejs-lts-fermium')
url=https://freetubeapp.io
source=(https://github.com/FreeTubeApp/FreeTube/archive/v$pkgver-beta.tar.gz
        package-only-necessary.diff
        freetube.desktop
        freetube.sh)
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=(8aad5bbd5dbdbe5d88ba30dd0799488c7644abe16ed7f1f9f379178cf2c2c773
            SKIP SKIP SKIP)

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
