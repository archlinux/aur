# Maintainer: snowkeep <novus+amsel at snowkeep dot ca>

amsel_repo='https://github.com/OllamTechnologies'
launcher_rel='launcher-releases/releases/download'
lore_rel='lore-releases/releases/download'
tome_rel='tome-releases/releases/download'

launcherVer=1.14.0
loreVer=1.14.2
tomeVer=1.14.2

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

sha256sums=('a857c1e10ef7ed0ab339663ddc09254c1b0036701cec6ffa93d44a764abfe3c5'
            'd36ba1272fbe1c05e616cc8cb938ed89c7b7166181454a8bf406cfab79a0bd6e'
            '59fb5f1b31f277517c071dd86cb674c86951864e409528e6441e8da5cded1838'
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
