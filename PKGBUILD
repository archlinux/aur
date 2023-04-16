# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

# This was originally written by Daniel Bermond in "decklink-sdk" PKGBUILD
# It is sufficient to just replace _downloadid to correspond new release version
# It can be obtained from Chromium or Firefox -> Developer Tools -> Network -> XHR -> click latest-version and copy downloadId

_downloadid='553241db47fd46d0a9c19665337eefae'
_referid='9ec66481444447eeb66bb665a329dd4f'
_siteurl="https://www.blackmagicdesign.com/api/register/us/download/${_downloadid}"

_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/88.0.4324.146 \
                        Safari/537.36"

_reqjson="{ \
    \"firstname\": \"Arch\", \
    \"lastname\": \"Linux\", \
    \"email\": \"someone@archlinux.org\", \
    \"phone\": \"202-555-0194\", \
    \"country\": \"us\", \
    \"state\": \"New York\", \
    \"city\": \"AUR\", \
    \"hasAgreedToTerms\": true, \
    \"product\": \"Blackmagic RAW ${pkgver%_*} Beta ${pkgver#*b}\" \
}"

_reqjson="$(  printf '%s' "$_reqjson"   | sed 's/[[:space:]]\+/ /g')"
_useragent="$(printf '%s' "$_useragent" | sed 's/[[:space:]]\+/ /g')"
_useragent_escaped="${_useragent// /\\ }"

_srcurl="$(curl \
            -s \
            -H 'Host: www.blackmagicdesign.com' \
            -H 'Accept: application/json, text/plain, */*' \
            -H 'Origin: https://www.blackmagicdesign.com' \
            -H "$_useragent" \
            -H 'Content-Type: application/json;charset=UTF-8' \
            -H "Referer: https://www.blackmagicdesign.com/support/download/${_referid}/Linux" \
            -H 'Accept-Encoding: gzip, deflate, br' \
            -H 'Accept-Language: en-US,en;q=0.9' \
            -H 'Authority: www.blackmagicdesign.com' \
            -H 'Cookie: _ga=GA1.2.1849503966.1518103294; _gid=GA1.2.953840595.1518103294' \
            --data-ascii "$_reqjson" \
            --compressed \
            "$_siteurl")"

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' -C - --retry 3 --retry-delay 3 \
              -H Host:\ sw.blackmagicdesign.com \
              -H Upgrade-Insecure-Requests:\ 1 \
              -H ${_useragent_escaped} \
              -H Accept:\ text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8 \
              -H Accept-Language:\ en-US,en;q=0.9 \
              -o %o \
              --compressed \
              %u")

pkgname=blackmagic-raw-sdk
pkgver=3.0
pkgrel=1
arch=('x86_64')
pkgdesc="SDK to handle Blackmagic RAW files (.braw)"
url="https://www.blackmagicdesign.com/products/blackmagicraw"
license=('custom')
depends=('hicolor-icon-theme' 'qt5-multimedia' 'libc++')
makedepends=('rpmextract' 'unrtf')
optdepends=('nvidia-utils: CUDA support'
            'ocl-icd: OpenCL support')
options=('!strip')
source=("Blackmagic_RAW_Linux_$pkgver.tar.gz::$_srcurl")
sha512sums=('2eb8741d380cb90aba71067f1a9cd2bdc124fae4f6423881e631f5cc5ef00b05e7f7363e7ff02562bcb71612385230f1c8251e1759fdcbeaf2615d9e82a1cac9')

prepare(){
  cd "Blackmagic RAW"

  rpmextract.sh blackmagic-raw-${pkgver%_*}.$CARCH.rpm
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
