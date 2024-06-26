# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-compass
pkgver=1.43.2
pkgrel=1
pkgdesc="The MongoDB GUI"
arch=('x86_64')
url="https://www.mongodb.com/products/compass"
license=('custom')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss')
optdepends=('org.freedesktop.secrets')
options=('!debug')
source=("https://downloads.mongodb.com/compass/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
b2sums=('c0afdb04285b3cb1453b1cb0780a9b2642d4c7d0c6163130d753375a2eed45f26f38229d9dab4f2bcdb5abe50b345a016622d1c7faa3f144f88dbbc47a435978')

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
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s /usr/share/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
