# Maintainer: devome <evinedeng@hotmail.com>
# Maintainer: caoticofanegas<>
_pkgname=metube
pkgname="${_pkgname}-git"
pkgver=r567.5394424
pkgrel=1
pkgdesc="Self-hosted YouTube downloader (web UI for youtube-dl / yt-dlp)"
arch=("any")
url="https://github.com/alexta69/${_pkgname}"
license=("AGPL-3.0-or-later")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(aria2 ffmpeg python-aiohttp python-brotli python-mutagen python-pycryptodomex python-simple-websocket python-socketio python-watchfiles yt-dlp)
makedepends=("git" "npm")
source=("${_pkgname}::git+${url}"
        "${_pkgname}.service"
        "${_pkgname}.sh")
sha256sums=('SKIP'
            'de07b835827462a4b7c19fe2dd73b02faed87b4a2b33c50627385d4b92bab71c'
            '2b63a9c2b307da510b6b1804a87f510d2147a45c86e133581297f4ac9c348ac1')
options=("!strip" "!debug")

prepare() {
    echo -e "## Means of environment variables see: https://github.com/alexta69/metube\n" > "${_pkgname}.env"
    find "${_pkgname}/app" -type f | xargs -I {} sed -i 's/\r$//g' {}
    sed -i 's/python3/python/' "${_pkgname}/app/main.py"
    awk '/_DEFAULTS *= *\{/,/\s\}/' "${_pkgname}/app/main.py" | sed -n 's/^[ \t]*\([^:]*\):[ \t]*\(.*\),/\1: \2/p' | sed -E -e "s|^'|#|g" -e "s|' ?: |=|" >> "${_pkgname}.env"
}

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}/ui"
    npm ci
    ./node_modules/.bin/ng build --configuration production
}

package() {
    install -Dm755 "${_pkgname}.sh"       "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
    install -Dm644 "${_pkgname}.env"      "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.env.example"

    cd "${_pkgname}"
    install -Dm644 app/*.py            -t "${pkgdir}/usr/share/${_pkgname}/app"
    find "ui/dist" -type f | \
        xargs -I {} install -Dm644 {}     "${pkgdir}/usr/share/${_pkgname}/"{}
}
