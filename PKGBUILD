

# Please contribute to:
# https://github.com/masterkorp/joplin-pkgbuild

pkgname=joplin
pkgver=1.0.178
pkgrel=1
pkgdesc="Joplin - a note taking and to-do application with synchronization capabilities for Windows, macOS, Linux, Android and iOS."
arch=("x86_64" "i686")
makedepends=("git" "nodejs" "rsync" "npm" "python")
depends=("nodejs" "libxss")
provides=("joplin" "joplin-cli")
url="https://joplinapp.org/"
license=("MIT")
source=("joplin.desktop" "joplin-desktop.sh" "joplin.sh"
        "https://github.com/laurent22/joplin/archive/v${pkgver}.zip")
sha256sums=('ce4435654ee1f6d51d361945f32dd9bf07308f423c3f3c3db147744f203fbc2b'
            '41bfdc95a6ee285eb644d05eb3bded72a83950d4720c3c8058ddd3c605cd625d'
            '5245da6f5f647d49fbe044b747994c9f5a8e98b3c2cd02757dd189426a677276'
            'a883032e2e929d4ce322fc5fefa36eedce77f86aeae3217eb52653ec6320351e')

build() {
  # Remove husky (git hooks) from dependencies
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i '/"husky": ".*"/d' package.json

  # Force Lang
  # INFO: https://github.com/alfredopalhares/joplin-pkgbuild/issues/25
  export LANG=en_US.utf8

  # Install dependencies for the Tools used on another projects
  cd "${srcdir}/${pkgname}-${pkgver}/Tools"
  npm install

  # Run copyLib and build the typescript
  # INFO: https://github.com/alfredopalhares/joplin-pkgbuild/issues/40
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
  #rm -r "${pkgdir}/usr/share/${pkgname}-cli/node_modules/sqlite3/.vscode"
  cp -R "${srcdir}/${pkgname}-${pkgver}/ElectronClient/app/dist/linux-unpacked/"* \
    "${pkgdir}/usr/share/${pkgname}"


  cd ${srcdir}
  install -m755 joplin-desktop.sh "${pkgdir}/usr/bin/joplin-desktop"
  install -m755 joplin.sh "${pkgdir}/usr/bin/joplin"

  install -Dm644 joplin.desktop "${pkgdir}/usr/share/applications/joplin.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
