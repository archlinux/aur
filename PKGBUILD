# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-softhddevice
pkgver=0.6.1rc1_54_g700c8e8
epoch=1
_gitver=700c8e8767e4632a63123b004c304892b31b5074
_vdrapi=2.2.0
pkgrel=1
pkgdesc="software and GPU emulated HD output device plugin for VDR"
url="http://projects.vdr-developer.org/projects/plg-softhddevice"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('AGPL3')
depends=('ffmpeg' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server')
optdepends=('nvidia: Required for VDPAU decoding')
makedepends=('git' 'glu' )
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-softhddevice.git#commit=$_gitver"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         'f6ef6cb0bf17c5a28f858e5306776d27')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"

  # Disable OSS. Arch Linux doesn't ship OSS
  sed -i '/OSS /d' Makefile

  # Enable EOS_TRICKSPEED to fix rewind on 1080i channels
  sed -i 's/#CONFIG += -DH264_EOS_TRICKSPEED/CONFIG += -DH264_EOS_TRICKSPEED/g' Makefile

  # Enable USE_MPEG_COMPLETE to fix partially missing video decoding of SD channels
  sed -i 's/#CONFIG += -DUSE_MPEG_COMPLETE/CONFIG += -DUSE_MPEG_COMPLETE/g' Makefile

  # Enable this to increase AV_INFO logging
  #sed -i 's/3000/500/g' Makefile

  # Enable this to compile with debug logging
  #sed -i 's/# -DDEBUG/-DDEBUG/g' Makefile

  # Enable VA-API
  sed -i 's/#VAAPI/VAAPI/g' Makefile
  sed -i 's/#OPENGL/OPENGL/g' Makefile
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
