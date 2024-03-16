# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-markad
pkgver=3.4.13
pkgrel=1
_logover=ea2e182ec798375f3830f8b794e7408576f139ad
epoch=1
_vdrapi=2.6.6
pkgdesc="Plugin to mark advertisemets in recordings and optionally auto-cut"
url="https://github.com/kfb77/vdr-plugin-markad"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL-2.0-or-later')
depends=("vdr-api=${_vdrapi}" 'libavcodec.so' 'libavfilter.so' 'libavformat.so' 'libavutil.so' 'libswresample.so')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/kfb77/vdr-plugin-markad/archive/V$pkgver.tar.gz"
        "$pkgname-logos-1.tar.gz::https://github.com/vdr-projects/vdr-plugin-markad/archive/$_logover.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('179eb1a1f9b782bfb2a77ad0141437ebe5b8e9dda624dc6cf88ecfe1c892f450'
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
