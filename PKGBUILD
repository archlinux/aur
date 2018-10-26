# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=pingo-bin
pkgver=0.98.36
pkgrel=1
pkgdesc='An experimental, fast Web PNG/JPG optimizer with visually lossless or lossy compression (unix binary)'
arch=('x86_64')
url='https://css-ig.net/pingo'
license=('unknown')
provides=('pingo')
conflicts=('pingo')
options=('!strip')

# NOTE:
# upstream website has a blocker that prevents makepkg from downloading the
# source file when using the download link directly the 'source' array.

_expected_sha256sum='b052bde7cc8cbbcdefe13fa51890cd72196ac5dd9eb5d7a2d9cad57f48325f04'
_srcfile="pingo-nix-${pkgver}.zip"
_srcurl='https://css-ig.net/downloads/zip/pingo-nix.zip'
_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/70.0.3538.77 \
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
        printf '%s\n' "  -> Downloading ${_srcfile} from website..."
        curl \
            -o "../${_srcfile}" \
            -H 'Accept-Encoding: gzip, deflate, br' \
            -H 'Accept-Language: en-US,en;q=0.9' \
            -H 'Upgrade-Insecure-Requests: 1' \
            -H "$_useragent" \
            -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' \
            -H 'Referer: https://css-ig.net/pingo.php' \
            -H 'Cookie: HttpOnly; HttpOnly; HttpOnly; startBAK=R3415750288; start=R3918464565' \
            -H 'Connection: keep-alive' \
            --compressed \
            "$_srcurl" || _exit_makepkg 'download'
    else
        printf '%s\n' "  -> Found ${_srcfile}"
    fi
    
    # check the pingo zip file integrity (file validation)
    printf '%s\n' "  -> Validating ${_srcfile} with sha256sum..."
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
    bsdtar -xf "../${_srcfile}" || _exit_makepkg 'extract'
}

package() {
    install -D -m755 "${pkgname}-${pkgver}/pingo" -t "${pkgdir}/usr/bin"
}
