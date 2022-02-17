# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=chunghwa-post-webatm
epoch=1
pkgver=1.2202.9.1
pkgrel=1
pkgdesc='WebATM plugin for Chunghwa Post (中華郵政 WebATM 元件)'
arch=(any)
url='https://webatm.post.gov.tw/'
license=(unknown)
depends=(wine-winscard lib32-gnutls lib32-pcsclite)
makedepends=(msitools gendesk pev imagemagick)
source=("ATMSetup-$pkgver.msi"::"https://webatm.post.gov.tw/postatm/cab/ATMSetup.msi"
        "$pkgname")
sha256sums=('6e5efba81938520e590e40d2b73b34a4bde28a5d6d61317def5a2148e5c8d205'
            '2a21dba5dea4132d3693cf3d6332cee2f3a0be650f0e19e76ece27cd834abb75')

prepare() {
  msiextract ATMSetup-$pkgver.msi
}

pkgver() {
  peres -v ATMXHRService.exe | grep 'Product Version' | cut -f 2 -d : | sed 's# ##g'
}

build() {
  peres -x ATMXHRService.exe
  for icon in resources/icons/*.ico; do
    dimension=$(identify -format "%wx%h" $icon)
    mkdir -p icons/$dimension/apps
    convert $icon icons/$dimension/apps/$pkgname.png
  done

  gendesk -n --pkgname "$pkgname" --name "Chunghwa Post WebATM" --categories "Office;Finance"
}

package() {
  install -Dm755 $pkgname -t "$pkgdir"/usr/bin
  install -Dm644 ATMXHRService.exe -t "$pkgdir"/usr/share/$pkgname
  install -Dm644 cert.pem -t "$pkgdir"/usr/share/$pkgname
  install -Dm644 prikey.pem -t "$pkgdir"/usr/share/$pkgname
  install -Dm644 cacert.pem "$pkgdir"/usr/share/ca-certificates/trust-source/anchors/Chunghwa_Post_ATM.crt
  install -Dm644 $pkgname.desktop -t "$pkgdir"/usr/share/applications
  install -Ddm755 "$pkgdir"/usr/share/icons
  cp -dr --no-preserve=ownership icons "$pkgdir"/usr/share/icons/hicolor
  ln -s /usr/share/ca-certificates/trust-source/anchors/Chunghwa_Post_ATM.crt "$pkgdir"/usr/share/$pkgname/cacert.pem
}

