# Maintainer: LeSnake04 <dev.lesnake@posteo.de>

_pkgname=cryptocam-companion
pkgname=$_pkgname-appimage
pkgver=0.2.3
pkgrel=2
_srcpkgname=Cryptocam%20Companion
_srcjobid=1246114289
_appimage=${_pkgname}-${pkgver}.AppImage
pkgdesc='Companion for Cryptocam, the encrypted android camera app'
arch=('x86_64')
url='https://gitlab.com/cryptocam/cryptocam-companion'
license=('GPL3')
depends=('appimagelauncher')
provides=("$_pkgname")
source=($_appimage::https://gitlab.com/cryptocam/cryptocam-companion/-/jobs/$_srcjobid/artifacts/raw/$_srcpkgname-$pkgver-x86_64.AppImage?inline=false)
sha256sums=(50fe2e34ed4b06dd62827c0b0f66fcd3c6395303983875cbf4764c1f14e0fa80)
noextract=("${_appimage}")
options=("!strip")
_originalexec=usr/bin/cryptocam-qt
_desktopfile=com.tnibler.cryptocam-companion.desktop
_desktopfilesrc=squashfs-root/$_desktopfile
_installdir=/opt/$pkgname
_bintarget=$_installdir/$_appimage

prepare() {
  echo Making AppImage executable...
  chmod +x $_appimage

  echo Extracting AppImage...
  ./$_appimage --appimage-extract $_desktopfile
  ./$_appimage --appimage-extract usr/share/icons

  echo Fixing desktop file
  sed -i "s+Exec=$_originalexec+Exec=$_bintarget+" "$_desktopfilesrc"
}

package() {
   echo Setting variables...
   _installdir=$pkgdir/opt/${pkgname}
   _desktopfilesrc=$srcdir/$_desktopfilesrc
   _iconssrc=$srcdir/squashfs-root/usr/share/icons/*
   _iconstarget=$pkgdir/usr/share/icons
   _binfulltarget=$pkgdir$_bintarget
   _binsrc=$(realpath $srcdir/$_appimage)

   echo Installing desktop file...
   install -vDm644 $_desktopfilesrc "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

   echo Installing icons...
   mkdir -vp $_iconstarget
   cp -arv $_iconssrc $_iconstarget
   chmod -R 644 $_iconstarget
   find "$_iconstarget" -type d -exec chmod 755 {} \;

   echo Installing AppImage...
   install -vDm755 $_binsrc $_binfulltarget

   echo Creating symlinks
   mkdir -vp $pkgdir/usr/bin
   ln -vsf $_bintarget $pkgdir/usr/bin/$_pkgname
}
