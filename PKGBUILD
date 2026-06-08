# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube
_pkgname=FreeTube
pkgver=0.24.1
_electron=electron41
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
sha256sums=('bf45838a6d094e9ffe5ecce8381b0c9eeed49e443bd882b785a357e07d83b98e'
            'ada2b4b8f6a1e8896acbce4f4d311228d2c86026c273ffa00afa3247294f8b1e'
            'c91fb1dab3b6439967833efce9ee9356a0fc9f803fee53c9cbe25b00c85fab59')

prepare() {
  sed -i "5i electronDist: '/usr/lib/$_electron'," "$srcdir/$_pkgname-$pkgver-beta/_scripts/ebuilder.config.mjs"
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "$srcdir/$_pkgname-$pkgver-beta/_scripts/build.mjs"
  sed -i "s/_electron_/$_electron/" "$srcdir/freetube.sh"
  echo "strictDepBuilds: false" > "$srcdir/$_pkgname-$pkgver-beta/pnpm-workspace.yaml"
  # sed -i "6i strictDepBuilds: false" "$srcdir/$_pkgname-$pkgver-beta/pnpm-workspace.yaml"
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
