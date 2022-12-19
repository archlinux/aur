# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]
pkgbase=vdr-softhdcuvid
pkgname=(vdr-softhdcuvid vdr-softhdvaapi vdr-softhddrm)
pkgver=3.6
_vdrapi=2.6.3
pkgrel=4
pkgdesc="VDR output plugin with CUDA and Opengl"
url="https://github.com/jojo61/vdr-plugin-softhdcuvid"
arch=('x86_64')
license=('AGPL3')
makedepends=('ffmpeg' 'freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server' 'nvidia>=410.48' 'libplacebo>=3.120.0' 'glm' 'glu' 'vulkan-headers' 'ffnvcodec-headers' 'freetype2')
_plugname=${pkgbase//vdr-/}
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/V${pkgver}.tar.gz"
        "50-$_plugname.conf")
sha512sums=('f61db0fde5f9543cfb7ba2bc7bfcb0a336e50c2b019d86cf9116905f7d53054bdbb001a6b8f5768db4ed70d9ad013aea01e960f9ce4e4d9ca8bfcd23d3fdc43e'
            'a6d038f645de6936487b18452bdda3ca17545d6168289fdd144f40e4eada37949c27a28a810108ad5e6e5cba63ee1b7c9f3891fd8ae53a5d7d0e4b3675327c58')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"

  # Disable OSS. Arch Linux doesn't ship OSS
  sed -i '/OSS /d' Makefile

  # Don't clean built plugin binary
  sed -i 's/\*\.so//' Makefile
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make CUVID=1 libvdr-softhdcuvid.so
  make clean
  make VAAPI=1 libvdr-softhdvaapi.so
  make clean
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
