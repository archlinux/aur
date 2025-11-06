# Maintainer: snowkeep <novus+amsel at snowkeep dot ca>

amsel_repo='https://github.com/OllamTechnologies'
launcher_rel='launcher-releases/releases/download'
lore_rel='lore-releases/releases/download'
tome_rel='tome-releases/releases/download'

launcherVer=1.6.3
loreVer=1.7.4
tomeVer=1.7.4

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

sha256sums=('976c961b012246d7fa026942ae7426ac88431df6a72b00468401a36e196909b8'
            '466df8d07b1e5f2a95732b2a8196cc6ec3e9d126ea4d042012300874160da66b'
            'f14f14f8da6693245f8d5397fea741438bc650d7e1284324ea6db220f5436d01')

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
