# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: mnabid

_basename=zoom
pkgname=$_basename-system-qt
pkgver=5.17.1
_subver=1840
pkgrel=1
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
b2sums=('2eb92ade31f14313e33e48d8dcad0ece2e738c142c17e84c5f5c5d21ad947b2b68f6f8bd5c58a6dec185d635ea66f9c2608fb93d92159eb11aee280b8c544016')

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

    _replace cef/chrome-sandbox electron/chrome-sandbox
    _replace cef/chrome_100_percent.pak electron/chrome_100_percent.pak
    _replace cef/chrome_200_percent.pak electron/chrome_200_percent.pak
    #_replace cef/resources.pak electron/resources.pak
    _replace cef/libffmpeg.so electron/libffmpeg.so
    _replace cef/libEGL.so electron/libEGL.so
    _replace cef/libGLESv2.so electron/libGLESv2.so
    _replace cef/libsqlite3.so.0 libsqlite3.so.0
    _replace cef/libvk_swiftshader.so electron/libvk_swiftshader.so
    _replace cef/libvulkan.so.1 electron/libvulkan.so.1
    # cef/libVkICD_mock_icd.so (chromium thing)
    #_replace cef/libcef.so libcef.so
    #_replace cef/libVkLayer_khronos_validation.so libVkLayer_khronos_validation.so smaller binary

    #_replace cef/snapshot_blob.bin electron/snapshot_blob.bin
    #_replace cef/v8_context_snapshot.bin electron/v8_context_snapshot.bin
    _replace cef/vk_swiftshader_icd.json electron/vk_swiftshader_icd.json

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
