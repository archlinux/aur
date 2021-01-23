# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Muhammad Yahya Harlan <muhammad.harlan@binus.ac.id>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

_downloadid='f1506f10ac1d494aa9dc17acc07586c4'
_referid='ccc88cece70b4e74b91696b6fbb5a12c'
_siteurl="https://www.blackmagicdesign.com/api/register/us/download/${_downloadid}"
_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36"

_reqjson="{ \
    \"platform\": \"Linux\", \
    \"country\": \"us\", \
    \"firstname\": \"Arch\", \
    \"lastname\": \"Linux\", \
    \"email\": \"someone@archlinux.org\", \
    \"phone\": \"202-555-0194\", \
    \"state\": \"New York\", \
    \"city\": \"AUR\", \
    \"hasAgreedToTerms\": true, \
    \"product\": \"Desktop Video ${pkgver} SDK\" \
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

pkgname=decklink-sdk
pkgver=12.0
pkgrel=1
epoch=1
pkgdesc='Blackmagic DeckLink SDK'
arch=('any')
url='https://www.blackmagicdesign.com/support/family/capture-and-playback'
license=('custom')
makedepends=('poppler')
provides=('blackmagic-decklink-sdk')
conflicts=('blackmagic-decklink-sdk')
replaces=('blackmagic-decklink-sdk')
source=("Blackmagic_DeckLink_SDK_${pkgver}.zip"::"$_srcurl")
sha256sums=('89b34b05ae1fbe209129de767606300583bcce4266d9476293a43fe2e881fcf5')

prepare() {
    pdftotext -layout "Blackmagic DeckLink SDK ${pkgver}/End User License Agreement.pdf"
}

package() {
    install -D -m644 "Blackmagic DeckLink SDK ${pkgver}/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -dr --no-preserve='ownership' "Blackmagic DeckLink SDK ${pkgver}/Linux/include" "${pkgdir}/usr"
}
