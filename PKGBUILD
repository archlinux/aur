# Maintainer: uwuclxdy
# Maintainer: Mikhail Babynichev <i@kotrik.ru>
# Contributor: Mikhail Babynichev <i@kotrik.ru>

_pkgbase=tosu

pkgname=${_pkgbase}-git
pkgver=4.15.3.r0.gb326e47
pkgrel=1
pkgdesc="Memory reader and PP counters provider for osu! and osu! Lazer - git version"
arch=('x86_64')
url="https://github.com/tosuapp/tosu"
license=('LGPL3')
groups=()
depends=()
makedepends=('git' 'npm' 'pnpm' 'nodejs>=20' 'python' 'gcc')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
options=("!strip")
install=notice.install
source=("${_pkgbase}::git+${url}.git"
        "tosu-bin.sh::https://aur.archlinux.org/cgit/aur.git/plain/tosu-bin.sh?h=tosu"
        "notice.install")
sha256sums=('SKIP'
            'ada3abbdb7bd09dea02e8149a63dc3a730bd300186ac3a136d624acaaa9d225f'
            'ce227974fc8151bb7c45361c8ba1db539d56e0729998f8087825fae13dcb0f16')

pkgver() {
    cd "${_pkgbase}"
    git describe --long --tags | sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgbase}"
    export MAKEFLAGS=""
}

build() {
    cd "${_pkgbase}"
    export MAKEFLAGS=""
    export CXXFLAGS="${CXXFLAGS} -Wno-error=format-security"
    pnpm install --frozen-lockfile
    pnpm run build:linux
}

package() {
    cd "${_pkgbase}"
    install -Dm755 "packages/tosu/dist/tosu" "${pkgdir}/opt/tosu/tosu"
    install -d -m777 "${pkgdir}/opt/tosu"
    install -Dm755 "${srcdir}/tosu-bin.sh" "${pkgdir}/usr/bin/tosu"
}
