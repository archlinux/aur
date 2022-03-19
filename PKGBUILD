# Maintainer: selpast <selpast@pm.me>
# Maintainer: mochaaP <aur@mochaa.ws>

_pkgbase=mpv-discord
pkgname=$_pkgbase-git
pkgver=1.6.1.r0.g861bfe5
pkgrel=3
pkgdesc='A cross-platform Discord Rich Presence integration for mpv'
url="https://github.com/tnychn/${_pkgbase}"
arch=($CARCH)
license=('MIT')
depends=('mpv' 'luajit')
makedepends=('go>=1.15')
source=(${_pkgbase}::git+${url}.git
        'binary-path.patch')
sha256sums=('SKIP'
            '11d99f7c9781eeffe1bf6419ed65a985ac1ce19bf813ffe6ef63e38f53951667')
pkgver() {
    cd ${srcdir}/${_pkgbase}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${srcdir}
    patch -p1 -d ${_pkgbase} < binary-path.patch
    mkdir -p build/
}

build() {
    cd ${srcdir}/${_pkgbase}/${_pkgbase}

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build/$_pkgbase .
}

package() {
    cd ${srcdir}/${_pkgbase}

    install -Dm644 scripts/discord.lua "$pkgdir"/etc/mpv/scripts/discord.lua
    install -Dm644 script-opts/discord.conf "$pkgdir"/etc/mpv/script-opts/discord.conf
    install -Dm755 $_pkgbase/build/$_pkgbase "$pkgdir"/usr/lib/$_pkgbase/$_pkgbase
}
