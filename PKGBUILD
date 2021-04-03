# Maintainer: Fabio Germann <fabio.germann+aur@gmail.com>

pkgname=sedutil-sleep-git
pkgver=1.15.1.r3.gecfd482
pkgrel=1
pkgdesc="TCG OPAL 2.00 SED Management Program - including S3 sleep support"
arch=('i686' 'x86_64')
url="https://github.com/fabiogermann/sedutil"
license=('GPL3')
source=("${pkgname%-git}::git+$url#branch=s3-sleep-support")
sha256sums=('SKIP')

makedepends=(
    'git'
)

pkgver() {
    cd "${pkgname%-git}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname%-git}"
    autoreconf || true
    automake --add-missing
    autoreconf
    ./configure
    make
}

package() {
    _release="Release_$CARCH"
    cd "${pkgname%-git}"
    install -Dm755 "sedutil-cli" "${pkgdir}/usr/bin/sedutil-sleep"
}
