# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Bjorn Nostvold <bjorn.nostvold@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgname=emby-server-beta
pkgver=4.1.0.13
pkgrel=2
_ffmpeg_ver=2018_12_01
_ffdetect_ver=4.0.2
pkgdesc='Bring together your videos, music, photos, and live television'
arch=('any')
url='https://emby.media'
license=('custom')
depends=('alsa-lib'
         'aom'
         'dotnet-runtime'
         'fontconfig'
         'fribidi'
         'gmp'
         'gnutls'
         'lame'
         'libass.so'
         'libdrm'
         'libfreetype.so'
         'libjpeg-turbo'
         'libpng'
         'libtheora'
         'libva-drm.so'
         'libva.so'
         'libva-x11.so'
         'libvorbisenc.so'
         'libvorbis.so'
         'libwebp'
         'libx11'
         'libx264.so'
         'opus'
         'skia-sharp60'
         'sqlite'
         'zlib'
         'zvbi')
makedepends=('ffnvcodec-headers'
             'nasm')
provides=('emby-server')
conflicts=('emby-server')
source=("https://github.com/MediaBrowser/Emby.Releases/releases/download/${pkgver}/embyserver-netcore_${pkgver}.zip"
        "https://mediabrowser.github.io/embytools/ffmpeg-${_ffmpeg_ver}.tar.gz"
        "https://mediabrowser.github.io/embytools/ffdetect_${_ffdetect_ver}_x64.tar.xz"
        'emby-server'
        'emby-server.conf'
        'emby-server.service'
        'emby-server.sysusers'
        'emby-server.tmpfiles'
        'license.docx')
noextract=(license.docx)
backup=('etc/conf.d/emby-server')
sha256sums=('4623f13f23c3865ee01839e2031bce5ad668173d96cafb4dcda7254548f77d8f'
            '1129e1bfb7fc4090cdd6e055d57b0cd90c9881f0db8b9ceb80fdd145de4ffc71'
            'c25eea4ace3824c7172e0b7cab57cc2baa459004680fed5fa645355205fe2c51'
            'e2185a5f4810726cb57fcc6d9bdbde1854069f08f163be58cb3cef1154b8e2a7'
            '5e3470f834808babe7d60b8d86f462e7945c3617499539e5af45eb55d7b87b23'
            'efdaabd3002fee13a6831e90fd700dea4d7c6c954ede00da6f28c1eada33ad8c'
            'f7fa33949757ffc587ecf82496dc35ebc8c8e5c98b882b31dc40a24263d3921a'
            '16ead857a1756e3e8cfc3e70f481d14d791a262b79733065a4f7371f21a97abe'
            'a6d7ea65dcb06392479a85e1a10a7aeb872d803da6f784f6935fcd4ee63008c6')

prepare() {
  rm -rf system/{electron,runtimes}
}

build() {
  cd ffmpeg-${_ffmpeg_ver}

  ./configure \
    --disable-doc \
    --disable-ffplay \
    --disable-shared \
    --disable-vdpau \
    --disable-libxcb \
    --disable-lzma \
    --disable-sdl2 \
    --disable-xlib \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-libaom \
    --enable-libass \
    --enable-libdrm \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libmp3lame \
    --enable-libopus \
    --enable-libtheora \
    --enable-libvorbis \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libzvbi \
    --enable-version3 \
    --enable-nvdec \
    --enable-nvenc \
    --enable-static \
    --enable-vaapi
  make
}

package() {
  install -dm 755 "${pkgdir}"/usr/lib
  cp -dr --no-preserve='ownership' system "${pkgdir}"/usr/lib/emby-server
  ln -s ../libSkiaSharp.so.60.0.0 "${pkgdir}"/usr/lib/emby-server/libSkiaSharp.so
  install -Dm 755 emby-server -t "${pkgdir}"/usr/bin/
  install -Dm 755 bin/ffdetect "${pkgdir}"/usr/bin/ffdetect-emby
  install -Dm 755 ffmpeg-${_ffmpeg_ver}/ffmpeg "${pkgdir}"/usr/bin/ffmpeg-emby
  install -Dm 755 ffmpeg-${_ffmpeg_ver}/ffprobe "${pkgdir}"/usr/bin/ffprobe-emby
  install -Dm 644 emby-server.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 emby-server.sysusers "${pkgdir}"/usr/lib/sysusers.d/emby-server.conf
  install -Dm 644 emby-server.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/emby-server.conf
  install -Dm 644 emby-server.conf "${pkgdir}"/etc/conf.d/emby-server
  install -Dm 644 license.docx -t "${pkgdir}"/usr/share/licenses/emby-server/
}
