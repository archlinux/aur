# Maintainer: snowkeep <novus+amsel at snowkeep dot ca>

amsel_repo='https://github.com/OllamTechnologies'
launcher_rel='launcher-releases/releases/download'
lore_rel='lore-releases/releases/download'
tome_rel='tome-releases/releases/download'

launcherVer=1.13.9
loreVer=1.13.8
tomeVer=1.13.8

pkgname=amsel_suite-bin
pkgdesc="TTRPG Game Master companion"
pkgver=${launcherVer}_L${loreVer//.}_T${tomeVer//.}
pkgrel=1
arch=('x86_64')
url='https://www.amsel-suite.com/'
license=('custom: commercial')
depends=('at-spi2-core' 'desktop-file-utils' 'libdrm' 'libnotify' 'nss' 'xdg-utils')
optdepends=('alsa-lib' 'gvfs' 'trash-cli' 'pulseaudio')
provides=('amsel_suite' 'amsel_launcher' 'amsel_lore' 'amsel_tome')
conflicts=("amsel_suite")

source=(
  "${amsel_repo}/${launcher_rel}/v${launcherVer}/AmselSuite-linux-x64.AppImage"
  "${amsel_repo}/${lore_rel}/v${loreVer}/Lore-linux-x64-${loreVer}.zip"
  "${amsel_repo}/${tome_rel}/v${tomeVer}/Tome-linux-x64-${tomeVer}.zip"
  "amsel-suite"
)

sha256sums=('7e85f48ae9a2c4bfdfab707887a25a6d5be3f1eacbc9bbb034dc1a4511b1753b'
            '373ea42957088ce9dba3711d22f5097de41ea27226e76265433f3057435ca5e5'
            '6cb985995f97d69e9520e92f1891a0cf26998900b74b96e50ddf636302513edb'
            'de91a5d9f51e1efa094cd32d8ef3b10ef156b053acce40f83042ef8f80262b7d')

prepare() {
  chmod u+x AmselSuite-linux-x64.AppImage
  ${srcdir}/AmselSuite-linux-x64.AppImage --appimage-extract

  sed -i '/\[Desktop Entry\]/a Version=1.5' squashfs-root/AmselSuite.desktop
  sed -i 's#Exec=Amsel\\sSuite#Exec=/opt/amsel/amsel-suite %U#' squashfs-root/AmselSuite.desktop
}
            
package() {
  # install the custom files
  install -Dm755 amsel-suite ${pkgdir}/usr/bin/amsel-suite
  install -Dm755 amsel-suite ${pkgdir}/opt/amsel/amsel-suite

  install -Dm644 squashfs-root/AmselSuite.desktop ${pkgdir}/usr/share/applications/AmselSuite.desktop
  install -Dm644 squashfs-root/AmselSuite.png ${pkgdir}/usr/share/pixmaps/AmselSuite.png
  
  # copy the launcher
  cp -r ${srcdir}/squashfs-root/usr/bin/ ${pkgdir}/opt/amsel/launcher

  # copy the utilities
  mv ${srcdir}/Lore-linux-x64 ${pkgdir}/opt/amsel/Lore
  chmod 755 ${pkgdir}/opt/amsel/Lore
  mv ${srcdir}/Tome-linux-x64 ${pkgdir}/opt/amsel/Tome
  chmod 755 ${pkgdir}/opt/amsel/Tome
}
