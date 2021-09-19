# Maintainer: LeSnake04 <dev.lesnake@posteo.de>

_pkgname=cpod
pkgname=$_pkgname-appimage
pkgver=1.28.0
pkgrel=3
_appimage=${_pkgname}-${pkgver}.AppImage
pkgdesc='A simple, beautiful podcast app for Windows, macOS, and Linux.'
arch=('x86_64')
url='https://github.com/z-------------/CPod'
license=('LGPL')
conflicts=('cpod' 'cpod-git')
provides=('cpod')
depends=(appimagelauncher)
source=($_appimage::https://github.com/z-------------/CPod/releases/download/v$pkgver/CPod-$pkgver-x86_64.AppImage)
sha256sums=(796562f9645981549c6311315cd6bf3a91ba01aae157524428b1ba2193a503af)
noextract=("${_appimage}")
options=("!strip")
_desktopfile=$_pkgname.desktop
_desktopfilesrc=squashfs-root/$_desktopfile
_installdir=/opt/$pkgname
_bintarget=$_installdir/$_appimage
_binlinktarget=/usr/bin/$_pkgname

prepare() {
  echo Making AppImage executable...
  chmod +x "$_appimage"

  echo Extracting AppImage...
  ./$_appimage --appimage-extract

  echo Fixing desktop file
  sed -i "s+Exec=AppRun+Exec=$_binlinktarget+" "$_desktopfilesrc"
}

package() {
  echo Setting variables...
  _installdir=$pkgdir/opt/${pkgname}
  _desktopfilesrc=$srcdir/$_desktopfilesrc
  _iconssrc=$srcdir/squashfs-root/usr/share/icons/*
  _iconstarget=$pkgdir/usr/share/icons
  _binfulltarget=$pkgdir$_bintarget
  _binsrc=$(realpath $srcdir/$_appimage)
	_binlinkfulltarget=${pkgdir}$_binlinktarget

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
	echo "#!/usr/bin/env bash" >> $_binlinkfulltarget
	echo "APPIMAGELAUNCHER_DISABLE=true $_bintarget  \$@" >> $_binlinkfulltarget
	chmod 755 $_binlinkfulltarget
}

