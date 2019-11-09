# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-softhddevice
pkgver=0.7.0_36_g9872176
epoch=1
_gitver=987217671a19742a34a670668cbe0f278c44e977
_vdrapi=2.4.1
pkgrel=1
pkgdesc="software and GPU emulated HD output device plugin for VDR"
url="https://github.com/ua0lnj/vdr-plugin-softhddevice"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('AGPL3')
depends=('ffmpeg' 'freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server')
optdepends=('nvidia: Required for VDPAU decoding',
            'vdr-xorg: Recommended way to start X.org server together with VDR')
makedepends=('git' 'glm' 'glu' 'patchutils')
_plugname=${pkgname//vdr-/}
source=("git+https://github.com/ua0lnj/vdr-plugin-softhddevice.git#commit=$_gitver"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         'f6ef6cb0bf17c5a28f858e5306776d27')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git tag 0.7.0 282c346a74b3c9e4ad73843f0759b4701a6d030e
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
