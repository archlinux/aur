# Maintainer: oech3
pkgname=chromium-ffmpeg-bin
#_nw=0.102.1
_chromium=140.0.7339.23 # optimized more than nw-bin
pkgver=7.1.git.$_chromium # should be replaced with ffmpeg.org bin
pkgrel=1
_avcodec=62
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium M138+ (libavcodec ${_avcodec})"
arch=('x86_64')
optdepends=(nwjs)
conflicts=(vivaldi{,-snapshot}-ffmpeg-codecs chromium-ffmpeg)
provides=("${conflicts[@]}")
#url=https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt
url=https://chromium.googlesource.com/chromium/third_party/ffmpeg/ # should be replaced with ffmpeg.org
license=('LGPL-2.1-or-later')
install=remove-chromium-ffmpeg.install
source=($install replace-chromium-ffmpeg.hook
#"${url}/releases/download/${_nw}/${_nw}-linux-x64.zip"
"${_chromium}.tar.zst::https://repo.herecura.eu/herecura/x86_64/vivaldi-snapshot-ffmpeg-codecs-${_chromium}-1-x86_64.pkg.tar.zst"
)
sha256sums=('90549fe900b87703b86fba8fa5dead8082da9f1c5fcbd2be2e9c39f4879b27ce'
            '0f4500d0f35d1fa561c5c41ce808386bb36d0702227ba00d33bd423ed26260ed'
            '5806a8d697e33cccd99d16cf40c34ee2a5de1825ce601e9e022e42d542eafef2')

package() {
  install -Dm644 */*/${_so}* "$pkgdir"/usr/lib/${_so}.$_avcodec
  ln -svf /usr/lib/${_so}.$_avcodec "$pkgdir"/usr/lib/${_so}
  install -Dvm644 replace-chromium-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
  install -d "${pkgdir}"/opt/vivaldi{,-snapshot}
  for _n in 7.5 7.6 7.7 7.8 7.9 8.0 ; do
    ln -svf /usr/lib/${_so}.${_avcodec} "$pkgdir"/opt/vivaldi/${_so}.$_n
    ln -svf /usr/lib/${_so}.${_avcodec} "$pkgdir"/opt/vivaldi-snapshot/${_so}.$_n
  done
}
