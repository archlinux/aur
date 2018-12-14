# Maintainer: Alfredo Palhares <alfredo@palhares.me>

# Please contribute to:
# https://github.com/masterkorp/joplin-pkgbuild

pkgname=joplin
pkgver=1.0.117
pkgrel=1
pkgdesc="Joplin - a note taking and to-do application with synchronization capabilities for Windows, macOS, Linux, Android and iOS."
arch=("x86_64" "i686")
makedepends=("git" "nodejs-lts-carbon" "rsync" "npm")
depends=("nodejs" "gconf")
provides=("joplin" "joplin-cli")
url="https://joplin.cozic.net"
license=("MIT")
source=("${pkgname}.desktop" "joplin-desktop.sh" "joplin.sh"
        "https://github.com/laurent22/joplin/archive/v${pkgver}.zip")
sha256sums=("5b12984814d7f9ca3c52130d44292fea188c8e6d9372f0ab6db2ff314c123156"
            "41bfdc95a6ee285eb644d05eb3bded72a83950d4720c3c8058ddd3c605cd625d"
            "5245da6f5f647d49fbe044b747994c9f5a8e98b3c2cd02757dd189426a677276"
            "3c5b83be2865249123f657d57544a26e8157395ef84240af984ef5c191b998a1")

build() {

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
  cp "package.json" "${srcdir}/${pkgname}-${pkgver}/CliClient/build"
  cp "package-lock.json" "${srcdir}/${pkgname}-${pkgver}/CliClient/build"

  cd "${srcdir}/${pkgname}-${pkgver}/CliClient/build/"
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
  cp -R "${srcdir}/${pkgname}-${pkgver}/ElectronClient/app/dist/linux-unpacked/"* \
    "${pkgdir}/usr/share/${pkgname}"


  cd ${srcdir}
  install -m755 joplin-desktop.sh "${pkgdir}/usr/bin/joplin-desktop"
  install -m755 joplin.sh "${pkgdir}/usr/bin/joplin"

  install -Dm644 ../joplin.desktop ${pkgdir}/usr/share/applications/joplin.desktop
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
