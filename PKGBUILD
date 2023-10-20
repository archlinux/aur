# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

# This was originally written by Daniel Bermond in "decklink-sdk" PKGBUILD
# It is sufficient to just replace _downloadid to correspond new release version
# It can be obtained from Chromium or Firefox -> Developer Tools -> Network -> XHR -> click latest-version and copy downloadId

_downloadid='43b60f54db324712a898333b1799b2d0'
_referid='c41e38faf1ab428b99c3223d1008ab5b'
_siteurl="https://www.blackmagicdesign.com/api/register/us/download/${_downloadid}"
_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.198 Safari/537.36"

_reqjson="{ \
    \"platform\": \"Linux\", \
    \"country\": \"us\", \
    \"firstname\": \"Arch\", \
    \"lastname\": \"Linux\", \
    \"email\": \"someone@archlinux.org\", \
    \"phone\": \"202-555-0194\", \
    \"state\": \"New York\", \
    \"city\": \"AUR\", \
    \"street\": \"PKGBUILD Street\", \
    \"policy\": true, \
    \"hasAgreedToTerms\": true, \
    \"product\": \"Blackmagic RAW ${pkgver%_*}\" \
}"

_srcurl="$(curl \
            -s \
            -H "$_useragent" \
            -H 'Content-Type: application/json;charset=UTF-8' \
            -H "Referer: https://www.blackmagicdesign.com/support/download/${_referid}/Linux" \
            --data-ascii "$_reqjson" \
            --compressed \
            "$_siteurl")"

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' -C - --retry 3 --retry-delay 3 \
              -H Upgrade-Insecure-Requests:\ 1 \
              -H ${_useragent// /\\ } \
              -o %o \
              --compressed \
              %u")

pkgname=blackmagic-raw-sdk
pkgver=3.4
pkgrel=1
arch=('x86_64')
pkgdesc="SDK to handle Blackmagic RAW files (.braw)"
url="https://www.blackmagicdesign.com/products/blackmagicraw"
license=('custom')
depends=('hicolor-icon-theme' 'qt5-multimedia' 'libc++')
makedepends=('unrtf')
optdepends=('nvidia-utils: CUDA support'
            'ocl-icd: OpenCL support')
options=('!strip')
source=("Blackmagic_RAW_Linux_$pkgver.tar.gz::$_srcurl")
b2sums=('1c858388b3a76f7a51f7670286c5057ce14329c7c7167ac1edf2a26b010cfc709836031e343be30b4226778a1734acd83a0a418404317f45898f8304c5f442e9')

prepare(){
  cd "Blackmagic RAW"

  bsdtar -xf blackmagic-raw-${pkgver%_*}.$CARCH.rpm
  unrtf --text "./usr/lib64/blackmagic/BlackmagicRAWPlayer/Third Party Licenses.rtf" > \
               "BlackmagicRAWPlayer-Third Party Licenses.txt"
  unrtf --text "./usr/lib64/blackmagic/BlackmagicRAWSDK/Documents/Third Party Licenses.rtf" > \
               "BlackmagicRAWSDK-Third Party Licenses.txt"
  unrtf --text "./usr/lib64/blackmagic/BlackmagicRAWSpeedTest/Third Party Licenses.rtf" > \
               "BlackmagicRAWSpeedTest-Third Party Licenses.txt"
}

package() {
  cd "Blackmagic RAW"

  for module in BlackmagicRAWPlayer BlackmagicRAWSDK BlackmagicRAWSpeedTest; do
      install -d "$pkgdir/usr/share/licenses/$pkgname/$module"
      cp --no-preserve=ownership "$module-Third Party Licenses.txt" \
                                 "$pkgdir/usr/share/licenses/$pkgname/$module/Third Party Licenses.txt"
  done

  cp --no-preserve=ownership "./usr/lib64/blackmagic/BlackmagicRAWSDK/Documents/License.txt" \
                             "$pkgdir/usr/share/licenses/$pkgname/BlackmagicRAWSDK"

  cp -dr --no-preserve=ownership "./usr/share" "$pkgdir/usr"
  cp -dr --no-preserve=ownership "./usr/lib64" "$pkgdir/usr/lib"

  install -d "$pkgdir/usr/bin" ; cd "$pkgdir/usr/bin"
  
  ln -s ../lib/blackmagic/BlackmagicRAWPlayer/BlackmagicRAWPlayer ./blackmagicraw-player
  ln -s ../lib/blackmagic/BlackmagicRAWSpeedTest/BlackmagicRAWSpeedTest ./blackmagicraw-speedtest
}
