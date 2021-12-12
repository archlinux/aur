# Maintainer: Carlos Galindo <arch -at- cgj.es>

pkgname=bitwarden-dmenu
pkgver=1.5.9
pkgrel=2
pkgdesc="dmenu adapter for bitwarden-cli"
arch=('x86_64')
url="https://github.com/andykais/bitwarden-dmenu"
license=('MIT')
depends=('nodejs' 'dmenu')
optdepends=('libx11: To use the clipboard in X11')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha512sums=('c99082fafe7382dd7609fb790676b2ca7391a99a2db89fd492866c4243dd11fbb40828e426dacb51b2fec5d7d35ee17f1541244f4763be365b0d967bc8074d6d')

package() {
    cd "${srcdir}"
    npm install "${pkgname}-${pkgver}.tar.gz" -g --user root --prefix "${pkgdir}/usr" --production
    # Delete reference to source dir
    find ${pkgdir} -name package.json -type f -exec sed -i 's/"_where": ".*",//g' {} \;
    # Point remaining references to pkgdir to /
    find ${pkgdir} -name package.json -type f -exec sed -i "s!${pkgdir}/${pkgname}!/!g" {} \;
    # License
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    tar -xf "${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/usr/share/licenses/${pkgname}" --strip-components=1 "${pkgname}-${pkgver}/LICENSE"
    # Change ownership to root
    chown -R root:root "${pkgdir}"
}

# vim:set ts=4 sw=4 et:
