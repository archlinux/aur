# Maintainer: italoghost <eduprodive at posteo dot me>

pkgname=freetube-electron-git
_pkgname=FreeTube
pkgver=0.22.0.beta.r7355.c32409f
pkgrel=1
pkgdesc='An open source desktop YouTube player built with privacy in mind - built from git source tree, with the system electron (unsupported).'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://freetubeapp.io"
license=('AGPL-3.0-or-later')
depends=('electron')
makedepends=('git' 'yarn')
provides=('freetube')
conflicts=('freetube')
source=(git+https://github.com/FreeTubeApp/FreeTube
        freetube.desktop
        freetube.sh)
sha256sums=("SKIP" 
            "ada2b4b8f6a1e8896acbce4f4d311228d2c86026c273ffa00afa3247294f8b1e" 
            "a060f380f6614ce920a7b1905b9a23c26712a8a640d6af4e930bc2909183bc98")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.r%s.%s" "$(git tag --sort=committerdate | tail -1 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  sed -i "4i electronDist: '/usr/lib/electron'," "$srcdir/$_pkgname/_scripts/ebuilder.config.js"
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "$srcdir/$_pkgname/_scripts/build.js"
}

build() {
  cd "$srcdir/$_pkgname"
  yarn --cache-folder "${srcdir}/yarn-cache" install
  yarn --cache-folder "${srcdir}/yarn-cache" run build
}

package() {
  install -d "${pkgdir}"/{usr/bin,usr/lib/$pkgname}
  cp -R "./$_pkgname/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./freetube.sh" "$pkgdir/usr/bin/freetube"
  
  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/freetube.svg"
  cd ..
  install -Dm644 "freetube.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
