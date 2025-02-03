# Maintainer: Diego Parra <diegoparranava@protonmail.com>
pkgname='waypaper-engine-git'
pkgver=2.0.4.r1.82eb64d
pkgrel=1
pkgdesc="A pleasant gui frontend for swww with batteries included!"
arch=('x86_64')
url="https://github.com/0bCdian/Waypaper-Engine"
license=('GLP')
depends=('swww' 'nodejs-lts-iron' 'socat' 'hicolor-icon-theme' 'fzf' 'jq' 'wlr-randr')
makedepends=('npm' 'git')
conflicts=('waypaper-engine')
provides=('waypaper-engine')
_archive="Waypaper-Engine"
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_archive"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$_archive"
  npm run build
}

package() {
  cd "$_archive"
  local pkgname="waypaper-engine"
  install -Dm755 ./cli/waypaper-engine "$pkgdir/usr/bin/${pkgname}"
  for _icons in 16x16 32x32 64x64 128x128 256x256 512x512; do
    install -Dm755 "./release/linux-unpacked/resources/icons/${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
  done
  install -dm755 "$pkgdir/opt/${pkgname}"
  install -Dm644 ./waypaper-engine.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/${pkgname}"
  cp ./release/linux-unpacked/* -rt "$pkgdir/opt/${pkgname}"
}
