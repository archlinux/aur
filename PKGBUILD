# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube
_pkgname=FreeTube
pkgver=0.25.2
_electron=electron42
pkgrel=1
pkgdesc='An open source desktop YouTube player built with privacy in mind.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('AGPL-3.0-or-later')
depends=($_electron)
makedepends=('pnpm')
url=https://freetubeapp.io
source=(https://github.com/FreeTubeApp/FreeTube/archive/v$pkgver-beta.tar.gz
        freetube.desktop
        freetube.sh)
sha256sums=('1a90edfdd97e305f2701a05e6bf3a35de76d8cb5a3b9826376c4faa2aec0335c'
            'ada2b4b8f6a1e8896acbce4f4d311228d2c86026c273ffa00afa3247294f8b1e'
            '1b202a62d3ba821df518926bdea76f6a4532f6c30a5c21d44cb9b9b374e543f7')

prepare() {
  sed -i "5i electronDist: '/usr/lib/$_electron'," "$srcdir/$_pkgname-$pkgver-beta/_scripts/ebuilder.config.mjs"
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "$srcdir/$_pkgname-$pkgver-beta/_scripts/build.mjs"
  sed -i "s/_electron_/$_electron/" "$srcdir/freetube.sh"
  echo "strictDepBuilds: false" > "$srcdir/$_pkgname-$pkgver-beta/pnpm-workspace.yaml"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver-beta"
  pnpm install
  pnpm run build
}

package() {
  install -d "${pkgdir}"/usr/lib/${pkgname}
  cp -R "./$_pkgname-$pkgver-beta/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./freetube.sh" "$pkgdir/usr/bin/$pkgname"
  
  cd $_pkgname-$pkgver-beta
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  cd ..
  install -Dm644 "freetube.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
