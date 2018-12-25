# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-softhddevice
pkgver=0.6.1rc1_65_g6dfa88a
epoch=1
_gitver=6dfa88aecf1b5a4c5932ba278209d9f22676547f
_vdrapi=2.4.0
pkgrel=2
pkgdesc="software and GPU emulated HD output device plugin for VDR"
url="http://projects.vdr-developer.org/projects/plg-softhddevice"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('AGPL3')
depends=('ffmpeg2.8' 'freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server')
optdepends=('nvidia: Required for VDPAU decoding',
            'vdr-xorg: Recommended way to start X.org server together with VDR')
makedepends=('git' 'glm' 'glu' 'patchutils')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-softhddevice.git#commit=$_gitver"
        "https://github.com/louisbraun/softhddevice-openglosd/compare/48fbfa9f...3ed09d43.diff"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '5dc3d680794ae6293a7ba03de1d29c57'
         'f6ef6cb0bf17c5a28f858e5306776d27')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"

  # Disable OSS. Arch Linux doesn't ship OSS
  sed -i '/OSS /d' Makefile

  # Enable this to increase AV_INFO logging
  #sed -i 's/3000/500/g' Makefile

  # Enable this to compile with debug logging
  #sed -i 's/# -DDEBUG/-DDEBUG/g' Makefile

  filterdiff -x '*.po' "$srcdir/48fbfa9f...3ed09d43.diff" | patch -p1
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  PKG_CONFIG_PATH="/usr/lib/ffmpeg2.8/pkgconfig" make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  PKG_CONFIG_PATH="/usr/lib/ffmpeg2.8/pkgconfig" make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
