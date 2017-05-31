# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=blackmagic-decklink-sdk
pkgver=10.9
pkgrel=5
pkgdesc="Blackmagic DeckLink SDK"
arch=('any')
url="https://www.blackmagicdesign.com/support/family/capture-and-playback"
license=('custom')
provides=('decklink-sdk')
conflicts=('decklink-sdk')
source=('LICENSE')
sha256sums=('cc90e53ac2ef2442d2d0adfe9214119baa31ec080e75c3b087365efdbccc23df')

_srcfile="Blackmagic_DeckLink_SDK_${pkgver}.zip"
_downloadid="70acb24d87294f33993ed055fa6a9a93"
_referid="9a0fb7d769a04badbd08928a7aaefb76"
_srcurl="https://www.blackmagicdesign.com/api/register/us/download/${_downloadid}"
_expected_sha256sum="584656b8e1c3c06e78bd35a9a7c6bef7795520ff9e24a48694de92e88c2c72df"

_useragent="User-Agent: Mozilla/5.0 (X11; Linux x86_64) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/58.0.3029.96 \
                        Safari/537.36"
_reqjson="{ \
    \"country\": \"us\", \
    \"platform\": \"Linux\", \
    \"firstname\": \"Arch\", \
    \"lastname\": \"Linux\", \
    \"email\": \"someone@archlinux.org\", \
    \"phone\": \"202-555-0194\", \
    \"city\": \"pacman\", \
    \"state\": \"AUR\", \
    \"terms\": true, \
    \"product\": \"Desktop Video ${pkgver} SDK\" \
}"

_exit_makepkg() {
    printf "%s\n" "error: failed to ${1} ${_srcfile}"
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
            -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
            -H 'Accept-Language: en-US,en;q=0.8' \
            --compressed \
            "$(curl \
                -s \
                -H 'Host: www.blackmagicdesign.com' \
                -H 'Accept: application/json, text/plain, */*' \
                -H 'Origin: https://www.blackmagicdesign.com' \
                -H "$_useragent" \
                -H 'Content-Type: application/json;charset=UTF-8' \
                -H "Referer: https://www.blackmagicdesign.com/support/download/${_referid}/Linux" \
                -H 'Accept-Language: en-US,en;q=0.8' \
                --data-binary "$_reqjson"\
                --compressed \
                "$_srcurl" \
            )" || _exit_makepkg "download"
    else
        msg2 "Found ${_srcfile}"
    fi
    
    # check integrity of the decklink sdk zip file (file validation)
    msg2 "Validating ${_srcfile} with sha256sum..."
    local _real_sha256sum="$(openssl dgst -sha256 "../${_srcfile}" || _exit_makepkg "calculate SHA256 of")"
    _real_sha256sum="${_real_sha256sum##* }"
    printf "%s" "       ${_srcfile} ... "
    if [ "$_expected_sha256sum" = "$_real_sha256sum" ] 
    then
        printf "%s\n" "Passed"
    else
        printf "%s\n" "FAILED"
        exit 1
    fi
    
    # create symbolic link of decklink sdk zip file in $srcdir
    ln -sf "../${_srcfile}" "${srcdir}/${_srcfile}" || _exit_makepkg "create symbolic link of"
    
    # extract decklink sdk zip file
    msg2 "Extracting ${_srcfile} with bsdtar..."
    bsdtar -xf "${_srcfile}" || _exit_makepkg "extract"
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
