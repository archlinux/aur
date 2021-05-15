# Maintainer: Naglis Jonaitis <naglis@mailbox.org>

pkgname=thorium-bin
pkgver=1.7.0
pkgrel=3
pkgdesc="A cross platform desktop reading app, based on the Readium Desktop toolkit"
arch=('x86_64')
license=('BSD3')
url="https://github.com/edrlab/thorium-reader"
depends=('libnotify' 'nss' 'libxss' 'xdg-utils' 'libappindicator-gtk3' 'libsecret')
_filename=EDRLab.ThoriumReader_${pkgver}_amd64.deb
source=(
  ${url}/releases/download/v${pkgver}/${_filename}
  ${url}/raw/v${pkgver}/LICENSE
  no_zip_mime.patch
)
sha512sums=(
  c1d637a8b59522ca16e53c9553c67f0c549b05132cf6a311130a3593d5629747205347360fc6373009741d12eb39e7ff22f5fc48fb28399d38c79724e6cba4d9
  SKIP
  e0308f1bd718014d12c5fb930ad154ef5f79a55e312e5d59dbcaf72bfecd63c57376f3decb6aecf8d51af1058a4b4139d280d3ff0a547877368b3cbc94653238
)

package() {
    tar xJf ${srcdir}/data.tar.xz -C ${pkgdir}/

	# Symlink
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/Thorium/thorium" "${pkgdir}/usr/bin/thorium"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix "no icon" issue (see also https://github.com/edrlab/thorium-reader/issues/1241)
    mv ${pkgdir}/usr/share/icons/hicolor/0x0 ${pkgdir}/usr/share/icons/hicolor/1024x1024
    install -Dm 644 "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/thorium.png" "${pkgdir}/usr/share/pixmaps/thorium.png"

    # Do not change the icon of *.zip files to `x-office-document`.
    # See also: https://github.com/edrlab/thorium-reader/issues/1468
    patch -d "${pkgdir}" --strip=1 < ../no_zip_mime.patch
}
