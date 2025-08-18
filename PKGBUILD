# Maintainer: oech3
pkgname=chromium-ffmpeg-bin
_nw=0.102.1
pkgver=7.1.git.nw$_nw # should be replaced to ffmpeg.org build
pkgrel=1
_avcodec=62
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium M138+ (libavcodec ${_avcodec})"
arch=('x86_64')
optdepends=(nwjs)
conflicts=(vivaldi{,-snapshot}-ffmpeg-codecs chromium-ffmpeg)
provides=("${conflicts[@]}")
url=https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt
license=('LGPL-2.1-or-later')
install=remove-chromium-ffmpeg.install
source=($install replace-chromium-ffmpeg.hook
"${url}/releases/download/${_nw}/${_nw}-linux-x64.zip")
sha256sums=('90549fe900b87703b86fba8fa5dead8082da9f1c5fcbd2be2e9c39f4879b27ce'
            '0f4500d0f35d1fa561c5c41ce808386bb36d0702227ba00d33bd423ed26260ed'
            '9fe1ef70e837422794bbfd84cdcfab93cd1771e8a89c78c813ec401ff324a007')

package() {
  install -Dm644 $_so "$pkgdir"/usr/lib/${_so}.$_avcodec
  ln -svf /usr/lib/${_so}.$_avcodec "$pkgdir"/usr/lib/${_so}
  install -Dvm644 replace-chromium-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
  install -d "${pkgdir}"/opt/vivaldi{,-snapshot}
  for _n in 7.5 7.6 7.7 7.8 7.9 8.0 ; do
    ln -svf /usr/lib/${_so}.${_avcodec} "$pkgdir"/opt/vivaldi/${_so}.$_n
    ln -svf /usr/lib/${_so}.${_avcodec} "$pkgdir"/opt/vivaldi-snapshot/${_so}.$_n
  done
}
