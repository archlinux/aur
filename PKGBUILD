# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=encryptednotepad2-git
_pkgname="Encrypted Notepad 2"
pkgver=r56.99e8197
pkgrel=1
pkgdesc="A Notepad-like simple text editor where files are saved (and later loaded) encrypted with AES-256."
arch=('any')
url="https://github.com/ivoras/EncryptedNotepad2"
license=('GPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'libxi'
    'libx11'
    'libxcursor'
    'libxxf86vm'
    'libxinerama'
    'libglvnd'
    'libxrandr'
)
makedepends=(
    'git'
    'go>=1.22'
    'gendesk'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
build() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %F"
    cd "${srcdir}/${pkgname//-/.}"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/.go-build"
    export GOMODCACHE="${srcdir}/.go/pkg/mod"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export GOPROXY=https://goproxy.cn
        echo '[url "https://github.moeyy.xyz/https://github.com/"]' >> .gitconfig
        echo '    insteadof = https://github.com/' >> .gitconfig
    fi
    go build -o "${pkgname%-git}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-/.}/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}