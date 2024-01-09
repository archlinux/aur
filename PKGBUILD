# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: mnabid

_basename=zoom
pkgname=$_basename-system-qt
pkgver=5.16.6
_subver=382
pkgrel=2
pkgdesc='Video Conferencing and Web Conferencing Service - system Qt libraries'
arch=('x86_64')
license=('custom')
url='https://zoom.us'
provides=("$_basename")
conflicts=("$_basename")
makedepends=('patchelf')
depends=('ttf-font'
         'libjpeg-turbo'
         'qt5-base'
         'qt5-3d'
         'qt5-remoteobjects'
         'qt5-gamepad'
         'qt5-graphicaleffects'
         'qt5-imageformats'
         'qt5-quickcontrols'
         'qt5-quickcontrols2'
         'qt5-svg'
         'qt5-script'
         'quazip-qt5'
         'at-spi2-core'
         #'vulkan-validation-layers'
         'electron'
         'qt5-declarative'
         'icu56')
optdepends=('qt5-webengine: SSO login support'
            'picom: extra compositor needed by some window managers for screen sharing'
            'xcompmgr: extra compositor needed by some window managers for screen sharing'
            'pulseaudio-alsa: output sound via pulseaudio' )
source=("${pkgname}-${pkgver}.${_subver}_orig_x86_64.pkg.tar.xz"::"https://cdn.zoom.us/prod/${pkgver}.${_subver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('c70acebcda8719c12a5c69607c5b6195e16b8c70ad9cb65d1878064134988fdbfd01288df7ce8d41153614f7c5678222ad98ee3deac08f23acbacfd694860d65')

_replace() {
    rm -rf $1
    ln -sfv /usr/lib/$2 $1
}

package() {
    cp -dpr --no-preserve=ownership opt usr "$pkgdir"
    cd "$pkgdir/opt/zoom"

    # Fix spurious RPATH in binaries
    patchelf --shrink-rpath zoom
    patchelf --shrink-rpath zopen

    rm -rf Qt/bin

    _replace Qt/plugins qt/plugins
    _replace Qt/qml qt/qml

    #_replace cef/locales electron/locales
    #_replace cef/chrome_100_percent.pak electron/chrome_100_percent.pak
    #_replace cef/chrome_200_percent.pak electron/chrome_200_percent.pak
    _replace cef/libffmpeg.so opera/lib_extra/libffmpeg.so
    _replace cef/libEGL.so electron/libEGL.so
    _replace cef/libGLESv2.so electron/libGLESv2.so
    _replace cef/libsqlite3.so.0 libsqlite3.so.0
    _replace cef/libvk_swiftshader.so electron/libvk_swiftshader.so
    # libVkICD_mock_icd.so ?
    #_replace cef/libVkLayer_khronos_validation.so libVkLayer_khronos_validation.so smaller binary
    _replace cef/libvulkan.so.1 electron/libvulkan.so.1
    _replace libturbojpeg.so libturbojpeg.so
    _replace libswresample.so.4 libswresample.so.4
    _replace libquazip.so libquazip1-qt5.so
    _replace libOpenCL.so.1 libOpenCL.so
    _replace libmpg123.so libmpg123.so
    # libmkldnn.so intel-oneapi-mkl
    # libfdkaac2.so zoom_video_sdk
    # ? libdvf.so libclDNN64.so libaomagent.so
    _replace libavutil.so.57 libavutil.so
    _replace libavformat.so.59 libavformat.so
    _replace libavcodec.so.59 libavcodec.so

    _replace Qt/lib/libicudata.so.56 libicudata.so.56
    _replace Qt/lib/libicui18n.so.56 libicui18n.so.56
    _replace Qt/lib/libicuuc.so.56 libicuuc.so.56

    ldconfig -N -n ./

    # Remove unnecessary executable flag
    chmod -x *.pcm sip/*.{wav,WAV}
}
