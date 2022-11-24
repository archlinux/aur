# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='A GUI to do stuff with the Analogue Pocket'
url='https://github.com/neil-morrison44/pocket-sync'
license=('LGPL3')
arch=('x86_64')
depends=('fuse2' 'xdg-desktop-portal')
makedepends=('util-linux')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')

source=(
  "https://github.com/neil-morrison44/pocket-sync/releases/download/v${pkgver}/pocket-sync_${pkgver}_amd64.AppImage"
  'app-run.patch'
  'linuxdeploy-plugin-gtk.patch'
)

sha512sums=(
  '0df7fd314ec9e6077029c23571145f3490a05066ed3cb041155c03f8082ef8b87801c79eee00dede13d910b501d6e3b25f3556d04f4da3f9d6a618bb8a3494fc'
  '9632af76ba47ec45f1857d5b7f530e9b9150b3ea16e8ad5077f5c3c8bedac45fbf2b18bd232401c2fa9fcd3136128cfab230e19d60f18ddcf9e2acd241fb28ad'
  '1d2c47713c1659ccdefc1963027f5251ba607c678c48eeb5439b2bfb790fc5f43486d6d84f3ffad5e3d632e0db8a11dd98529aa34d9c62cdfe73640686364efb'
)

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 pocket-sync_${pkgver}_amd64.AppImage
  ./pocket-sync_${pkgver}_amd64.AppImage --appimage-extract
  cd squashfs-root
  patch -p1 < ../app-run.patch
  patch -p1 < ../linuxdeploy-plugin-gtk.patch
}

package() {
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256@2/apps/pocket-sync.png "$pkgdir/usr/share/pixmaps/pocket-sync.png"
  install -Dm644 squashfs-root/usr/share/applications/pocket-sync.desktop "$pkgdir/usr/share/applications/pocket-sync.desktop"
  install -dm755 "$pkgdir/opt"
  mv squashfs-root "$pkgdir/opt/pocket-sync"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/pocket-sync/AppRun "$pkgdir/usr/bin/pocket-sync"
}
