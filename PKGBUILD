# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube
_pkgname=FreeTube
pkgver=0.23.8
pkgrel=2
pkgdesc='An open source desktop YouTube player built with privacy in mind.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('AGPL-3.0-or-later')
depends=( 'electron37')
makedepends=('npm' 'nodejs>=20.0.0')
url=https://freetubeapp.io
source=(https://github.com/FreeTubeApp/FreeTube/archive/v$pkgver-beta.tar.gz
        freetube.desktop
        freetube.sh)
sha256sums=('5edfe5acd7b77660cd0637b11bea31f676fb07ddb61970f760ebd94a09b0b221'
            'ada2b4b8f6a1e8896acbce4f4d311228d2c86026c273ffa00afa3247294f8b1e'
            'b1c2c3aec4b73091518cd5073a75cd3eab14f9bccd9104e22092306f9a3245d9')

prepare() {
  sed -i "4i electronDist: '/usr/lib/electron37'," "$srcdir/$_pkgname-$pkgver-beta/_scripts/ebuilder.config.js"
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "$srcdir/$_pkgname-$pkgver-beta/_scripts/build.js"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver-beta"
  npm install --cache "${srcdir}/npm-cache"
  npm run build
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
