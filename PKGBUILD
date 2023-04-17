# Maintainer: lod <aur@cyber-anlage.de>
# Contributer: Donn <me@donn.website>

pkgname=cemu-bin
pkgver=2.0.34
pkgrel=1
pkgdesc="Nintendo Wii U Emulator"
arch=('x86_64')
url="https://cemu.info"
license=('MPL2')
depends=('gcc-libs' 'glib2' 'glibc' 'glu' 'hicolor-icon-theme' 'libglvnd' 'libice' 'libpng' 'libsm' 'libx11'
         'libxext' 'libxrender' 'wayland')
makedepends=('patchelf')
provides=('cemu')
conflicts=('cemu' 'cemu-git')
options=(!strip !docs libtool emptydirs)
_srcver=${pkgver%.*}-${pkgver##*.}
source=("https://github.com/cemu-project/Cemu/releases/download/v$_srcver/cemu-$_srcver-ubuntu-20.04-x64.zip"
        "https://raw.githubusercontent.com/cemu-project/Cemu/main/dist/linux/info.cemu.Cemu.desktop"
        "https://github.com/cemu-project/Cemu/raw/main/dist/linux/info.cemu.Cemu.png"
        "https://raw.githubusercontent.com/cemu-project/Cemu/main/dist/linux/info.cemu.Cemu.metainfo.xml")
sha256sums=('c5a6f26eb1d5c29c4a2f4c2520f6b794bbd224da378e9eb3ca364671d6c554bd'
            '3e9380eb47646fede56c0de59ddab872627c00629820ef5f974be0d07e4f3490'
            '6458a99b8bd54e44857efa0f82bfd6035e7e072e7e080e3330e4e2cfe89cbd33'
            '9a281a8c5b9d0dbe826c5ea0d942f5d2c307d6d9e60729352240e82ee24c5bfe')
            
prepare() {
  cd $srcdir/Cemu_$_srcver

  _libs=('libffi.so.7' 'libicuuc.so.71' 'libicui18n.so.71' 'libicudata.so.71')
  for lib in ${_libs[@]} 
  do
    patchelf --replace-needed $lib ${lib%.*} ./Cemu
  done

  patchelf --remove-needed libsepol.so.1 ./Cemu
  patchelf --remove-needed libselinux.so.1 ./Cemu
}

package() {
  cd $srcdir/Cemu_$_srcver
  
  install -Dm 755 ./Cemu $pkgdir/usr/bin/cemu

  install -d $pkgdir/usr/share/Cemu
  cp -r ./{gameProfiles,resources,shaderCache} $pkgdir/usr/share/Cemu

  sed -i -e '/^Exec=Cemu/cExec=cemu' $srcdir/info.cemu.Cemu.desktop
  install -Dm 644 -t $pkgdir/usr/share/applications $srcdir/info.cemu.Cemu.desktop
  install -Dm 644 -t $pkgdir/usr/share/icons/hicolor/128x128/apps $srcdir/info.cemu.Cemu.png
  install -Dm 644 -t $pkgdir/usr/share/metainfo $srcdir/info.cemu.Cemu.metainfo.xml
}
