# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Bjorn Nostvold <bjorn.nostvold@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgname=emby-server-beta
pkgver=4.8.0.21
pkgrel=1
_ffmpeg_ver=2022_05_07
_ffdetect_ver=2022_05_07
_skiasharp_ver=2.80.2
pkgdesc='Bring together your videos, music, photos, and live television'
arch=('x86_64')
url='https://emby.media'
license=('custom')
depends=('alsa-lib'
         'aom'
         'aspnet-runtime-6.0'
         'bzip2'
         'dotnet-runtime-6.0'
         'expat'
         'fontconfig'
         'fribidi'
         'glibc'
         'gmp'
         'gnutls'
         'lame'
         'libass.so'
         'libchromaprint.so'
	 'libdav1d.so'         
         'libdrm'
         'libfreetype.so'
         'libjpeg-turbo'
         'libmfx'
         'libpng'
         'libtesseract.so'
         'libtheora'
         'libva-drm.so'
         'libva.so'
         'libvorbisenc.so'
         'libvorbis.so'
         'libwebp'
         'libx264.so'
         'libx265.so'
         'ocl-icd'
         'opus'
         'sqlite'
         'zlib'
         'zvbi')
makedepends=('ffnvcodec-headers'
             'nasm'
             'zstd')
optdepends=('intel-media-sdk: Intel QuickSync support (requires Emby Premiere)'
            'nvidia-utils: Nvidia NVDEC/NVENC support (requires Emby Premiere)')
provides=('emby-server')
conflicts=('emby-server')
source=("https://github.com/MediaBrowser/Emby.Releases/releases/download/${pkgver}/embyserver-netcore_${pkgver}.zip"
#        "https://mediabrowser.github.io/embytools/ffmpeg-${_ffmpeg_ver}.tar.gz"
#        "https://mediabrowser.github.io/embytools/ffdetect-${_ffdetect_ver}-x64.tar.xz"
        "https://mediabrowser.github.io/embytools/emby-ffmpeg-bin-${_ffmpeg_ver}-1-x86_64.pkg.tar.zst"
        "https://mediabrowser.github.io/embytools/libskiasharp-${_skiasharp_ver}-x64.tar.xz"
        'emby-server'
        'emby-server.conf'
        'emby-server.service'
        'license.docx')
noextract=('license.docx'
           'emby-ffmpeg-bin-${_ffmpeg_ver}-1-x86_64.pkg.tar.zst')

backup=('etc/conf.d/emby-server')
install=emby-server.install
sha256sums=('dde43876048bf53fec19ec417feb6e6d29c6c775e7a412ddedaa9a4c59ae03c2'
            'cfa7c7dedd99990ea2b7d2e4228c53d25061caf5fce87a79ce29c4a6ffd27ff2'
            '7202499c296f1f1b80619e10322fceff2068e5e3ed36a3f96d3ae4c2427978bd'
            '0351d6e9118853e3aa275d62b67dce4444b3d85130b05fb889b2069f364f47ca'
            'd1a805284d8a1329f6f6e736423be747d8951c5a9600fbb79c13a6f9be7149c0'
            'a7f2e38d2d196984d1c1632c851215aea9072b3af998d10a6b68477ad886ea14'
            'a6d7ea65dcb06392479a85e1a10a7aeb872d803da6f784f6935fcd4ee63008c6')

prepare() {
  tar --use-compress-program=unzstd -xvf emby-ffmpeg-bin-${_ffmpeg_ver}-1-x86_64.pkg.tar.zst
  rm -rf system/{electron,runtimes/{osx,tizen*,win*}}
}

#build() {
#  cd ffmpeg-${_ffmpeg_ver}_*
#  export PKG_CONFIG_PATH=/usr/lib/ffnvcodec8.1/pkgconfig
#
#  ./configure \
#    --disable-doc \
#    --disable-ffplay \
#    --disable-shared \
#    --disable-vdpau \
#    --disable-libxcb \
#    --disable-lzma \
#    --disable-sdl2 \
#    --disable-xlib \
#    --enable-fontconfig \
#    --enable-gmp \
#    --enable-gnutls \
#    --enable-gpl \
#    --enable-libaom \
#    --enable-libass \
#    --enable-libdrm \
#    --enable-libfreetype \
#    --enable-libfribidi \
#    --enable-libmfx \
#    --enable-libmp3lame \
#    --enable-libopus \
#    --enable-libtheora \
#    --enable-libvorbis \
#    --enable-libwebp \
#    --enable-libx264 \
#    --enable-libx265 \
#    --enable-libzvbi \
#    --enable-lto \
#    --enable-nvdec \
#    --enable-nvenc \
#    --enable-static \
#    --enable-vaapi \
#    --enable-version3
#  make
#}

package() {
  install -dm 755 "${pkgdir}"/usr/lib
  cp -dr --no-preserve='ownership' system "${pkgdir}"/usr/lib/emby-server
#  ln -s ../libSkiaSharp.so.80.2.0 "${pkgdir}"/usr/lib/emby-server/libSkiaSharp.so
  install -Dm 755 emby-server -t "${pkgdir}"/usr/bin/
  install -Dm 755 opt/emby-server/bin/ffdetect "${pkgdir}"/usr/bin/ffdetect-emby
  install -Dm 755 opt/emby-server/bin/ffmpeg "${pkgdir}"/usr/bin/ffmpeg-emby
  install -Dm 755 opt/emby-server/bin/ffprobe "${pkgdir}"/usr/bin/ffprobe-emby
  install -Dm 755 lib/libSkiaSharp.so* -t "${pkgdir}"/usr/lib/emby-server/
  install -Dm 644 emby-server.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 emby-server.conf "${pkgdir}"/etc/conf.d/emby-server
  install -Dm 644 license.docx -t "${pkgdir}"/usr/share/licenses/$pkgname/license.docx
  cp -dr --no-preserve='ownership' opt/emby-server/licenses -t "${pkgdir}"/usr/share/licenses/$pkgname
}
