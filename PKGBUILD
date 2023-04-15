# Maintainer: zer0-x < Matrix: "@zer0-x:kde.org" >

_gecko_id="video_speed_setter@zer0_x.github.io"
pkgname="firefox-video-speed-setter-git"
_pkgname=${pkgname%-git}
pkgver=1.5.2
pkgrel=2
pkgdesc="Firefox extension that gives you a simple control over video playback rate"
arch=("any")
url="https://github.com/zer0-x/video-speed-setter"
license=("GPL3")
makedepends=("git" "web-ext")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}#branch=main")
sha512sums=("SKIP")

prepare() {
    cd "${pkgname}"

    git reset --hard "$(git describe --tags --abbrev=0 --match 'v*')"
}

pkgver() {
    cd "${pkgname}"

    git describe --tags --abbrev=0 --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"

    web-ext build --verbose --overwrite-dest --filename "${_pkgname}.xpi"
}

package() {
    cd "${pkgname}"

    install -Dm644 "web-ext-artifacts/${_pkgname}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
