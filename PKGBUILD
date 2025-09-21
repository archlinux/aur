# Maintainer: oech3
pkgname=chromium-ffmpeg-bin
pkgver=8.0
pkgrel=1
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium (libavcodec 62 from ffmpeg.org)"
arch=('x86_64')
depends=(glibc)
conflicts=(${pkgname%-*}
{nwjs,vivaldi{,-snapshot}}-ffmpeg-codecs
opera{,-developer,-beta}-ffmpeg-codecs)
provides=("${conflicts[@]}")
url=https://github.com/oech3/Chromium-FFmpeg/releases
license=('LGPL-2.1-or-later')
install=${pkgname%-*}.install
source=($install
${pkgname%-*}.hook::https://aur.archlinux.org/cgit/aur.git/plain/${pkgname%-*}.hook?h=${pkgname%-*}
"${url}/download/${pkgver%_*}/ffmpeg-${pkgver%_*}-linux-x64.tar.zst"
)
sha256sums=('684a839ddd1aa3a25a938cad68867341fd43be10a0a8cce59487353b471d6005'
            'c6ce8624456bad1e34941af3fa4f0f21fed5f8c6f9687ee1e0daee10a72a0bbd'
            '6dfcc8da692f3b0e9617d0cca0eb9e309bb54738153abb4f07d5c6e6fdefdffa')

package() {
  install -d "$pkgdir"{/usr/lib/opera{,-beta,-developer}/lib_extra,/opt/vivaldi{,-snapshot}}
  _avcodec=62
  mv ${_so}.$_avcodec "$pkgdir"/usr/lib
  ln -sf ${_so}.$_avcodec "$pkgdir"/usr/lib/$_so
  sed "s/^Target=${pkgname%-*}.*/Target=${pkgname}/" ${pkgname%-*}.hook > ${pkgname}.hook
  install -Dm644 ${pkgname}.hook -t "$pkgdir"/usr/share/libalpm/hooks
  # Block DL and LD_PRELOAD
  touch "$pkgdir"/opt/vivaldi{,-snapshot}/${_so}.{7.5,7.6,7.7,7.8,7.9,8.0}
}
