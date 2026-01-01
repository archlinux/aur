# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=freetube-git-d3sox
_pkgname=FreeTube
pkgver=r9686.d2f88582
pkgrel=5
pkgdesc='An open source desktop YouTube player built with privacy in mind - My fork with additional features'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://freetubeapp.io"
license=('AGPL-3.0-or-later')
depends=('electron39')
makedepends=('git' 'npm' 'yarn')
provides=('freetube')
conflicts=('freetube')
source=(git+https://github.com/D3SOX/FreeTube
        freetube.desktop
        freetube.sh)
sha256sums=('SKIP'
            'ada2b4b8f6a1e8896acbce4f4d311228d2c86026c273ffa00afa3247294f8b1e'
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
  install -Dm755 "./freetube.sh" "$pkgdir/usr/bin/freetube"
  
  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/freetube.svg"
  cd ..
  install -Dm644 "freetube.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
