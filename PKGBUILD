# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=phoenix
pkgver=v1.0.0.beta.6.r16.ged2118a2
pkgrel=1
pkgdesc="BURST Cross-Platform Wallet UI"
arch=('i686' 'x86_64')
url="https://github.com/burst-apps-team/phoenix"
license=('GPL3')
depends=('nodejs>=10')
makedepends=('npm' 'angular-cli')
install=phoenix.install
source=(git+https://github.com/burst-apps-team/$pkgname.git
	$pkgname.desktop
	package.json.patch)
sha256sums=('SKIP'
	    'bbbaf2f53ef6dfb232364b981e441f00772699351c95e0700fd8ef59c984a80b'
	    '6b1cac2f8a633e508608242fd7dffd15e8d95cc94073eaa4994f985f06dcafc3')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}/lib"
    npm install
    npm run bootstrap
    cd ../web/angular-wallet
    npm install
    cd ../../scripts
    npm install
    cd ../desktop/wallet
    npm install
    # patch build only unpacked
    patch package.json < "${srcdir}/package.json.patch"

    npm run release:linux
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/${pkgname}/desktop/wallet/release-builds/linux-unpacked/." "${pkgdir}/opt/${pkgname}"

    # https://github.com/electron/electron/issues/17972
    cd "${pkgdir}/opt/${pkgname}"
    chmod 4755 ./chrome-sandbox
    chown root:root ./chrome-sandbox

    # Menu entry
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}/assets/phoenix.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
