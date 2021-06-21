# Maintainer: GCMarvin <GCMarvin@users.noreply.github.com>
pkgname=snkrx-drmfree-git
pkgver=r93.2453a18
pkgrel=1
pkgdesc='A replayable arcade shooter where you control a snake of heroes, automatically patched to run without Steam.'
arch=('any')
url='https://store.steampowered.com/app/915310/SNKRX/'
license=('MIT')
depends=('love')
makedepends=('git')
provides=('SNKRX')
conflicts=('SNKRX' 'snkrx-git')
source=('SNKRX::git+https://github.com/a327ex/SNKRX.git'
        'SNKRX.desktop')
sha256sums=('SKIP'
            '4754794790e7e128ec8930f70b3100078c24e2d3a3eba7ff9bfc0919a914648a')

pkgver() {
    cd "${srcdir}/SNKRX/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    rm -r "${srcdir}/SNKRX/"{"engine/love/","builds/",".gitignore",*".sh"}
    sed -Ei "/steam\.|luasteam/d" "${srcdir}/SNKRX/"{*,*/*,*/*/*}".lua"
}

package() {
    rm -r "${srcdir}/SNKRX/.git/"
    mkdir -p "${pkgdir}/usr/"{"bin/","share/"{"applications/","/licenses/${pkgname}/"}}
    cp -r "${srcdir}/SNKRX/" "${pkgdir}/usr/share/"
    cp "${srcdir}/SNKRX.desktop" "${pkgdir}/usr/share/applications/"
    cp "${srcdir}/SNKRX/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
    echo "#!/usr/bin/love /usr/share/SNKRX/" > "${pkgdir}/usr/bin/SNKRX"
    chmod 755 "${pkgdir}/usr/bin/SNKRX"
}
