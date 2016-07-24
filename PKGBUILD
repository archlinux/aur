# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=caprine
pkgver=1.4.1
pkgrel=1
pkgdesc='Unofficial Facebook Messenger app'
arch=('any')
url='https://github.com/sindresorhus/caprine'
license=('MIT')
depends=('electron')
makedepends=('npm')
source=("https://github.com/sindresorhus/caprine/archive/${pkgver}.tar.gz"
        'caprine.desktop'
        'caprine.sh')
sha256sums=('37c6a1609dca3460def6379581c73559881ceac1f00d38a82efdd151877a83f4'
            '5e689717a895a16b1b939c25216d8e16518a3562105d8da3897563f7e57db106'
            'dc2529dafc224f5f9544d8a34df6bd602495c7d4612ec36d88778707a64e8df9')

build() {
    cd ${pkgname}-${pkgver}

    npm install --production
}

package() {
    cd ${pkgname}-${pkgver}

    _appdir=/usr/lib/${pkgname}

    install -d "${pkgdir}"${_appdir}
    cp -r * "${pkgdir}"${_appdir}

    install -D -m755 "${srcdir}"/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -D -m644 "${srcdir}"/${pkgname}.desktop \
            "${pkgdir}"/usr/share/applications/${pkgname}.desktop

    install -d "${pkgdir}"/usr/share/licenses/${pkgname}
    ln -s ../../../lib/${pkgname}/license "${pkgdir}"/usr/share/licenses/${pkgname}

    # Clean up
    find "${pkgdir}" -name "package.json" \
        -exec sed -e "s|${srcdir}/${pkgname}-${pkgver}|${_appdir}|" -i {} \;
}
