# Contributer: Thomas Eizinger <thomas@eizinger.io>
# Maintainer: Evine Deng <evinedeng@hotmail.com>

pkgname=photoprism
pkgver=240531.60b3a4628
_pkgver=$(echo "$pkgver" | sed 's|\.|-|')
pkgrel=4
pkgdesc="AI-Powered Photos App for the Decentralized Web"
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/${pkgname}/${pkgname}"
license=('AGPL-3.0-or-later')
depends=("libvips" "openjpeg2" "photoprism-facenet" "photoprism-nasnet" "photoprism-nsfw" "photoprism-tensorflow")
makedepends=("go" "libvips" "npm" "openjpeg2" "photoprism-tensorflow")
optdepends=("darktable: for RAW to JPEG conversion"
            "ffmpeg: for video transcoding and thumbnail extraction"
            "imagemagick: for image conversion"
            "libheif: for HEIC/HEIF image conversion"
            "perl-image-exiftool: for extracting metadata"
            "rawtherapee: for RAW to JPEG conversion")
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.user.service"
        "defaults.yml")
sha256sums=('e5c0e2dcc9c1bb1773776281a328540093386d577946aeee5e21d1e099758864'
            '5a7e0f788b1df05f13abb167385063a60c9c5b21486d24c12d6676ac580623bd'
            '0aa3f0b94865d2b28d9ecc9e3da14f45525b476b7bdf49f2b2139978908b1c48'
            '9121b27be5728b3eb34dc694ddbecc6d291a4a6906db978552927b4f8f83019d'
            '3a64717e95fae2b29099b325bb5fd26fd39b05157ca3e5b2075e44bb60a0e5a4'
            '183071393262906f6416e27c14d2519fe537614e62866c2a93270b47355d97ae')

build() {
    cd "${pkgname}-${_pkgver}"
    local buildid="${_pkgver}-$(uname -s)-$(uname -m)"
    local ldflags="
        -extldflags '-L/usr/lib/${pkgname}-tensorflow -Wl,-rpath,/usr/lib/${pkgname}-tensorflow' \
        -s -w \
        -X main.version=${buildid}
    "
    go build \
        -trimpath \
        -ldflags "${ldflags}" \
        -o "${pkgname}" \
        "./cmd/${pkgname}/${pkgname}.go"
    
    npm --prefix=frontend install
    NODE_ENV=production npm --prefix=frontend run build
}

package() {
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "defaults.yml"        "${pkgdir}/etc/${pkgname}/defaults.yml"

    cd "${pkgname}-${_pkgver}"
    install -Dm755 "${pkgname}"          "${pkgdir}/usr/bin/${pkgname}"

    cd assets
    find {locales,profiles,static,templates} -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
}
