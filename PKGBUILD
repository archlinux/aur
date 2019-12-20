# Maintainer: agilob <archlinux@agilob.net>
# Contributor: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-linux
pkgver=3.66.5
pkgrel=1
pkgdesc='Official Tutanota email client'
arch=('x86_64')
url='https://tutanota.com/blog/posts/desktop-clients/'
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('fuse' 'zenity' 'libappindicator' 'libindicator' 'gconf' 'libnotify' 'libxss' 'libxtst')
options=(!strip)
source=("${pkgname}-${pkgver}.AppImage::https://mail.tutanota.com/desktop/${pkgname}.AppImage"
	"tutanota-desktop.desktop"
	"tutanota-desktop-linux"
	"LICENSE")
#noextract=("${pkgname}-${pkgver}.AppImage")
sha512sums=('48c64bdf53bc3575099b3b6bd74900068ac919090f4c79a83941ee920fb3bb59630c0058f841db7c2f14c04f9431c6de736a2162051ed9116a4ce492ede16b29'
	    '2182fb9ee7f2ec0fd1f7ed81b09b64ab9f6a822b94099c13111a940102cf062b0d16c0d9bcd18eda5cf26c11b9ebed5c15660d8136cd6c166c39d6a5a23e2c79'
	    'e4de2208710893bc78ecab65a0bedb9b89a1d713bf2af895f00b3613e4082fb224ff8100b68275ae2cfc750b8204edd3e1e084fbe92c44d8168e6755155ab7b2'
	    '7633623b66b5e686bb94dd96a7cdb5a7e5ee00e87004fab416a5610d59c62badaf512a2e26e34e2455b7ed6b76690d2cd47464836d7d85d78b51d50f7e933d5c')

prepare() {
  chmod u+x ${srcdir}/${pkgname}-${pkgver}.AppImage
  ${srcdir}/${pkgname}-${pkgver}.AppImage --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

  #find ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
  #find ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +
  #install -d ${pkgdir}/opt/${pkgname}
  #cp -r ${srcdir}/squashfs-root/* ${pkgdir}/opt/${pkgname}
  #rm -r ${pkgdir}/opt/${pkgname}/usr/

  find ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

  install -Dm644 ${srcdir}/tutanota-desktop.desktop ${pkgdir}/usr/share/applications/tutanota-desktop.desktop

  install -Dm755 ${srcdir}/tutanota-desktop-linux ${pkgdir}/usr/bin/tutanota-desktop-linux
  install -Dm444 ${srcdir}/LICENSE ${pkgdir}/usr/share/LICENSES/${pkgname}/LICENSE
}
