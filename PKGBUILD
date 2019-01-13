# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-softhddevice
pkgver=0.6.1rc1_65_g6dfa88a
epoch=1
_gitver=6dfa88aecf1b5a4c5932ba278209d9f22676547f
_ffmpegver=2.8.15
_vdrapi=2.4.0
pkgrel=3
pkgdesc="software and GPU emulated HD output device plugin for VDR"
url="http://projects.vdr-developer.org/projects/plg-softhddevice"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('AGPL3')
depends=('freeglut' 'glew' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server' 'libva' 'libvdpau' 'alsa-lib')
optdepends=('nvidia: Required for VDPAU decoding',
            'vdr-xorg: Recommended way to start X.org server together with VDR')
makedepends=('git' 'glm' 'glu' 'patchutils')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-softhddevice.git#commit=$_gitver"
        "https://ffmpeg.org/releases/ffmpeg-${_ffmpegver}.tar.xz"
        "softhddevice-openglosd.diff::https://github.com/louisbraun/softhddevice-openglosd/compare/48fbfa9f...569fde5d.diff"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '9c5f5d9a3aeaa6ff1f2514cc509d3f07'
         'f8b7095b157a955f29ddc76d5bf5c476'
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

  # OpenGL OSD support
  filterdiff -x '*.po' "$srcdir/softhddevice-openglosd.diff" | patch -p1
}

build() {
  cd "${srcdir}/ffmpeg-${_ffmpegver}"
  ./configure \
    --disable-everything \
    --disable-programs \
    --disable-doc \
    --disable-stripping \
    --disable-yasm \
    --disable-asm \
    --prefix="${srcdir}/ffmpeg_root" \
    --enable-static \
    --disable-shared \
    --enable-pic \
    --enable-gpl \
    --enable-version3 \
    --enable-hwaccel=h263_vaapi \
    --enable-hwaccel=h263_vdpau \
    --enable-hwaccel=h264_vaapi \
    --enable-hwaccel=h264_vdpau \
    --enable-hwaccel=mpeg1_vdpau \
    --enable-hwaccel=mpeg2_vaapi \
    --enable-hwaccel=mpeg2_vdpau \
    --enable-hwaccel=mpeg4_vaapi \
    --enable-hwaccel=mpeg4_vdpau \
    --enable-hwaccel=wmv3_vaapi \
    --enable-hwaccel=wmv3_vdpau \
    --enable-hwaccel=hevc_vaapi \
    --enable-hwaccel=hevc_vdpau \
    --enable-decoder=ac3 \
    --enable-decoder=eac3 \
    --enable-decoder=mp2
  make
  make install

  cd "${srcdir}/vdr-plugin-${_plugname}"
  PKG_CONFIG_PATH="${srcdir}/ffmpeg_root/lib/pkgconfig" make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  PKG_CONFIG_PATH="${srcdir}/ffmpeg_root/lib/pkgconfig" make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
