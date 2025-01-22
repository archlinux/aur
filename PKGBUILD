# Maintainer:
# Contributor: Michał Kopeć <michal@nozomi.space>

pkgname=xone-dongle-firmware
pkgver=1.0.46.1
pkgrel=1
pkgdesc="Xbox Wireless Controller Adapter firmware"
url="https://support.xbox.com/en-US/help/hardware-network/browse"
license=('LicenseRef-Microsoft')
arch=('any')

makedepends=(
  'html-xml-utils'
  'pandoc'
)

source=("xow_dongle-$pkgver.cab"::"http://download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/07/1cd6a87c-623f-4407-a52d-c31be49e925c_e19f60808bdcbfbd3c3df6be3e71ffc52e43261e.cab")
sha256sums=('65736a84ff4036645b8f8ec602bed91ab6353019c9cb3233decab9feec0f6f04')

_terms_of_use="terms_of_use"
_terms_of_use_url="https://www.microsoft.com/en-us/legal/terms-of-use"

prepare() {
  # terms of use
  curl -L --no-progress-meter \
    -o "$_terms_of_use-1.html" \
    "$_terms_of_use_url"

  hxnormalize -x "$_terms_of_use-1.html" \
    | hxselect .row,.container \
    | hxremove script \
      1> "$_terms_of_use-2.html" \
      2> /dev/null

  pandoc --quiet -t plain -o "$_terms_of_use.txt" "$_terms_of_use-2.html"
}

package() {
  install -Dm644 "FW_ACC_00U.bin" "$pkgdir/usr/lib/firmware/xow_dongle.bin"
  install -Dm644 "$_terms_of_use.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
