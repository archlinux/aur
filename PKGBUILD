# Maintainer: snowkeep <novus+amsel at snowkeep dot ca>

amsel_repo='https://github.com/OllamTechnologies'
launcher_rel='launcher-releases/releases/download'
lore_rel='lore-releases/releases/download'
tome_rel='tome-releases/releases/download'

launcherVer=1.3.4
loreVer=1.3.4
tomeVer=1.3.4

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
"${amsel_repo}/${launcher_rel}/v${launcherVer}/amsel-suite_${launcherVer}_amd64.deb"
"${amsel_repo}/${lore_rel}/v${loreVer}/Lore-linux-x64-${loreVer}.zip"
"${amsel_repo}/${tome_rel}/v${tomeVer}/Tome-linux-x64-${tomeVer}.zip"
)

sha256sums=('de806f58fc322ddad8f601ef1dacc5b35fc37cf273c83efafb00a2e85f4340d9'
            'c1873d64211002ec4eae314d80169ce6b28ea84d285b3d8c8a34e14a72cc9cf0'
            'cb4930007e9f68139e7680b3f9b98450297c9ab71fde840425ad65730edbefaa')

package() {
  cd ${pkgdir}
  bsdtar -xf ${srcdir}/data.tar.zst
  # remove the debian package linter file
  rm -rf usr/share/lintian
  # patch the desktop file to show "amsel-suite" instead of "launcher"
  sed -i 's/launcher/amsel-suite/' usr/share/applications/amsel-suite.desktop

  mkdir opt
  mv ${srcdir}/Lore-linux-x64 ${pkgdir}/opt/Lore
  chmod 755 ${pkgdir}/opt/Lore
  mv ${srcdir}/Tome-linux-x64 ${pkgdir}/opt/Tome
  chmod 755 ${pkgdir}/opt/Tome
}
