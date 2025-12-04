# Maintainer: uwuclxdy
# Contributor: Mikhail Babynichev <i@kotrik.ru>

_pkgbase=tosu

pkgname=${_pkgbase}-git
pkgver=4.15.3.r0.gb326e47
pkgrel=1
pkgdesc="Memory reader and PP counters provider for osu! and osu! Lazer - git version"
arch=('x86_64')
url="https://github.com/tosuapp/tosu"
license=('LGPL-3.0-only')
makedepends=('git' 'npm' 'pnpm' 'nodejs>=20' 'python' 'gcc')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
options=("!strip")
install=notice.install
source=("${_pkgbase}::git+${url}.git"
        "notice.install"
        "tosu-bin.sh"
        "tosu.service"
        "tosu-system.service")
sha256sums=('SKIP'
            'e59b923dae16cc0152b0e7515dc994b856a97f5ca3243934a3c32695a316981b'
            '6b7537506b8805d36c5257f58538bafdd1125db14fa642020c418ed6fa6b6231'
            '741763acdc2777c3c1af4c58888a969c1334466dd43562897994a9434e7a6961'
            '5d70f67abeea2ec89f15f6a4efeb00fabc98dee4742c9b2ba6198d4388900b53')

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
    pnpm install --frozen-lockfile --no-optional
    pnpm run build:linux
}

package() {
    cd "${_pkgbase}"
    install -Dm755 "packages/tosu/dist/tosu" "${pkgdir}/opt/tosu/tosu"
    install -d -m777 "${pkgdir}/opt/tosu"
    install -Dm755 "${srcdir}/tosu-bin.sh" "${pkgdir}/usr/bin/tosu"
    install -Dm644 "${srcdir}/tosu.service" "${pkgdir}/usr/lib/systemd/user/tosu.service"
    install -Dm644 "${srcdir}/tosu-system.service" "${pkgdir}/usr/lib/systemd/system/tosu.service"
}
