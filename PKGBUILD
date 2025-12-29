# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-markad
pkgver=4.2.17
pkgrel=1
_logover=ea2e182ec798375f3830f8b794e7408576f139ad
epoch=1
_vdrapi=9
pkgdesc="Plugin to mark advertisemets in recordings and optionally auto-cut"
url="https://github.com/kfb77/vdr-plugin-markad"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL-2.0-or-later')
depends=("vdr-api=${_vdrapi}" 'libavcodec.so' 'libavfilter.so' 'libavformat.so' 'libavutil.so' 'libswresample.so')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/kfb77/vdr-plugin-markad/archive/V$pkgver.tar.gz"
        "$pkgname-logos-1.tar.gz::https://github.com/vdr-projects/vdr-plugin-markad/archive/$_logover.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('cdc445242d06ad5a242ab21cd24a8a41be4ed5540c4800b31d5095a2666d3aca'
            'b2e58edae4899272a58c89d193089adf900e5098d57bf1fb449d4f308b61e9a8')

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

  install -Dm644 "plugin/contrib/$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
