# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="git-diff-image-git"
pkgver="0.0.0.r62.gf12098b"
pkgrel="1"
pkgdesc="An extension to 'git diff' that provides support for diffing images."
arch=("any")
url="https://github.com/ewanmellor/git-diff-image"
license=("CC0")
depends=(
    "imagemagick"
    "perl-image-exiftool"
    "xdg-utils"
    "xorg-xdpyinfo"
)
makedepends=("git")
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/ewanmellor/git-diff-image.git#branch=master"
        "${pkgname%-*}.patch")
sha256sums=("SKIP"
            "22e7a5fb626ab19f979729cfd0c9b9327f27bfce88ca1663009987a92bbd83f0")

pkgver() {
    local vers

    cd "${srcdir}/${pkgname%-*}" || return
    vers="$(git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
    if [[ -z "${vers}" ]]; then
        vers="0.0.0.r$(git rev-list --root HEAD --count).g$(git rev-parse --short HEAD)"
    fi
    echo "${vers}"
}

prepare() {
    cd "${srcdir}/${pkgname%-*}" || return
    patch -Np1 -i "${srcdir}/${pkgname%-*}.patch"
}

package() {
    cd "${srcdir}/${pkgname%-*}" || return
    install -D -m755 "git_diff_image" "${pkgdir}/usr/bin/git_diff_image" && \
    install -D -m755 "diff-image" "${pkgdir}/usr/bin/diff-image"
}
