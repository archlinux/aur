# Maintainer: darkvlados@gmail.com

pkgname=medis
pkgver=0.7.1.16
pkgrel=1
pkgdesc="Medis is a beautiful, easy-to-use database management application for Redis."
arch=("any")
url="https://github.com/luin/medis"
license=("MIT")
depends=('electron')
makedepends=('npm' 'asar' 'git')
source=("${pkgname}-git::git+https://github.com/luin/medis.git"
        'medis.desktop'
        'medis')
md5sums=('SKIP'
         'F9B462B94D50FB4086D94FD420558B34'
         '05074FDFE9D1FAA78550ED6551CF447B')

# pkgver() {
#    cd "${pkgname}-git"
#    git describe --tags | sed 's/\(.*\)-.*/\1/' | tr - .
# }

prepare() {
    cd "${pkgname}-git"
    git reset --hard 05a6c2948e15c7a571516052acf8ce6d9a1e8667
}

build() {
    cd "${pkgname}-git"
    npm ci
    npm run build
    asar p . ../medis.asar --unpack-dir "{.git,node_modules}"
}

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin"                medis
    install -Dm0644 -t "${pkgdir}/usr/share/applications" medis.desktop
    install -Dm0644 -t "${pkgdir}/usr/lib/medis"          medis.asar
    install -Dm0644 "${pkgname}-git/resources/icns/Icon1024.png" "${pkgdir}/usr/share/pixmaps/medis.png"
}
