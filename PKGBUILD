# Maintainer: Alfredo Palhares <alfredo@palhares.me>

# Please contribute to:
# https://github.com/masterkorp/joplin-pkgbuild

pkgname=joplin
pkgver=1.0.114
pkgrel=1
pkgdesc="Joplin - a note taking and to-do application with synchronization capabilities for Windows, macOS, Linux, Android and iOS."
arch=("x86_64" "i686")
makedepends=("git" "nodejs" "rsync" "npm" "gconf")
depends=("nodejs")
provides=("joplin" "joplin-cli")
url="https://joplin.cozic.net"
license=("MIT")
source=("${pkgname}.desktop" "joplin-desktop.sh" "joplin.sh"
        "https://github.com/laurent22/joplin/archive/v${pkgver}.zip")
sha256sums=("c9143c3f571dbefa0da6ccbfacc5b0088891dcd148ab3ab51decec9dc10ac0ee"
            "5a3ace64906080adde5a5ea10ec9221fb2d94de770e6ee35b454aa30608b4097"
            "5e3424162814db56718b01740af1ef7c9b30e00f563040456eeb8b7eaca81427"
            "766d493ac3253e4881878e0db90bda0cfd51f21701430eb1d4d90e88c7a5f1bc")

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
