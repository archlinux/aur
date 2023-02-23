# Maintainer: LeSnake04 <dev.lesnake@posteo.de>

_pkgname=qmplay2
_pkgname2=QMPlay2
pkgname=$_pkgname-appimage
pkgver=23.02.05
pkgrel=1
_srcpkgver=$pkgver-1
_appimage=${_pkgname}-${_srcpkgver}.AppImage
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('x86_64')
url='https://github.com/zaps166/QMPlay2'
license=('LGPL')
depends=('appimagelauncher')
conflicts=('qmplay2' 'qmplay2-git')
provides=('qmplay2')
optdepends=('pulseaudio: PulseAudio support')
source=($_appimage::https://github.com/zaps166/QMPlay2/releases/download/$pkgver/QMPlay2-$_srcpkgver-x86_64.AppImage)
noextract=("${_appimage}")
sha512sums=(b92389aad9ad729965b6593ebd3b80fd53e877ce9317822e042a02481285558e140bb5358ceb2799dc67f436382d8fe35c45d9892f7783440b9b389baf2e9ea6) 
options=("!strip")
_desktopfile=QMPlay2.desktop
_installdir=/opt/$pkgname
_bintarget=$_installdir/$_appimage
_iconssrc=usr/share/icons

prepare() {
	cd $srcdir
	echo Making AppImage executable...
  chmod +x $_appimage

  echo Extracting AppImage...
  ./$_appimage --appimage-extract $_desktopfile
	./$_appimage --appimage-extract "$_iconssrc"
}

package() {
  echo Setting variables...
  _installdir=$pkgdir/opt/${pkgname}
  _desktopfilesrc=$srcdir/squashfs-root/$_desktopfile
  _iconssrc=$srcdir/squashfs-root/$_iconssrc
  _iconstarget=$pkgdir/usr/share/icons
  _binfulltarget=$pkgdir$_bintarget
  _binsrc=$(realpath $srcdir/$_appimage)
	_binlinkname=QMPlay2
	_binlinktarget=$pkgdir/usr/bin/$_binlinkname

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
	printf "#!/usr/bin/env bash\nAPPIMAGELAUNCHER_DISABLE=true %s \$@" $_bintarget > $_binlinktarget
	chmod 755 $_binlinktarget
}

