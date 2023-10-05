# Maintainer: GCMarvin <GCMarvin@users.noreply.github.com>
pkgname=snkrx-drmfree-git
pkgver=r118.6b93a64
pkgrel=1
pkgdesc='A replayable arcade shooter where you control a snake of heroes, automatically patched to run without Steam.'
arch=('any')
url='https://store.steampowered.com/app/915310/SNKRX/'
license=('MIT')
depends=('love')
makedepends=('git')
provides=('SNKRX')
conflicts=('SNKRX' 'snkrx-git')
source=('git+https://github.com/a327ex/SNKRX.git'
        'SNKRX.desktop')
b2sums=('SKIP'
        'c9fc3e0630da2e60ebd1917a620538ea45c515aef2357e4938c62fcee738d6d2f6f6babe3eed7e87262f04d042137b7a5acbf0ddd4de116c14c3bc68eef530b0')

pkgver() {
    cd "${srcdir}/SNKRX/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    find "${srcdir}/SNKRX/" -type f -name '*.lua' -exec sed -Ei "/steam\.|luasteam/d" "{}" \;
}

package() {
    cd "${srcdir}"
    find "SNKRX" -type f \( -name '*.lua' -or -name 'gamecontrollerdb.txt' -or -wholename '*/assets/*' \) -exec \
        install -Dm 644 "{}" "${pkgdir}/usr/share/{}" \;
    install -Dm 644 "SNKRX.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm 644 "SNKRX/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm 755 <(echo '#!/usr/bin/love /usr/share/SNKRX/') "${pkgdir}/usr/bin/SNKRX"
}
