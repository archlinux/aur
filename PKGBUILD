# Maintainer: Harsh Barsaiyan <hbarsaiyan at gmail dot com>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Oscar Morante <oscar@mooistudios.com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

set -u
pkgname='gravit-designer-bin'
pkgver='2020_1.3.4.1'
pkgrel='1'
pkgdesc='A cross-platform, free design tool for the 21st century empowering everyone to design'
arch=('x86_64')
url='https://designer.io/'
license=('custom:freeware')
depends=('libxss' 'gconf' 'nss' 'gtk3' 'libindicator-gtk2' 'libdbusmenu-gtk2')
makedepends=('patchelf')
_srcdir='squashfs-root'
source=("${pkgname}-${pkgver}.zip::https://designer.gravit.io/_downloads/linux/GravitDesigner.zip?v=${pkgver/_/-}"
        'gravit-designer.png'
        'gravit-designer-document.svg'
        'gravit-designer.xml'
        'LICENSE')
sha256sums=('23a63078eebcf3297ad55ffb56cb8fc44b260d1e4ddd40d0c01c1f94140cdc99'
            '80f947f51165c9764ec3ac168df64178a68c26c49d96ae1a970930146aee3cfe'
            '1c4673222f28e070258289a363ba1d03b3af87aaca99fee7c05a54c9de5deb2b'
            'd2228771efc34f1ed0953fd8f8cd49f60d72728d230c7f860862c4f2056c0df3'
            '0e6f46da5d7886180908ca6e37106050d7d25b4f0675dc839e8aafab43161ea3')
PKGEXT='.pkg.tar'

prepare() {
  set -u
  # Extract AppImage
  chmod +x 'GravitDesigner.AppImage'
  set +u; msg2 'Extracting AppImage'; set -u
  ./GravitDesigner.AppImage --appimage-extract

  cd "${_srcdir}"
  # Patch desktop file
  #cp -p 'gravit-designer.desktop'{,.orig}
  sed -e '/^Exec=/ cExec=gravit-designer' \
      -e '/^MimeType=/ cMimeType=x-scheme-handler/designer;application/gravit-designer-document' \
      -e 's/^X-AppImage-Version=/Version=/' \
      -e '/^X-AppImage/ d' -i 'gravit-designer.desktop'
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  # Install
  install -D 'gravit-designer.desktop' "${pkgdir}/usr/share/applications/gravitdesigner.desktop"
  install -D "${srcdir}/gravit-designer.xml" "${pkgdir}/usr/share/mime/packages/gravitdesigner.xml"
  install -D "${srcdir}/gravit-designer.png" -t "${pkgdir}/usr/share/pixmaps/"
  install -D "${srcdir}/gravit-designer-document.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/application-gravit-designer-document.svg"

  install -D "${srcdir}/LICENSE" LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -d "${pkgdir}/opt/${pkgname}"
  cp -r --no-preserve=all * "${pkgdir}/opt/${pkgname}"

  cd "${pkgdir}/opt/${pkgname}"
  rm LICENSE* 'gravit-designer.desktop' 'AppRun'
  chmod +x 'gravit-designer'

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/gravit-designer" "${pkgdir}/usr/bin/gravit-designer"
  set +u
}
set +u
