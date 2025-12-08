# Maintainer: xiota
# Contributor: Michał Kopeć <michal (at) nozomi.space>
# Contributor: Tomasz Pakuła <tomasz.pakula.oficjalny (at) gmail.com>

# https://www.catalog.update.microsoft.com/Search.aspx?q=xbox+adapter
# https://github.com/dlundqvist/xone/blob/master/install/firmware.sh

: ${_build_license:=true}

pkgname=xone-dongle-firmware
pkgver=2.0.0
pkgrel=1
pkgdesc="Xbox Wireless Controller Adapter firmware"
url="https://support.xbox.com/en-US/help/hardware-network/browse"
license=('LicenseRef-Microsoft')
arch=('any')

makedepends=(
  'html-xml-utils'
  'w3m'
)

_pkgsrc_1="xone_dongle_02e6"
_pkgsrc_2="xone_dongle_02fe"
_pkgsrc_3="xone_dongle_02f9"
_pkgsrc_4="xone_dongle_091e"
_pkgext="cab"

noextract=(
  "$_pkgsrc_1.$_pkgext"
  "$_pkgsrc_2.$_pkgext"
  "$_pkgsrc_3.$_pkgext"
  "$_pkgsrc_4.$_pkgext"
)

source=(
  "$_pkgsrc_1.$_pkgext"::"https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2017/03/2ea9591b-f751-442c-80ce-8f4692cdc67b_6b555a3a288153cf04aec6e03cba360afe2fce34.cab"
  "$_pkgsrc_2.$_pkgext"::"https://catalog.s.download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/07/1cd6a87c-623f-4407-a52d-c31be49e925c_e19f60808bdcbfbd3c3df6be3e71ffc52e43261e.cab"
  "$_pkgsrc_3.$_pkgext"::"https://catalog.s.download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/06/1dbd7cb4-53bc-4857-a5b0-5955c8acaf71_9081931e7d664429a93ffda0db41b7545b7ac257.cab"
  "$_pkgsrc_4.$_pkgext"::"https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2017/08/aeff215c-3bc4-4d36-a3ea-e14bfa8fa9d2_e58550c4f74a27e51e5cb6868b10ff633fa77164.cab"
)
sha256sums=('d89a72e8dc10b7c4f16d5c887fe7f54c34c22005ac1f360704d5d9462258ef32'
            '65736a84ff4036645b8f8ec602bed91ab6353019c9cb3233decab9feec0f6f04'
            '90dd91fb67460d387407fd8109c0e7d0f18f4b659be0f62db858a1849ead2ee0'
            '5a8fbad9521e58cc697a8734720ca497673098022d61d91a88be433002ccd8f2')

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
080ce4091e53a4ef3e5fe29939f51fd91f46d6a88be6d67eb6e99a5723b3a223  $_pkgsrc_1/FW_ACC_00U.bin
48084d9fa53b9bb04358f3bb127b7495dc8f7bb0b3ca1437bd24ef2b6eabdf66  $_pkgsrc_2/FW_ACC_00U.bin
0023a7bae02974834500c665a281e25b1ba52c9226c84989f9084fa5ce591d9b  $_pkgsrc_3/FW_ACC_CL.bin
e2710daf81e7b36d35985348f68a81d18bc537a2b0c508ffdfde6ac3eae1bad7  $_pkgsrc_4/FW_ACC_BR.bin
END
}

package() {
  install -Dm644 "$_pkgsrc_1/FW_ACC_00U.bin" "$pkgdir/usr/lib/firmware/xone_dongle_02e6.bin"
  install -Dm644 "$_pkgsrc_2/FW_ACC_00U.bin" "$pkgdir/usr/lib/firmware/xone_dongle_02fe.bin"
  install -Dm644 "$_pkgsrc_3/FW_ACC_CL.bin"  "$pkgdir/usr/lib/firmware/xone_dongle_02f9.bin"
  install -Dm644 "$_pkgsrc_4/FW_ACC_BR.bin"  "$pkgdir/usr/lib/firmware/xone_dongle_091e.bin"

  if [[ "${_build_license::1}" == "t" ]]; then
    install -Dm644 "$_terms_of_use.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
  fi
}
