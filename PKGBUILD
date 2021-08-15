# Maintainer: LeSnake04 <dev.lesnake@posteo.de>

_pkgname=cpod
pkgname=$_pkgname-appimage
pkgver=1.28.0
pkgrel=1
_srcpkgver=$pkgver
_appimage=${_pkgname}-${pkgver}.AppImage
pkgdesc='A simple, beautiful podcast app for Windows, macOS, and Linux.'
arch=('x86_64' 'i686')
url='https://github.com/z-------------/CPod'
license=('LGPL')
conflicts=('cpod' 'cpod-git')
depends=(appimagelauncher)
source=($_appimage::https://github.com/z-------------/CPod/releases/download/v$_srcpkgver/CPod-$_srcpkgver-x86_64.AppImage)
sha256sums=(796562f9645981549c6311315cd6bf3a91ba01aae157524428b1ba2193a503af)
noextract=("${_appimage}")
options=("!strip")
_desktopfile=$_pkgname.desktop
_desktopfilesrc=squashfs-root/$_desktopfile
_installdir=/opt/$pkgname
_bintarget=$_installdir/$_appimage

prepare() {
  echo Making AppImage executable...
  chmod +x "$_appimage"

  echo Extracting AppImage...
  ./$_appimage --appimage-extract

  echo Fixing desktop file
  sed -i "s+Exec=AppRun+Exec=$_bintarget+" "$_desktopfilesrc"
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
  install -Dm755 $_binsrc $_binfulltarget

  echo Creating symlinks
  mkdir -vp $pkgdir/usr/bin
  ln -vsf $_bintarget $pkgdir/usr/bin/$_pkgname
}

