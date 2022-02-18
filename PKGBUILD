# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Bjorn Nostvold <bjorn.nostvold@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgname=emby-server-beta
pkgver=4.7.0.24
pkgrel=1
_ffmpeg_ver=2021_02_27
_ffdetect_ver=2021_02_27
pkgdesc='Bring together your videos, music, photos, and live television'
arch=('x86_64')
url='https://emby.media'
license=('custom')
depends=('alsa-lib'
         'aom'
         'aspnet-runtime'
         'bzip2'
         'dotnet-runtime'
         'dotnet-host-bin'
         'expat'
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
sha256sums=('ada1011ec66d32815f2701d1558fa7914dbb0d3a4344722897c29f02541ce180'
            'dd587ddbde4c967695919d7f85b0f28e6d7262f55171f3e8052eef2f4a7f585c'
            '3e87c29f28a714e96ee62b2e1bac79215aa1b0fe6065f37ccebb33c84e05c64d'
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
    --enable-libdav1d \
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
  ln -s ../libSkiaSharp.so.68.0.0 "${pkgdir}"/usr/lib/emby-server/libSkiaSharp.so
  install -Dm 755 emby-server -t "${pkgdir}"/usr/bin/
  install -Dm 755 bin/ffdetect "${pkgdir}"/usr/bin/ffdetect-emby
  install -Dm 755 ffmpeg-${_ffmpeg_ver}_*/ffmpeg "${pkgdir}"/usr/bin/ffmpeg-emby
  install -Dm 755 ffmpeg-${_ffmpeg_ver}_*/ffprobe "${pkgdir}"/usr/bin/ffprobe-emby
  install -Dm 644 emby-server.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 emby-server.conf "${pkgdir}"/etc/conf.d/emby-server
  install -Dm 644 license.docx -t "${pkgdir}"/usr/share/licenses/$pkgname/license.docx
}
