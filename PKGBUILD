# Maintainer: snowkeep <novus+amsel at snowkeep dot ca>

amsel_repo='https://github.com/OllamTechnologies'
launcher_rel='launcher-releases/releases/download'
lore_rel='lore-releases/releases/download'
tome_rel='tome-releases/releases/download'

launcherVer=1.0.4
loreVer=1.2.2
tomeVer=1.2.2

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

sha256sums=('148c58a803452b8a7e31691699f32e3069b9671d015d8ff949240ad7ff75de19'
            '3360ffbcf23bffd05e16879d4e82abab244c7e819591c8bc95a1297af86a3682'
            '704a3d2c64d87b21d847931c2e5c859b58ae1d537ca4887e35476e8e36552bf6')

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
