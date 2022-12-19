# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-softhddevice
pkgver=1.9.0
epoch=1
_vdrapi=2.6.3
pkgrel=2
pkgdesc="software and GPU emulated HD output device plugin for VDR"
url="https://github.com/ua0lnj/vdr-plugin-softhddevice"
arch=('x86_64' 'i686')
license=('AGPL3')
depends=('freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server' 'libva'
         'libavcodec.so' 'libswscale.so' 'libswresample.so')
optdepends=('nvidia: Required for VDPAU decoding',
            'vdr-xorg: Recommended way to start X.org server together with VDR')
makedepends=('glm' 'glu' 'ffnvcodec-headers')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/ua0lnj/vdr-plugin-softhddevice/archive/v$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('58fa926e6e016a711fb4c654ca10b1ee120801c2d801a1aae67f5c42530b262d'
            '889d4c19770a926f8aa6a014ff8219800a7a74c464ef0b12dcef6bb8db93e719')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"

  # Disable OSS. Arch Linux doesn't ship OSS
  sed -i '/OSS /d' Makefile

  # Enable this to increase AV_INFO logging
  #sed -i 's/3000/500/g' Makefile

  # Enable this to compile with debug logging
  #sed -i 's/# -DDEBUG/-DDEBUG/g' Makefile
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
