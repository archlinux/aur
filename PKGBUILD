# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=opentubex-git
_pkgname=OpenTubeX
pkgver=r9689.e8b0f6ea
pkgrel=1
pkgdesc='A fork of the open source desktop YouTube player FreeTube with additional features'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/D3SOX/OpenTubeX"
license=('AGPL-3.0-or-later')
depends=('electron39')
makedepends=('git' 'npm' 'yarn')
source=("git+$url"
        opentubex.desktop
        opentubex.sh)
sha256sums=('SKIP'
            '07f95cd1ed647ab0e818f17cfbf77676ca8123b8e6390ca81d37501f70f37361'
            '6819a0d45794fc7d5588263f723bc3092719be1a8f81b58d7d3df485dcbbffd3')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i "5i electronDist: '/usr/lib/electron39'," "$srcdir/$_pkgname/_scripts/ebuilder.config.mjs"
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "$srcdir/$_pkgname/_scripts/build.mjs"
}

build() {
  cd "$srcdir/$_pkgname"
  yarn install --frozen-lockfile
  yarn build
}

package() {
  install -d "${pkgdir}"/{usr/bin,usr/lib/freetube-git-d3sox}
  cp -R "./$_pkgname/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./opentubex.sh" "$pkgdir/usr/bin/opentubex"
  
  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/opentubex.svg"
  cd ..
  install -Dm644 "opentubex.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
