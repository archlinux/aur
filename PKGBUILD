# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=tempstash
pkgver=0.5.4
pkgrel=1
pkgdesc="stash a copy of a file for a specified period of time"
arch=(any)
url="https://sr.ht/~minshall/tempstash/"
license=('MIT')
depends=(jq rsync yq zsh)
makedepends=(asciidoc git)
optdepends=('cram: functional testing framework')
# git rev-parse 0.5.4
_tag=44a7460fa594fdbd362d495a43c69b35e987ef6b
source=(git+https://git.sr.ht/~minshall/tempstash#tag=${_tag}?signed)
validpgpkeys=(
    BB68C8D3A3D23B9B398FB50AC397C74C54A9EC4F # Greg Minshall <minshall@acm.org>
)
sha256sums=('SKIP')


pkgver() {
    cd "${pkgname}"
    git describe
}

build() {
    cd "${pkgname}"

    make
}

check() {
    cd "${pkgname}"

    if cram -h > /dev/null; then
        make test;
    else
        echo "cram(1) not installed; check suppressed"
    fi
}

package() {
    cd "${pkgname}"

    make DESTDIR="${pkgdir}" PREFIX=/usr install
    # install our MIT license
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
