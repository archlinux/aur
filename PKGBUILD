# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Bjorn Nostvold <bjorn.nostvold@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgname=emby-server-beta
pkgver=4.8.0.61
pkgrel=1
_ffmpeg_ver=2023_06_25
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
         'skia-sharp'
         'sqlite'
         'zvbi'
         'zlib')
makedepends=()
optdepends=('intel-media-sdk: Intel QuickSync support (requires Emby Premiere)'
            'nvidia-utils: Nvidia NVDEC/NVENC support (requires Emby Premiere)')
provides=('emby-server')
conflicts=('emby-server')
source=("https://github.com/MediaBrowser/Emby.Releases/releases/download/${pkgver}/embyserver-netcore_${pkgver}.zip"
        "https://mediabrowser.github.io/embytools/ffmpeg-${_ffmpeg_ver}-x64.tar.xz"
        'emby-server'
        'emby-server.conf'
        'emby-server.service'
        'license.docx')
noextract=('license.docx')
backup=('etc/conf.d/emby-server')
install=emby-server.install
sha256sums=('16b71bcf7663b6ee20ea56a46a921d6abdebf1cfd80bf7e97ce874c0289a69f5'
            '70db9e2c1d5eb4345e34a6329918219da12684dded8226afff0f779a4a12f78c'
            '0351d6e9118853e3aa275d62b67dce4444b3d85130b05fb889b2069f364f47ca'
            '8bd03d803e295bea89e9c7bad17e774218f8dc4be9826af124b1f83bc4b256b6'
            'a7f2e38d2d196984d1c1632c851215aea9072b3af998d10a6b68477ad886ea14'
            'a6d7ea65dcb06392479a85e1a10a7aeb872d803da6f784f6935fcd4ee63008c6')

prepare() {
  rm -rf system/{electron,runtimes/{osx,tizen*,win*}}
}

package() {
  install -dm 755 "${pkgdir}"/usr/lib
  cp -dr --no-preserve='ownership' system "${pkgdir}"/usr/lib/emby-server
  install -Dm 755 emby-server -t "${pkgdir}"/usr/bin/
  install -Dm 644 emby-server.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 emby-server.conf "${pkgdir}"/etc/conf.d/emby-server
  install -Dm 644 license.docx -t "${pkgdir}"/usr/share/licenses/$pkgname/license.docx

  install -dm 755 "${pkgdir}/opt/emby-server/bin"
  install -dm 755 "${pkgdir}/opt/emby-server/lib"

  cp -dr --no-preserve='ownership' bin "${pkgdir}/opt/emby-server"
  cp -dr --no-preserve='ownership' lib "${pkgdir}/opt/emby-server"
}
