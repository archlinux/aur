# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname=aide-ide-bin
pkgver=1.96.4.25031
pkgrel=1
pkgdesc='The open-source AI-native IDE, fork of VS Code.'
arch=('x86_64')
url='https://aide.dev/'
license=('AGPL-3.0-or-later')
depends=('fontconfig' 'libxtst' 'gtk3' 'python3' 'cairo' 'alsa-lib' 'nss' 'gcc' 'libnotify' 'libxss' 'glibc' 'bash')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/codestoryai/binaries/releases/download/$pkgver/Aide-linux-x64-$pkgver.tar.gz"
  'aide.sh'
  'aide.desktop'
  'aide-wayland.desktop'
  'aide-url-handler.desktop'
)
sha256sums=(
  '3e50a26d75ce1af8e5a5796f1d7d53ae325bcbc80dd60484950cd00a6f84f8d0'
  '0cd15f0cbd0cc93cb0e8fde893f97f33120e2eaee511526524ffde55805b72ae'
  'a27c3bde1179b792f5df160b5678342f7273b3784223403065265fa5308ad605'
  'f17ea7d221c79c9eaceaec69c0ca0db12f1b54699869b859a169db8ba5364fc5'
  '0d9408b36d84bd3f76c8f563b39fc4da7264bdc0e06b45f42ac1c9d57a7e24b3'
)

# Official install script is available here:
# https://raw.githubusercontent.com/codestoryai/binaries/main/linux/linux_install.sh

package() {
  PKGDIR="$pkgdir/opt/aide"

  # copy contents of the tarball to target package
  mkdir -p $PKGDIR
  cp -at "$PKGDIR" *

  # install launch script
  install -Dm 755 aide.sh $pkgdir/usr/bin/aide

  # install the icon
  install -Dm 644 "${PKGDIR}/resources/app/resources/linux/code.png" $pkgdir/usr/share/pixmaps/aide.png

  # install desktop entries
  install -Dt $pkgdir/usr/share/applications/ *.desktop

  # set up permissions
  chmod 4755 "${PKGDIR}/chrome-sandbox"
  chmod 755 "${PKGDIR}/resources/app/extensions/codestory/sidecar_bin/target/release/webserver"

  # install shell completions
  mkdir -p $pkgdir/usr/share/zsh/site-functions $pkgdir/usr/share/bash-completion/completions
  ln -sf "${PKGDIR}/resources/completions/zsh/_aide" $pkgdir/usr/share/zsh/site-functions/_aide
  ln -sf "${PKGDIR}/resources/completions/bash/aide" $pkgdir/usr/share/bash-completion/completions/aide
}
