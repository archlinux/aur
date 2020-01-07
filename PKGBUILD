# Maintainer: Alfredo Palhares <alfredo@palhares.me>

# Please contribute to:
# https://github.com/masterkorp/joplin-pkgbuild

pkgname=joplin
pkgver=1.0.176
pkgrel=1
pkgdesc="Joplin - a note taking and to-do application with synchronization capabilities for Windows, macOS, Linux, Android and iOS."
arch=("x86_64" "i686")
makedepends=("git" "nodejs" "rsync" "npm" "python")
depends=("nodejs" "gconf" "libxss")
provides=("joplin" "joplin-cli")
url="https://joplin.cozic.net"
license=("MIT")
source=("joplin.desktop" "joplin-desktop.sh" "joplin.sh"
        "https://github.com/laurent22/joplin/archive/v${pkgver}.zip")
sha256sums=('f3c3379ceb3eee166e50d0ad85c0c52ae1c1602ecbd8fcc070b81b5fac719e28'
            '41bfdc95a6ee285eb644d05eb3bded72a83950d4720c3c8058ddd3c605cd625d'
            '5245da6f5f647d49fbe044b747994c9f5a8e98b3c2cd02757dd189426a677276'
            '5709de7bebb5ff680be461f0e14548398915d26bd13cc01accb5b79ef05be9e2')

build() {
  # Remove husky (git hooks) from dependencies
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i '/"husky": ".*"/d' package.json
  
  # Install dependencies for the Tools used on another projects
  cd "${srcdir}/${pkgname}-${pkgver}/Tools"
  npm install

  # Run copyLib and build the typescript
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install
  npm run copyLib
  npm run tsc 

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

  npm install

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
