# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-compass
pkgver=1.45.2
pkgrel=1
pkgdesc="The MongoDB GUI"
arch=('x86_64')
url="https://www.mongodb.com/products/compass"
license=('SSPL-1.0')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss')
optdepends=('org.freedesktop.secrets')
options=('!debug')
source=("https://downloads.mongodb.com/compass/${pkgname}_${pkgver}_amd64.deb"
        "https://github.com/mongodb-js/compass/raw/main/LICENSE")
noextract=("${pkgname}_${pkgver}_amd64.deb")
b2sums=('ec330d75f86ec6bec81ffb57266b54833859785867e1fb375a1ae1f57de9a6fff7215da7f67766ed1bc603c4a12a43605701af8aa26e8672f57721abecd3403f'
        '3db19ea220a8fec79eb55aa2657a3d9c920cf9eaa4ed6737e4a4688e1ba573c36d7de1b52a165340f61c740dfda98f656596b0d8b9f3492cffa0f4e418bf7ef3')

package() {
    bsdtar -O -xf "${pkgname}_${pkgver}"*.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
    find "${pkgdir}" -type f -exec chmod 644 {} +
    chmod +x "${pkgdir}"/usr/lib/mongodb-compass/chrome_crashpad_handler
    chmod +x "${pkgdir}"/usr/lib/mongodb-compass/chrome-sandbox
    chmod +x "${pkgdir}"/usr/lib/mongodb-compass/"MongoDB Compass"

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Prevent creation of unnecessary logs in `${HOME}/.mongodb`
    sed -i 's/Exec=/Exec=env MONGODB_COMPASS_TEST_LOG_DIR=\/dev\/null /' \
      "${pkgdir}"/usr/share/applications/mongodb-compass.desktop

    # Install license
    install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
