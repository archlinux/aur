# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]
pkgbase=vdr-softhdcuvid
pkgname=(vdr-softhddrm)
pkgver=3.22
pkgrel=1
_vdrapi=2.6.6
pkgdesc="VDR output plugin with CUDA and Opengl"
url="https://github.com/jojo61/vdr-plugin-softhdcuvid"
arch=('x86_64' 'aarch64')
license=('AGPL3')
makedepends=('ffmpeg' 'freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server' 'libplacebo>=3.120.0' 'glm' 'glu' 'vulkan-headers' 'ffnvcodec-headers' 'freetype2')
_plugname=${pkgbase//vdr-/}
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/V${pkgver}.tar.gz"
        "50-$_plugname.conf")
sha256sums=('6c1d5ba564d7d5f7a9efdc4cb4d4d3ff83c5d38974965859f59c3fde0d1bb710'
            'ad30dd72260a25663e8ea46ca941c4d55d11fef7b936791cdf51de4fd91cb3af')

if [ "$CARCH" == "x86_64" ] ; then
  pkgname+=(vdr-softhdcuvid vdr-softhdvaapi)
  makedepends+=( 'nvidia>=410.48' )
fi

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"

  # Disable OSS. Arch Linux doesn't ship OSS
  sed -i '/OSS /d' Makefile

  # Don't clean built plugin binary
  sed -i 's/\*\.so//' Makefile
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  if [ "$CARCH" == "x86_64" ] ; then
    make CUVID=1 LIBPLACEBO=1 libvdr-softhdcuvid.so
    make clean
    make VAAPI=1 LIBPLACEBO=1 libvdr-softhdvaapi.so
    make clean
  fi
  make DRM=1 LIBPLACEBO=0 libvdr-softhddrm.so
  make clean
}

package_vdr-softhdcuvid() {
  depends=('freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server' 'nvidia>=410.48' 'glu'
           'libavcodec.so' 'libavutil.so' 'libplacebo.so' 'libswresample.so')
  optdepends=('vdr-xorg: Recommended way to start X.org server together with VDR')
  backup=("etc/vdr/conf.avail/50-$_plugname.conf")

  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  install -Dm755 "lib${pkgname}.so" "${pkgdir}$(pkg-config --variable=libdir vdr)/lib${pkgname}.so.$(pkg-config --variable=apiversion vdr)"
  make CUVID=1 DESTDIR="${pkgdir}" install-i18n

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-softhdcuvid.conf"
}

package_vdr-softhdvaapi() {
  depends=('freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server' 'glu'
           'libavcodec.so' 'libavfilter.so' 'libavutil.so' 'libplacebo.so' 'libswresample.so')
  optdepends=('vdr-xorg: Recommended way to start X.org server together with VDR')
  backup=("etc/vdr/conf.avail/50-softhdvaapi.conf")

  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  install -Dm755 "lib${pkgname}.so" "${pkgdir}$(pkg-config --variable=libdir vdr)/lib${pkgname}.so.$(pkg-config --variable=apiversion vdr)"
  make VAAPI=1 DESTDIR="${pkgdir}" install-i18n

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-softhdvaapi.conf"
  sed -i 's/softhdcuvid/softhdvaapi/' "$pkgdir/etc/vdr/conf.avail/50-softhdvaapi.conf"
}

package_vdr-softhddrm() {
  depends=('freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'glu' 'freetype2'
           'libavcodec.so' 'libavfilter.so' 'libavutil.so' 'libswresample.so')
  conflicts=('vdr-xorg')
  backup=("etc/vdr/conf.avail/50-softhddrm.conf")

  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  install -Dm755 "lib${pkgname}.so" "${pkgdir}$(pkg-config --variable=libdir vdr)/lib${pkgname}.so.$(pkg-config --variable=apiversion vdr)"
  make DRM=1 LIBPLACEBO=0 DESTDIR="${pkgdir}" install-i18n

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-softhddrm.conf"
  sed -i 's/softhdcuvid/softhddrm/' "$pkgdir/etc/vdr/conf.avail/50-softhddrm.conf"
}
