# Maintainer: Daniel Playfair Cal <daniel.playfair.cal at gmail dot com>
# Contributor: picokan <todaysoracle@protonmail.com>
# Contributor: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube-wayland
_pkgname=FreeTube
pkgver=0.16.0
pkgrel=1
pkgdesc='Like the freetube package, but with Ozone enabled when running on Wayland'
arch=('x86_64' 'aarch64' 'armv7h')
license=('AGPL3')
depends=( 'gtk3' 'nss' 'electron16' )
provides=( freetube )
conflicts=( freetube )
makedepends=('npm' 'yarn')
url=https://freetubeapp.io
source=(https://github.com/FreeTubeApp/FreeTube/archive/v$pkgver-beta.tar.gz
        package-only-necessary.diff
        freetube.desktop
        freetube.sh)
sha256sums=('d1d60c0cea854986b2ab5a20d47af82d021ea79082c273c53d983b1797e2604f'
            'ccb774571df6fcf7b1cd62cdf45c0345179a682fe8856c0011f846fe9bf50c8a'
            '928f0d7f07afdecf35fcf48ba109ab7e28f51bb233327263faa2c0499d669581'
            '9e79db05dd47cff54bcd9c18245c3da8cae8e5a91fb61ff128db790f0d1c04ff')

prepare() {
  patch "$srcdir/$_pkgname-$pkgver-beta/_scripts/build.js" < package-only-necessary.diff
}

build() {
  cd "$srcdir/$_pkgname-$pkgver-beta"
  yarn --cache-folder "${srcdir}/yarn-cache" install
  npm --cache "${srcdir}/npm-cache" run build
}

package() {
  install -d "${pkgdir}"/usr/lib/freetube
  cp -R "./$_pkgname-$pkgver-beta/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/freetube"
  install -Dm755 "./freetube.sh" "$pkgdir/usr/bin/freetube"
  
  cd $_pkgname-$pkgver-beta
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/freetube.svg"
  cd ..
  install -Dm644 "freetube.desktop" "$pkgdir/usr/share/applications/freetube.desktop"
}
