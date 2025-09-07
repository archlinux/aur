# Maintainer: oech3
pkgname=chromium-ffmpeg-bin
pkgver=8.0
pkgrel=3
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium (libavcodec 62~61 from ffmpeg.org)"
arch=('x86_64')
conflicts=({nwjs,vivaldi{,-snapshot}}-ffmpeg-codecs chromium-ffmpeg{,-legacy}
opera{,-developer,-beta}-ffmpeg-codecs)
provides=("${conflicts[@]}")
url=https://github.com/oech3/Chromium-FFmpeg/
license=('LGPL-2.1-or-later')
install=chromium-ffmpeg.install
source=($install chromium-ffmpeg.hook
"${url}releases/download/${pkgver}/ffmpeg-${pkgver}-linux-x64.tar.zst"
"${url}releases/download/7.1.1/ffmpeg-7.1.1-linux-x64.tar.zst"
)
sha256sums=('684a839ddd1aa3a25a938cad68867341fd43be10a0a8cce59487353b471d6005'
            '6873b38d05e884f3f7fa1c2019ce380d717b3f95af75a1218fbd94a1054f65ad'
            '6dfcc8da692f3b0e9617d0cca0eb9e309bb54738153abb4f07d5c6e6fdefdffa'
            '965b361ff193c15dec88a659f7c03c241e0ab319f86507fede33538b86769da5')

package() {
  _avcodec=62
  install -d "$pkgdir"/usr/lib/opera{,-beta}/lib_extra
  mv ${_so}.$_avcodec "$pkgdir"/usr/lib
  ln -sf /usr/lib/${_so}.$_avcodec "$pkgdir"/usr/lib/$_so
  install -Dm644 chromium-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
  install -d "${pkgdir}"/opt/vivaldi{,-snapshot}
  # Block DL binary
  touch "$pkgdir"/opt/vivaldi{,-snapshot}/${_so}.{7.5,7.6,7.7,7.8,7.9,8.0}

  _avcodec=61
  mv ${_so}.$_avcodec "${pkgdir}"/usr/lib
  for _f in "$pkgdir"/usr/lib/opera{,-beta}/lib_extra
    do ln -sf /usr/lib/${_so}.$_avcodec "$_f/$_so"
  done
}
