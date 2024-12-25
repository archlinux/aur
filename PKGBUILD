# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]
pkgbase=vdr-softhdcuvid
pkgname=(vdr-softhddrm)
pkgver=3.27
pkgrel=1
_vdrapi=5
pkgdesc="VDR output plugin with CUDA and Opengl"
url="https://github.com/jojo61/vdr-plugin-softhdcuvid"
arch=('x86_64' 'aarch64')
license=('AGPL3')
makedepends=('ffmpeg' 'freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server' 'libplacebo>=3.120.0' 'glm' 'glu' 'vulkan-headers' 'ffnvcodec-headers' 'freetype2')
_plugname=${pkgbase//vdr-/}
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/V${pkgver}.tar.gz"
        "${pkgname}-Fix-compiling-for-softhddrm.patch::https://github.com/jojo61/vdr-plugin-softhdcuvid/commit/e624e9c83d9b4fe6144b760f38eb358c83749726.patch"
        "50-$_plugname.conf")
sha256sums=('72d6fb9274e73f1ae1ec06e19c785ee624b88c0b173f246d0363158f543e355c'
            'd28817cb9535e52fe1314f6b39f730272bcd19d2647aa3ffd164d5de26036164'
            'ad30dd72260a25663e8ea46ca941c4d55d11fef7b936791cdf51de4fd91cb3af')

if [ "$CARCH" == "x86_64" ] ; then
  pkgname+=(vdr-softhdcuvid vdr-softhdvaapi)
  makedepends+=( 'nvidia>=410.48' )
fi

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"

  patch -p1 -i "${srcdir}/${pkgname}-Fix-compiling-for-softhddrm.patch"

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
    make VAAPI=1 LIBPLACEBO_GL=1 libvdr-softhdvaapi.so
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
