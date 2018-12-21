# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=pingo
pkgver=0.98.48
pkgrel=1
pkgdesc='An experimental, fast Web PNG/JPG optimizer with visually lossless or lossy compression (uses wine)'
arch=('x86_64')
url='https://css-ig.net/pingo'
license=('unknown')
depends=('wine')
options=('!strip')
source=("pingo-${pkgver}.zip"::'https://css-ig.net/downloads/zip/pingo.zip'
        'git+https://github.com/dbermond/shellutils.git')
noextract=("pingo-${pkgver}.zip")
sha256sums=('f83a55e50ce452f6e1ffbbd68d3677682e2b41575777ca5a8be6883454fbec7a'
            'SKIP')

_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/71.0.3578.98 \
                        Safari/537.36"

_useragent="$(printf '%s' "$_useragent" | sed 's/[[:space:]]\+/\\ /g')"

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' -LC - --retry 3 --retry-delay 3 \
              -H Accept-Encoding:\ gzip,\ deflate,\ br \
              -H Accept-Language:\ en-US,en;q=0.9 \
              -H Upgrade-Insecure-Requests:\ 1 \
              -H ${_useragent} \
              -H Accept:\ text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8 \
              -H Referer:\ https://css-ig.net/pingo.php \
              -H Cookie:\ HttpOnly;\ HttpOnly;\ HttpOnly;\ startBAK=R3415750288;\ start=R3918464565 \
              -H Connection:\ keep-alive \
              -o %o \
              --compressed \
              %u")

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    bsdtar -xf "../pingo-${pkgver}.zip"
}

package() {
    install -D -m755 "shellutils/image/pingo"         -t "${pkgdir}/usr/bin"
    install -D -m644 "${pkgname}-${pkgver}/pingo.exe" -t "${pkgdir}/usr/share/${pkgname}"
}
