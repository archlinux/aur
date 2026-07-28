# Maintainer: snowkeep <novus+amsel at snowkeep dot ca>

amsel_repo='https://github.com/OllamTechnologies'
launcher_rel='launcher-releases/releases/download'
lore_rel='lore-releases/releases/download'
tome_rel='tome-releases/releases/download'

launcherVer=1.9.2
loreVer=1.13.3
tomeVer=1.13.3

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
  "${amsel_repo}/${launcher_rel}/v${launcherVer}/Amsel.Suite-${launcherVer}-x64.AppImage"
  "${amsel_repo}/${lore_rel}/v${loreVer}/Lore-linux-x64-${loreVer}.zip"
  "${amsel_repo}/${tome_rel}/v${tomeVer}/Tome-linux-x64-${tomeVer}.zip"
  "amsel-suite"
  "Amsel Suite.desktop"
  "amsel-suite.png"
)

sha256sums=('a57e69bc726864be834b4d17efd7b6d796022ff4a15d46b9ffe118a9ff0ccab1'
            '75cc2be1a803e874cd256322970d4de689a50abff3d4cd043448cf11a543c105'
            '37994999fd10c035b428dae37c7aef3cac4a448b4e85b0f8770083c032a21051'
            '122c11f8213a170291184d011670c2ef6c2cc8375bc3fc4a7b933a9e46162978'
            '7cf890499f561081990c13ad95e47541317009cbae1f17baded40df1e3c4cfac'
            '62ed78846e3ce8269e4a6d1475b76b82c713d0db3d53b98b7b99cbf6386c3aaf')

prepare() {
	chmod u+x ${srcdir}/Amsel.Suite-${launcherVer}-x64.AppImage
	${srcdir}/Amsel.Suite-${launcherVer}-x64.AppImage --appimage-extract
}
            
package() {
  # install the custom files
  install -Dm755 amsel-suite ${pkgdir}/usr/bin/amsel-suite
  install -Dm755 amsel-suite ${pkgdir}/opt/amsel/amsel-suite
  install -Dm644 Amsel\ Suite.desktop ${pkgdir}/usr/share/applications/Amsel\ Suite.desktop
  install -Dm644 amsel-suite.png ${pkgdir}/usr/share/pixmaps/amsel-suite.png

  # copy the launcher
  cp -r ${srcdir}/squashfs-root/usr/lib/launcher ${pkgdir}/opt/amsel

  # copy the utilities
  mv ${srcdir}/Lore-linux-x64 ${pkgdir}/opt/amsel/Lore
  chmod 755 ${pkgdir}/opt/amsel/Lore
  mv ${srcdir}/Tome-linux-x64 ${pkgdir}/opt/amsel/Tome
  chmod 755 ${pkgdir}/opt/amsel/Tome
}
