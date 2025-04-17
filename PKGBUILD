# Maintainer:
# Contributor: Michał Kopeć <michal@nozomi.space>

# https://www.catalog.update.microsoft.com/Search.aspx?q=xbox+adapter
# https://github.com/dlundqvist/xone/blob/master/install/firmware.sh

: ${_build_license:=true}

pkgname=xone-dongle-firmware
pkgver=1.0.46.1
pkgrel=2
pkgdesc="Xbox Wireless Controller Adapter firmware"
url="https://support.xbox.com/en-US/help/hardware-network/browse"
license=('LicenseRef-Microsoft')
arch=('any')

makedepends=(
  'html-xml-utils'
  'w3m'
)

_pkgsrc_1="xow_dongle-2017.07-1cd6a87c"
_pkgsrc_2="xow_dongle-2015.12-20810869"
_pkgext="cab"

noextract=(
  "$_pkgsrc_1.$_pkgext"
  "$_pkgsrc_2.$_pkgext"
)

source=(
  "$_pkgsrc_1.$_pkgext"::"http://download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/07/1cd6a87c-623f-4407-a52d-c31be49e925c_e19f60808bdcbfbd3c3df6be3e71ffc52e43261e.cab"
  "$_pkgsrc_2.$_pkgext"::"http://download.windowsupdate.com/d/msdownload/update/driver/drvs/2015/12/20810869_8ce2975a7fbaa06bcfb0d8762a6275a1cf7c1dd3.cab"
)
sha256sums=(
  '65736a84ff4036645b8f8ec602bed91ab6353019c9cb3233decab9feec0f6f04'
  'e6388a27a75756920de73af2468e3ad55d7afef59abc3a0b508094e091d19f08'
)

_terms_of_use="terms_of_use"
_terms_of_use_url="https://www.microsoft.com/en-us/legal/terms-of-use"

prepare() {
  # extract files
  for i in "${noextract[@]}"; do
    mkdir -p "${i%.*}"
    bsdtar -C "${i%.*}" -xf "$i"
  done

  # terms of use
  if [[ "${_build_license::1}" == "t" ]]; then
    curl -L --max-redirs 3 --no-progress-meter \
      -o "$_terms_of_use-1.html" \
      "$_terms_of_use_url"

    hxnormalize -x "$_terms_of_use-1.html" \
      | hxselect .row,.container \
      | hxremove script \
        1> "$_terms_of_use-2.html" \
        2> /dev/null

    w3m -O UTF-8 -cols 80 -dump "$_terms_of_use-2.html" > "$_terms_of_use.txt"
  fi
}

check() {
  sha256sum -c /dev/stdin << END
48084d9fa53b9bb04358f3bb127b7495dc8f7bb0b3ca1437bd24ef2b6eabdf66  $_pkgsrc_1/FW_ACC_00U.bin
080ce4091e53a4ef3e5fe29939f51fd91f46d6a88be6d67eb6e99a5723b3a223  $_pkgsrc_2/FW_ACC_00U.bin
END
}

package() {
  install -Dm644 "$_pkgsrc_1/FW_ACC_00U.bin" "$pkgdir/usr/lib/firmware/xow_dongle.bin"
  install -Dm644 "$_pkgsrc_2/FW_ACC_00U.bin" "$pkgdir/usr/lib/firmware/xow_dongle_045e_02e6.bin"

  if [[ "${_build_license::1}" == "t" ]]; then
    install -Dm644 "$_terms_of_use.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
  fi
}
