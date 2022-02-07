# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube
_pkgname=FreeTube
pkgver=0.16.0
pkgrel=1
pkgdesc='An open source desktop YouTube player built with privacy in mind.'
arch=('x86_64' 'aarch64' 'armv7h')
license=('AGPL3')
depends=( 'gtk3' 'nss' 'electron' )
makedepends=('npm' 'yarn')
url=https://freetubeapp.io
source=(https://github.com/FreeTubeApp/FreeTube/archive/v$pkgver-beta.tar.gz
        package-only-necessary.diff
        freetube.desktop
        freetube.sh)
sha256sums=(d1d60c0cea854986b2ab5a20d47af82d021ea79082c273c53d983b1797e2604f
            ccb774571df6fcf7b1cd62cdf45c0345179a682fe8856c0011f846fe9bf50c8a
            928f0d7f07afdecf35fcf48ba109ab7e28f51bb233327263faa2c0499d669581
            9a8b5f1a5fabd1c6cbd9300163dd079d7663c8a7571402678ee1d875ef9c030d)

prepare() {
  patch "$srcdir/$_pkgname-$pkgver-beta/_scripts/build.js" < package-only-necessary.diff
}

build() {
  cd "$srcdir/$_pkgname-$pkgver-beta"
  yarn --cache-folder "${srcdir}/yarn-cache" install
  npm --cache "${srcdir}/npm-cache" run build
}

package() {
  install -d "${pkgdir}"/usr/lib/${pkgname}
  cp -R "./$_pkgname-$pkgver-beta/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./freetube.sh" "$pkgdir/usr/bin/$pkgname"
  
  cd $_pkgname-$pkgver-beta
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  cd ..
  install -Dm644 "freetube.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
