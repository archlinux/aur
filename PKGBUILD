# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=blackmagic-decklink-sdk
pkgver=10.9.3
pkgrel=3
pkgdesc='Blackmagic DeckLink SDK'
arch=('any')
url='https://www.blackmagicdesign.com/support/family/capture-and-playback'
license=('custom')
provides=('decklink-sdk')
conflicts=('decklink-sdk')
source=('LICENSE')
sha256sums=('cc90e53ac2ef2442d2d0adfe9214119baa31ec080e75c3b087365efdbccc23df')

_srcfile="Blackmagic_DeckLink_SDK_${pkgver}.zip"
_downloadid='07f27b20a4934e98a104e87cbdce746a'
_referid='8de2ef2e14414ad49f7da5fe687d72f3'
_srcurl="https://www.blackmagicdesign.com/api/register/us/download/${_downloadid}"
_expected_sha256sum='ce7e925f862633cbec79c302c10eba672bbed773a56349f09e86eefb8c4529fe'

_useragent="User-Agent: Mozilla/5.0 (X11; Linux x86_64) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/59.0.3071.115 \
                        Safari/537.36"
_reqjson="{ \
    \"platform\": \"Linux\", \
    \"country\": \"us\", \
    \"firstname\": \"Arch\", \
    \"lastname\": \"Linux\", \
    \"email\": \"someone@archlinux.org\", \
    \"phone\": \"202-555-0194\", \
    \"state\": \"AUR\", \
    \"city\": \"pacman\", \
    \"hasAgreedToTerms\": true, \
    \"product\": \"Desktop Video ${pkgver} SDK\" \
}"
_useragent="$(printf '%s' "$_useragent" | sed 's/[[:space:]]\+/ /g')"
_reqjson="$(  printf '%s' "$_reqjson"   | sed 's/[[:space:]]\+/ /g')"

_exit_makepkg() {
    printf '%s\n' "error: failed to ${1} ${_srcfile}"
    exit 1
}

prepare() {
    # check if decklink sdk zip file was already downloaded
    if ! [ -f "../${_srcfile}" ] 
    then
        # download decklink sdk zip file from website
        msg2 "Downloading ${_srcfile} from website..."
        curl \
            -o "../${_srcfile}" \
            -H 'Host: sw.blackmagicdesign.com' \
            -H 'Upgrade-Insecure-Requests: 1' \
            -H "$_useragent" \
            -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' \
            -H 'Accept-Language: en-US,en;q=0.8' \
            --compressed \
            "$(curl \
                -s \
                -H 'Host: www.blackmagicdesign.com' \
                -H 'Accept: application/json, text/plain, */*' \
                -H 'Origin: https://www.blackmagicdesign.com' \
                -H "$_useragent" \
                -H 'Content-Type: application/json;charset=UTF-8' \
                -H "Referer: https://www.blackmagicdesign.com/support/family/capture-and-playback/download/${_referid}/Linux" \
                -H 'Accept-Language: en-US,en;q=0.8' \
                -H 'Cookie: _ga=GA1.3.853760154.1498322710; _gid=GA1.3.606965387.1499872692; _gat=1' \
                --data-binary "$_reqjson" \
                --compressed \
                "$_srcurl" \
            )" || _exit_makepkg 'download'
    else
        msg2 "Found ${_srcfile}"
    fi
    
    # check integrity of the decklink sdk zip file (file validation)
    msg2 "Validating ${_srcfile} with sha256sum..."
    local _real_sha256sum="$(openssl dgst -sha256 "../${_srcfile}" || _exit_makepkg 'calculate SHA256 of')"
    _real_sha256sum="${_real_sha256sum##* }"
    printf '%s' "       ${_srcfile} ... "
    if [ "$_expected_sha256sum" = "$_real_sha256sum" ] 
    then
        printf '%s\n' 'Passed'
    else
        printf '%s\n' 'FAILED'
        exit 1
    fi
    
    # create symbolic link of decklink sdk zip file in $srcdir
    ln -sf "../${_srcfile}" "${srcdir}/${_srcfile}" || _exit_makepkg 'create symbolic link of'
    
    # extract decklink sdk zip file
    msg2 "Extracting ${_srcfile} with bsdtar..."
    bsdtar -xf "${_srcfile}" || _exit_makepkg 'extract'
}

package() {
    # directories creation
    mkdir -p "${pkgdir}/usr/include"
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    
    # includes
    cd "${srcdir}/Blackmagic DeckLink SDK ${pkgver}/Linux/include"
    install -D -m644 * "${pkgdir}/usr/include"
    
    # documentation
    cd "${srcdir}/Blackmagic DeckLink SDK ${pkgver}"
    install -D -m644 *.pdf "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
