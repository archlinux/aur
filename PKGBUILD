# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=pingo
pkgver=0.96.y2
pkgrel=1
pkgdesc='An experimental, fast Web PNG/JPG optimizer with visually lossless or lossy compression (uses wine)'
arch=('i686' 'x86_64')
url='http://css-ig.net/pingo/'
license=('unknown')
depends=('wine')
options=('!strip')
source=('shellutils-git'::'git+https://github.com/dbermond/shellutils.git')
sha256sums=('SKIP')
_expected_sha256sum='ca22ce3de05b2c4785a08e31e9673c65aba47cb8def0de0ff573da6386c352c7'
_upstream_version="$(printf '%s' "$pkgver" | sed 's|\.||2')"
_srcfile="pingo32-${_upstream_version}.zip"
_srcurl="https://css-ig.net/downloads/${pkgname}32.zip"
_useragent="User-Agent: Mozilla/5.0 (X11; Linux x86_64) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/65.0.3325.181 \
                        Safari/537.36"
_useragent="$(printf '%s' "$_useragent" | sed 's/[[:space:]]\+/ /g')"

_exit_makepkg() {
    printf '%s\n' "error: failed to ${1} ${_srcfile}"
    exit 1
}

prepare() {
    # check if pingo zip file was already downloaded
    if ! [ -f "../${_srcfile}" ] 
    then
        # download pingo zip file from website
        msg2 "Downloading ${_srcfile} from website..."
        curl \
            -o "../${_srcfile}" \
            -H 'Accept-Encoding: gzip, deflate, br' \
            -H 'Accept-Language: en-US,en;q=0.9' \
            -H 'Upgrade-Insecure-Requests: 1' \
            -H "$_useragent" \
            -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' \
            -H 'Referer: https://css-ig.net/pingo.php' \
            -H 'Cookie: HttpOnly; startBAK=R3415750288; HttpOnly; start=R118741669' \
            -H 'Connection: keep-alive' \
            --compressed \
            "$_srcurl" || _exit_makepkg 'download'
    else
        msg2 "Found ${_srcfile}.zip"
    fi
    
    # check the pingo zip file integrity (file validation)
    msg2 "Validating ${_srcfile} with sha256sum..."
    local _real_sha256sum="$(openssl dgst -sha256 "../${_srcfile}" || _exit_makepkg 'calculate SHA256 of')"
    _real_sha256sum="${_real_sha256sum##* }"
    printf '%s' "     ${_srcfile} ... "
    if [ "$_expected_sha256sum" = "$_real_sha256sum" ] 
    then
        printf '%s\n' 'Passed'
    else
        printf '%s\n' 'FAILED'
        exit 1
    fi
    
    # create symbolic link of pingo zip file in $srcdir
    ln -sf "../${_srcfile}" "${srcdir}/${_srcfile}" || _exit_makepkg 'create symbolic link of'
    
    # extract pingo zip file
    mkdir -p "${pkgname}-${pkgver}"
    cd       "${pkgname}-${pkgver}"
    bsdtar -xf ../"${_srcfile}" || _exit_makepkg 'extract'
}

package() {
    install -D -m755 "shellutils-git/image/${pkgname}"     "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "$pkgname"-"${pkgver}/${pkgname}.exe" "${pkgdir}/usr/share/${pkgname}/${pkgname}.exe"
}
