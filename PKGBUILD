# Maintainer: Doridian <archlinux@doridian.net>

pkgname=docker-sriov-plugin-git
pkgver=0.6.r16.gb8d6f3f
pkgrel=1
pkgdesc='Docker networking plugin for SRIOV and passthrough interfaces'
arch=('x86_64' 'i686')
gomodname='github.com/Mellanox/docker-sriov-plugin'
url="https://${gomodname}"
license=('Apache-2.0')
depends=()
makedepends=('go' 'git')
source=(
    "$pkgname::git+${url}.git"
    mr-26.patch::https://patch-diff.githubusercontent.com/raw/Mellanox/docker-sriov-plugin/pull/26.patch
)
sha256sums=(
    'SKIP'
    'b6c2db906bd94b8f45a18cee36ecce09db9b4641727823af94e35f0a14fe247e'
)

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git reset --hard
    git clean -fdx
    git apply "${srcdir}/mr-26.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    go build -trimpath -o docker-sriov-plugin
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 docker-sriov-plugin -t "${pkgdir}/usr/bin/"
}
