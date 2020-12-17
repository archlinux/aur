# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-markad
pkgver=2.4.4
_logover=ea2e182ec798375f3830f8b794e7408576f139ad
epoch=1
_vdrapi=2.4.3
pkgrel=1
pkgdesc="Plugin to mark advertisemets in recordings and optionally auto-cut"
url="https://github.com/kfb77/vdr-plugin-markad"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('ffmpeg' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/kfb77/vdr-plugin-markad/archive/v$pkgver.tar.gz"
        "$pkgname-logos-1.tar.bz2::https://projects.vdr-developer.org/git/vdr-plugin-markad.git/snapshot/vdr-plugin-markad-$_logover.tar.bz2"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('f1fb6e4b60189a0ee1eca505e2e4c51f8d07e91e1ccb36daf1d80ea43ec237c9'
            'c5316bd48ebdb58ecad8bf8de29b2b92337aa8350a4d3340e8383301d4f7719f'
            '5b4f76d1ff31fc2aee847a070954bad1dbf00446c2e99269d9bf8331beb95e24')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  rm -rf "command/logos"
  mv "${srcdir}/vdr-plugin-$_plugname-$_logover/command/logos" "command"
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make DESTDIR="$pkgdir" install

  # Move the logofiles to the right place and add a symlink to prevent patching.
  mkdir -p "$pkgdir/usr/share"
  mv "$pkgdir/var/lib/markad" "$pkgdir/usr/share/markad"
  ln -s /usr/share/markad "$pkgdir/var/lib/markad"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
