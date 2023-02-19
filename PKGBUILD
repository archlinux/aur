# Maintainer: Yoyo <admin@yzzi.icu>

pkgname=wallhaven-desktop-git
_pkgname=wallhaven-desktop
pkgver=0.0.1.r3.g61bd3af
pkgrel=1
pkgdesc="Unofficial desktop client for wallhaven.cc"
arch=('x86_64')
url="https://github.com/Pylogmon/wallhaven-desktop"
license=('GPL')
groups=('wallhaven-desktop-git')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')
makedepends=('pnpm' 'rust' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  sed -i "s/\"version\":.*/\"version\": \"$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' |sed 's/.\(r[0-9]\)/\-\1/')\"/g" src-tauri/tauri.conf.json
  pnpm install
  pnpm run tauri build --bundles none
}

package() {
  cd ${_pkgname}
  install -Dm755 src-tauri/target/release/${_pkgname} -t ${pkgdir}/usr/bin
  install -Dm644 src-tauri/icons/icon.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png
  install -Dm644 asset/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
}
