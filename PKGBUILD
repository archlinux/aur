# Maintainer: uwuclxdy
# Maintainer: Mikhail Babynichev <i@kotrik.ru>
# Contributor: Mikhail Babynichev <i@kotrik.ru>

pkgname=tosu-git
pkgver=r1408.b326e47
pkgrel=1
pkgdesc="Memory reader and PP counters provider for osu! and osu! Lazer"
arch=('x86_64')
url="https://github.com/tosuapp/tosu"
license=('LGPL3')
depends=()
makedepends=('git' 'npm' 'pnpm' 'nodejs>=20' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=('!strip')
install=notice.install
changelog=
source=("git+https://github.com/tosuapp/tosu.git"
        "tosu-bin.sh::https://aur.archlinux.org/cgit/aur.git/plain/tosu-bin.sh?h=tosu"
        "notice.install")
sha256sums=('SKIP'
            'ada3abbdb7bd09dea02e8149a63dc3a730bd300186ac3a136d624acaaa9d225f'
            '7168b6ffb949481da782e59f0962549264fe581a8b0197e22e79d3dd8f51eb5b')
validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    export MAKEFLAGS=""
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    export MAKEFLAGS=""
    export CXXFLAGS="${CXXFLAGS} -Wno-error=format-security"
    pnpm install --frozen-lockfile
    pnpm run build:linux
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 "packages/tosu/dist/tosu" "${pkgdir}/opt/tosu/tosu"
    install -d -m777 "${pkgdir}/opt/tosu"
    install -Dm755 "${srcdir}/tosu-bin.sh" "${pkgdir}/usr/bin/tosu"
}
