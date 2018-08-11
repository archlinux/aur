# Maintainer: Oscar Morante <oscar@mooistudios.com>
# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=gravit-designer-bin
pkgver=3.4.1
pkgrel=1
pkgdesc="A cross-platform, free design tool for the 21st century empowering everyone to design"
arch=('x86_64')
url="https://designer.io/"
license=('custom:freeware')
makedepends=('patchelf')
depends=('alsa-lib' 'libxss' 'gtk2' 'gconf' 'libxtst' 'nss')
source=("${pkgname}-${pkgver}.zip::https://designer.gravit.io/_downloads/linux/GravitDesigner.zip"
        "gravit-designer.desktop"
        "gravit-designer.png"
        "LICENSE"
        "https://archive.archlinux.org/packages/g/glibc/glibc-2.27-3-x86_64.pkg.tar.xz")
noextract=("glibc-2.27-3-x86_64.pkg.tar.xz")
#changelog=https://discuss.gravit.io/t/changelog-for-gravit-designer/71
md5sums=('8ee550fa9444ac994e219cb8a05f150f'
         '689ceb636418b52236edd98207fb9387'
         'a9c256cb9eb6bc9a280c5dccee2ad9af'
         '021ccafc0993d3c34265ae59048d4bf2'
         '57c1dc79d8552f40602e49b84be65752')
PKGEXT='.pkg.tar'

package() {
  chmod +x GravitDesigner.AppImage
  ./GravitDesigner.AppImage --appimage-extract
  install -d ${pkgdir}/opt/${pkgname}
  cp -r --no-preserve=all ${srcdir}/squashfs-root/* ${pkgdir}/opt/${pkgname}/
  chmod +x ${pkgdir}/opt/${pkgname}/gravit-designer
  install -d ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/gravit-designer ${pkgdir}/usr/bin/gravit-designer

  install -D ${srcdir}/gravit-designer.desktop ${pkgdir}/usr/share/applications/gravitdesigner.desktop
  install -D ${srcdir}/gravit-designer.png ${pkgdir}/usr/share/pixmaps/gravit-designer.png
  install -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mv ${pkgdir}/opt/${pkgname}/{LICENSE.electron.txt,LICENSES.chromium.html} ${pkgdir}/usr/share/licenses/${pkgname}/

  # Patch to use glibc 2.27
  _idir="/opt/gravit-designer-bin"
  _pdir="${pkgdir}${_idir}"
  _pbin="${_pdir}/gravit-designer"
  mkdir -p "$_pdir/glibc"
  tar -xJf "glibc-2.27-3-x86_64.pkg.tar.xz" -C "$_pdir" --strip-components=2 --wildcards usr/lib/*
  patchelf --set-interpreter "$_idir/ld-linux-x86-64.so.2" "$_pbin"
}
