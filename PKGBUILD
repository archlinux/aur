# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=tbb-combo-native-agent
pkgver=1.0.0.13
pkgrel=2
pkgdesc='Taiwan Business Bank combo native agent (臺灣企銀二合一元件)'
arch=(any)
url='https://ebank.tbb.com.tw/'
license=(unknown)
# Per https://bugs.winehq.org/show_bug.cgi?id=54661, 32-bit winscard.dll will be supported through wow64 thunks
depends=(wine-wow64 gnutls pcsclite)
makedepends=(p7zip gendesk pev)
source=("Install_TbbComboNativeAgentHost-$pkgver.exe"::"https://ebank.tbb.com.tw/nb3/COMPONENT/component_download?componentPath=win&trancode=ComponentDownload"
        "$pkgname")
sha256sums=('e1b67360e1b5670fe20ddf9bcbd86f431915657b85f974069d8cd89ebe6be1a3'
            'd53b1fa92ef27d426a390a6d1b56a0096bdfc37a60bc9700e79c7d982796994c')

prepare() {
  7z x Install_TbbComboNativeAgentHost-$pkgver.exe
}

pkgver() {
  peres -v TbbComboNativeAgentHost.exe | grep 'Product Version' | cut -f 2 -d : | sed 's# ##g'
}

build() {
  gendesk -n --pkgname "$pkgname" \
    --name "Taiwan Business Bank combo native agent" \
    --icon /usr/share/pixmaps/TbbComboNativeAgentHost.ico \
    --categories "Office;Finance"
  # No direct support for translations https://github.com/xyproto/gendesk/issues/15
  echo "Name[zh_TW]=臺灣企銀二合一元件" >> $pkgname.desktop
}

package() {
  install -Dm755 $pkgname -t "$pkgdir"/usr/bin
  install -Dm644 TbbComboNativeAgentHost.exe -t "$pkgdir"/usr/share/$pkgname
  install -Dm644 $pkgname.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 TbbComboNativeAgentHost.ico -t "$pkgdir"/usr/share/pixmaps
}
