# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=tgs2png-git
_pkgname=tgs2png
pkgver=0.3.0.r16.20260923.181f60d
pkgrel=1
pkgdesc="Convert Telegram's animated stickers in TGS format into series of PNG images."
url="https://github.com/zevlg/tgs2png"
depends=(libpng rlottie)
makedepends=(git cmake)
arch=(x86_64)
license=(GPL3)
provides=("tgs2png=${pkgver}")
conflicts=(tgs2png)
source=("git+https://github.com/zevlg/tgs2png")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname" || exit

    _ver="$(grep -E '[[:space:]]*version[[:space:]]*=[[:space:]]*.' tgs2png.c | awk -F= '{print $2}' | sed -E 's|//.*||' | tr -d [[:space:]]\"\'\;)"
    _rev="$(git rev-list --count HEAD)"
    _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
    _hash="$(git rev-parse --short HEAD)"

    if [ "$_ver" = "" ]; then
        error "Version could not be determined."
        return 1
    else
        printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
    fi
}

build() {
    cd "$_pkgname" || exit
    mkdir -p build
    cd build || exit
    cmake ..
    make
}

package() {
    cd "$_pkgname/build" || exit

    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
