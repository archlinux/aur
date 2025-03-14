# Maintainer: Florian Hülsmann <fh@cbix.de>

DLAGENTS=("https::./dlagent.sh %o %u")
pkgname=vcvrack-pro
pkgver=2.6.1
pkgrel=1
pkgdesc='Virtual modular synthesizer (requires logged in Pro account)'
arch=(x86_64)
url='https://vcvrack.com/'
license=(LicenseRef-EULA)
groups=(pro-audio clap-plugins vst-plugins vst3-plugins)
provides=(vcvrack)
depends=()
makedepends=(jq)
optdepends=('clap-host: for running the CLAP plugin'
            'vst-host: for running the VST plugin'
            'vst3-host: for running the VST3 plugin')
source_x86_64=("$pkgname-$pkgver.zip::https://vcvrack.com/RackProDownload?version=$pkgver&arch=lin-x64")
source=('vcvrack-pro.sh'
        'vcvrack-pro.desktop')
sha256sums=('1d079a8ca01b2f36ab08f42f8abe408a1bc0109f296b91a181a7f845e9fbb01f'
            '850bab3769f7778e97293c0ecc5fd77e33d253504ebd8f3b60e937cc4584d418')
sha256sums_x86_64=('f3d984113d7b88637c996f55d69d26962e08e5b1765f82aacfd036d4a903da48')

package() {
  depends+=(gcc-libs glibc libx11 libasound.so libGL.so libpulse.so libpulse-simple.so libjack.so)
  # the audio plugins won't work with /opt/vcvrack-pro
  install -d "$pkgdir"/opt/VCV
  cp -va Rack2Pro -t "$pkgdir"/opt/VCV
  install -vDm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -vDm644 $pkgname.desktop -t "$pkgdir"/usr/share/applications
  install -vDm755 'VCV Rack 2.clap' -t "$pkgdir"/usr/lib/clap
  install -vDm755 *.so -t "$pkgdir"/usr/lib/vst
  install -vDm755 "VCV Rack 2.vst3/Contents/$CARCH-linux/VCV Rack 2.so" -t "$pkgdir/usr/lib/vst3/VCV Rack 2.vst3/Contents/$CARCH-linux"
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/opt/VCV/Rack2Pro/LICENSE* "$pkgdir"/usr/share/licenses/$pkgname
}
