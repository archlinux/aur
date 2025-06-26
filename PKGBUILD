
pkgname=opera-ffmpeg-vivaldi-symlink
_ff=7.1.x
pkgver=136.2.ffmpeg$_ff
pkgrel=1
_viva=7.4
pkgdesc='Add codecs to Operas and vivaldi-snapshot'
arch=('x86_64')
url='https://chromium.googlesource.com/chromium/third_party/ffmpeg'
license=('LGPL2.1')
source=({off,on}-opera-bundled-ffmpeg.hook)
sha256sums=('08bf8603cb7b1dfe69ca28b4843c29cc96fd1faf01b37f123f2194ac33ff47a4'
            '530e7a0c919c1cd9ae703b3c28a013556d93eb98f4968127581111ad7830aa3e')
depends=(vivaldi-ffmpeg-codecs)
conflicts=(opera-{,developer-,beta-}ffmpeg-codecs{,-bin})
provides=("${conflicts[@]}" )
package() {
  install -d "${pkgdir}"/usr/lib
  ln -sf /opt/vivaldi/libffmpeg.so.$_viva "${pkgdir}"/usr/lib/libffmpeg.so # for NoExtract
  for p in "${pkgdir}"/usr/lib/opera{,-developer,-beta}/lib_extra
  do
    install -d "$p"
    ln -sf /opt/vivaldi/libffmpeg.so.$_viva "$p"/libffmpeg.so
  done
  # install -d "$pkgdir/opt/vivaldi-snapshot"
  # ln -sf /opt/vivaldi/libffmpeg.so.$_viva "$pkgdir"/opt/vivaldi-snapshot/libffmpeg.so.7.5
  # block strange preload
  install -Dm644 {off,on}-opera-bundled-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
}
