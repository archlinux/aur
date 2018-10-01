# Maintainer: Alfredo Palhares <alfredo@palhares.me>

# Please contribute to:
# https://github.com/masterkorp/joplin-pkgbuild

pkgname=joplin
pkgver=1.0.111
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
sha256sums=("9ee4a831a0853ddbdc7279629d8f9238d3737b570898be16176ba0968b53d43d"
            "5a3ace64906080adde5a5ea10ec9221fb2d94de770e6ee35b454aa30608b4097"
            "5e3424162814db56718b01740af1ef7c9b30e00f563040456eeb8b7eaca81427"
            "0f09ddad70c7795c1cd557e884a4a253e5fbe7dd66bda268dd77fb9705954dcc")

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
