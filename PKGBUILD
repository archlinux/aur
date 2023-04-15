# Maintainer: haxibami <contact at haxibami dot net>

pkgname=nody-greeter
pkgver=1.5.2
pkgrel=1
pkgdesc="LightDM greeter that allows to create wonderful themes with web technologies. Made in Node.js"
arch=("any")
url="https://github.com/JezerM/nody-greeter"
license=("GPL3")
depends=("lightdm" "gobject-introspection" "cairo")
makedepends=("git" "nodejs<17" "npm" "python3")
source=("${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}" "package.patch")
sha256sums=('SKIP'
            'bbea2e0dbded27707814e5844631a87b4b38a931011a0fa92ad0c3446fdce7c2')

prepare() {
    cd "${pkgname}-${pkgver}"
    git submodule update --init --recursive
    patch --forward --strip=1 --input="${srcdir}/package.patch"
    npm install
}

build() {
    cd "${pkgname}-${pkgver}"
    npm run rebuild
    npm run build
}

package() {
    cd "${pkgname}-${pkgver}"
    node make --DEST_DIR="${pkgdir}/" install
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/nody-greeter" "${pkgdir}/usr/bin"
}
