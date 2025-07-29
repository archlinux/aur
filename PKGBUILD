# Maintainer: snowkeep <novus+amsel at snowkeep dot ca>

amsel_repo='https://github.com/OllamTechnologies'
launcher_rel='launcher-releases/releases/download'
lore_rel='lore-releases/releases/download'
tome_rel='tome-releases/releases/download'

launcherVer=1.4.2
loreVer=1.5.2
tomeVer=1.5.2

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

sha256sums=('d723659cdca890ee5ca15325bf3fd8d0feb346367541e1ca154704699daddc26'
            'ce0f33d708183cc88173a0e6f25303dc6de606266ba3e2363ca49509433f356e'
            '9402733c89f005d727b83c2c03d24a439cd1f38c7a41f4a38a600d79a74b5466')

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
