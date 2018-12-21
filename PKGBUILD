# Maintainer: Lucas Malandrino <lucas.malandrino@gmail.com>
pkgname='edex-ui-git'
_pkgname='edex-ui'
pkgver=1.1.2.r8.gdad81fa
pkgrel=1
pkgdesc="A science fiction desktop running everywhere. Awesome."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/GitSquared/edex-ui'
license=('GPL3')
depends=('gtk3'
         'libxss'
         'nss')
makedepends=('npm' 'git')
conflicts=('edex-ui')
provides=('edex-ui')
install="edex-ui.install"
source=("git+https://github.com/GitSquared/edex-ui.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo 1.0.0
}

build() {
    cd "${_pkgname}"

    npm install

    # Build tarball with electron-builder
    npm run prebuild-linux
    ${srcdir}/${_pkgname}/node_modules/.bin/electron-builder -l pacman -p never
    npm run postbuild-linux
}

package() {
    cd "${_pkgname}"

    # Extract the package made by electron-builder
    # It's not pretty but blame electron
    tar xf ./dist/eDEX-UI-linux-*.pacman -C "${pkgdir}"
    cd "${pkgdir}"

    # Garbage made by electron-builder
    rm -f "${pkgdir}/.INSTALL" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"

    chmod 755 "${pkgdir}/opt/eDEX-UI/edex-ui"
}
