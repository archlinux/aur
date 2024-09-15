# Maintainer: Evine Deng <evinedeng@hotmail.com>
# Contributer: Thomas Eizinger <thomas@eizinger.io>

pkgname=photoprism
pkgver=240915_e1280b2fb
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="AI-Powered Photos App for the Decentralized Web"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/${pkgname}/${pkgname}"
license=('AGPL-3.0-or-later')
depends=("libvips" "openjpeg2" "photoprism-facenet" "photoprism-nasnet" "photoprism-nsfw" "photoprism-tensorflow")
makedepends=("go" "npm")
optdepends=("darktable: for RAW to JPEG conversion"
            "ffmpeg: for video transcoding and thumbnail extraction"
            "imagemagick: for image conversion"
            "libheif: for HEIC/HEIF image conversion"
            "mariadb: for MySQL database driver"
            "perl-image-exiftool: for extracting metadata"
            "rawtherapee: for RAW to JPEG conversion")
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz"
        "${pkgname}-import.service"
        "${pkgname}-import.timer"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.user.service"
        "defaults.yml")
sha256sums=('11dd12b493f18f44e052ef71b1f29b7b5a4237fc27df3e8afb23c08f2989e369'
            '01fd07b7e467d23b2b43e8a61076f6668df2fc5f3a6bc42682c390d5134d281b'
            'ca4bfbddf0a550f215f28e31de56eb9ac60777f65aa7b89433155aa7998388e8'
            '5a7e0f788b1df05f13abb167385063a60c9c5b21486d24c12d6676ac580623bd'
            '0aa3f0b94865d2b28d9ecc9e3da14f45525b476b7bdf49f2b2139978908b1c48'
            '9121b27be5728b3eb34dc694ddbecc6d291a4a6906db978552927b4f8f83019d'
            '53b228252119c5a4846e757beb05fe06103c3e3b5ff2cb859af5e818c56c8ab9'
            '183071393262906f6416e27c14d2519fe537614e62866c2a93270b47355d97ae')

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export NODE_ENV=production

    cd "${pkgname}-${_pkgver}"
    local buildid="${_pkgver}-$(uname -s)-$(uname -m)"
    local ldflags="
        -s -w \
        -extldflags '-L/usr/lib/${pkgname}-tensorflow -Wl,-rpath,/usr/lib/${pkgname}-tensorflow ${LDFLAGS}' \
        -X main.version=${buildid}
    "
    go build \
        -trimpath \
        -ldflags "${ldflags}" \
        -o "${pkgname}" \
        "./cmd/${pkgname}/${pkgname}.go"
    
    npm --prefix=frontend install
    npm --prefix=frontend run build
}

package() {
    install -Dm644 "${pkgname}-import".*  -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "defaults.yml"            "${pkgdir}/etc/${pkgname}/defaults.yml"

    cd "${pkgname}-${_pkgver}"
    install -Dm755 "${pkgname}"              "${pkgdir}/usr/bin/${pkgname}"

    cd assets
    find {locales,profiles,static,templates} -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
}
