# Maintainer: oech3
pkgname=chromium-ffmpeg-bin
pkgver=8.0
pkgrel=2
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium (with optimization unused at Chromium)"
arch=('x86_64')
conflicts=({nwjs,vivaldi{,-snapshot}}-ffmpeg-codecs chromium-ffmpeg{,-legacy}
opera{,-developer,-beta}-ffmpeg-codecs)
provides=("${conflicts[@]}")
url=https://ffmpeg.org/
license=('LGPL-2.1-or-later')
install=chromium-ffmpeg.install
source=($install chromium-ffmpeg.hook
"${pkgver}.tar.zst::https://github.com/oech3/nwjs-ffmpeg-prebuilt/releases/download/${pkgver}/ffmpeg-${pkgver}-linux-x64.tar.zst"
"7.1.1.tar.zst::https://github.com/oech3/nwjs-ffmpeg-prebuilt/releases/download/7.1.1/ffmpeg-7.1.1-linux-x64.tar.zst"
)
sha256sums=('684a839ddd1aa3a25a938cad68867341fd43be10a0a8cce59487353b471d6005'
            '6873b38d05e884f3f7fa1c2019ce380d717b3f95af75a1218fbd94a1054f65ad'
            '8516c86a2b5be442284ba9c52f77fdeeaee4f5ec06cb4b4b47d01180ffa4131a'
            '6a66823de576c92f0d5a103dd665885badaad2cd646aba7e9d6b2406d5a84b55')

package() {
  _avcodec=62
  install -Dm644 ${_so}.$_avcodec -t "$pkgdir"/usr/lib
  ln -sf /usr/lib/${_so}.$_avcodec "$pkgdir"/usr/lib/$_so
  install -Dm644 chromium-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
  install -d "${pkgdir}"/opt/vivaldi{,-snapshot}
  # Block DL binary
  touch "$pkgdir"/opt/vivaldi{,-snapshot}/${_so}.{7.5,7.6,7.7,7.8,7.9,8.0}

  _avcodec=61
  install -Dm644 ${_so}.$_avcodec -t "${pkgdir}"/usr/lib
  install -d "$pkgdir"/usr/lib/opera{,-beta}/lib_extra
  for _f in "$pkgdir"/usr/lib/opera{,-beta}/lib_extra
    do ln -sf /usr/lib/$_so.${_avcodec} "$_f/$_so"
  done
}
