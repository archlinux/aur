# Maintainer: Alfredo Palhares <alfredo@palhares.me>

# Please contribute to:
# https://github.com/masterkorp/joplin-pkgbuild

pkgname=joplin
pkgver=1.0.175
pkgrel=2
pkgdesc="Joplin - a note taking and to-do application with synchronization capabilities for Windows, macOS, Linux, Android and iOS."
arch=("x86_64" "i686")
makedepends=("git" "nodejs" "rsync" "npm" "python")
depends=("nodejs" "gconf" "libxss")
provides=("joplin" "joplin-cli")
url="https://joplin.cozic.net"
license=("MIT")
source=("joplin.desktop" "joplin-desktop.sh" "joplin.sh"
        "https://github.com/laurent22/joplin/archive/v${pkgver}.zip")
sha256sums=('c1ece73d0d8afcd3723ebf3b4d4d614d84e5ef8de0e61fc00c118847563da88d'
            '41bfdc95a6ee285eb644d05eb3bded72a83950d4720c3c8058ddd3c605cd625d'
            '5245da6f5f647d49fbe044b747994c9f5a8e98b3c2cd02757dd189426a677276'
            'cebf2c82ba11a2dece36606319cd16f0c1a5b36bec88813c61f41cb576e4a37a')

build() {
  # Remove husky (git hooks) from dependencies
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i '/"husky": ".*"/d' package.json

  # Install dependencies for the Tools used on another projects
  cd "${srcdir}/${pkgname}-${pkgver}/Tools"
  npm install

  # Build Cli CLient
  cd "${srcdir}/${pkgname}-${pkgver}/CliClient"

  rsync -a --exclude "node_modules/" "${srcdir}/${pkgname}-${pkgver}/CliClient/app/" \
    "${srcdir}/${pkgname}-${pkgver}/CliClient/build"
  rsync -a --delete "${srcdir}/${pkgname}-${pkgver}/ReactNativeClient/locales" \
    "${srcdir}/${pkgname}-${pkgver}/CliClient/build/"
  rsync -a --delete "${srcdir}/${pkgname}-${pkgver}/ReactNativeClient/lib/" \
    "${srcdir}/${pkgname}-${pkgver}/CliClient/build/lib"

  cd "${srcdir}/${pkgname}-${pkgver}/CliClient/build/"
  # NOTE: Manually forcing sqlite 4.0.7 for node v12, remove later on
  npm install

  # Electron App
  cd "${srcdir}/${pkgname}-${pkgver}/ElectronClient/app"

  # NOTE: Manually forcing sqlite 4.0.7 for node v12, remove later on
  npm install sqlite3@4.0.7
  npm install
  # Remove uneeed .vscode path that comes with it
  rm -r node_modules/sqlite3/.vscode

  rsync -a --delete "${srcdir}/${pkgname}-${pkgver}/ReactNativeClient/lib/" \
    "${srcdir}/${pkgname}-${pkgver}/ElectronClient/app/lib/"
  npm run compile
  npm run pack
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{${pkgname},${pkgname}-cli,applications,licenses/${pkgname}}

  cp -R "${srcdir}/${pkgname}-${pkgver}/CliClient/build/"* \
    "${pkgdir}/usr/share/${pkgname}-cli"
  cp -R "${srcdir}/${pkgname}-${pkgver}/CliClient/node_modules" \
    "${pkgdir}/usr/share/${pkgname}-cli"
  # Remove uneeded .vscode from a dependency
  rm -r "${pkgdir}/usr/share/${pkgname}-cli/node_modules/sqlite3/.vscode"
  cp -R "${srcdir}/${pkgname}-${pkgver}/ElectronClient/app/dist/linux-unpacked/"* \
    "${pkgdir}/usr/share/${pkgname}"


  cd ${srcdir}
  install -m755 joplin-desktop.sh "${pkgdir}/usr/bin/joplin-desktop"
  install -m755 joplin.sh "${pkgdir}/usr/bin/joplin"

  install -Dm644 joplin.desktop "${pkgdir}/usr/share/applications/joplin.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
