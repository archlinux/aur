# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Bjorn Nostvold <bjorn.nostvold@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgname=emby-server-beta
pkgver=4.8.0.1
pkgrel=1
_ffmpeg_ver=2022_05_07
_ffdetect_ver=2022_05_07
pkgdesc='Bring together your videos, music, photos, and live television'
arch=('x86_64')
url='https://emby.media'
license=('custom')
depends=('alsa-lib'
         'aom'
         'aspnet-runtime'
         'bzip2'
         'dotnet-runtime'
 #        'dotnet-host-bin'
         'expat'
         'ffmpeg'
         'fontconfig'
         'fribidi'
         'glibc'
         'gmp'
         'gnutls'
         'lame'         
         'libass.so'
	 'libdav1d.so'         
         'libdrm'
         'libfreetype.so'
         'libjpeg-turbo'
         'libmfx'
         'libpng'
         'libtheora'
         'libva-drm.so'
         'libva.so'
         'libvorbisenc.so'
         'libvorbis.so'
         'libwebp'
         'libx264.so'
         'libx265.so'
         'opus'
         'skia-sharp'
         'sqlite'
         'zlib'
         'zvbi')
makedepends=('ffnvcodec-headers8.1'
             'nasm')
optdepends=('intel-media-sdk: Intel QuickSync support (requires Emby Premiere)'
            'nvidia-utils: Nvidia NVDEC/NVENC support (requires Emby Premiere)')
provides=('emby-server')
conflicts=('emby-server')
source=("https://github.com/MediaBrowser/Emby.Releases/releases/download/${pkgver}/embyserver-netcore_${pkgver}.zip"
        "https://mediabrowser.github.io/embytools/ffmpeg-${_ffmpeg_ver}.tar.gz"
        "https://mediabrowser.github.io/embytools/ffdetect-${_ffdetect_ver}-x64.tar.xz"
        'emby-server'
        'emby-server.conf'
        'emby-server.service'
        'license.docx')
noextract=(license.docx)
backup=('etc/conf.d/emby-server')
install=emby-server.install
sha256sums=('640be5a28df54dc3e575b618d870762de66620183983555e98a99c8009ae3e26'
            '44506c7c4fa41c721819f9b530b021e11921ea2a1332ce947d8af5a06a2df01e'
            '4ed857c4e8145db71c87dd25c3978d7592ad115fa4933c2fedccb0c59e0b031c'
            '0351d6e9118853e3aa275d62b67dce4444b3d85130b05fb889b2069f364f47ca'
            '5e3470f834808babe7d60b8d86f462e7945c3617499539e5af45eb55d7b87b23'
            'a7f2e38d2d196984d1c1632c851215aea9072b3af998d10a6b68477ad886ea14'
            'a6d7ea65dcb06392479a85e1a10a7aeb872d803da6f784f6935fcd4ee63008c6')

prepare() {
  rm -rf system/{electron,runtimes/{osx,tizen*,win*}}
}

build() {
  cd ffmpeg-${_ffmpeg_ver}_*
  export PKG_CONFIG_PATH=/usr/lib/ffnvcodec8.1/pkgconfig

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
    --enable-libmfx \
    --enable-libmp3lame \
    --enable-libopus \
    --enable-libtheora \
    --enable-libvorbis \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libzvbi \
    --enable-lto \
    --enable-nvdec \
    --enable-nvenc \
    --enable-static \
    --enable-vaapi \
    --enable-version3
  make
}

package() {
  install -dm 755 "${pkgdir}"/usr/lib
  cp -dr --no-preserve='ownership' system "${pkgdir}"/usr/lib/emby-server
  ln -s ../libSkiaSharp.so.80.2.0 "${pkgdir}"/usr/lib/emby-server/libSkiaSharp.so
  install -Dm 755 emby-server -t "${pkgdir}"/usr/bin/
  install -Dm 755 bin/ffdetect "${pkgdir}"/usr/bin/ffdetect-emby
  install -Dm 755 ffmpeg-${_ffmpeg_ver}_*/ffmpeg "${pkgdir}"/usr/bin/ffmpeg-emby
  install -Dm 755 ffmpeg-${_ffmpeg_ver}_*/ffprobe "${pkgdir}"/usr/bin/ffprobe-emby
  install -Dm 644 emby-server.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 emby-server.conf "${pkgdir}"/etc/conf.d/emby-server
  install -Dm 644 license.docx -t "${pkgdir}"/usr/share/licenses/$pkgname/license.docx
}
