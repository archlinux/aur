# Maintainer: su226 <thesu226 at outlook dot com>
# Contributor: alphRomeo323 <alpharomeo323dev at protonmail dot com>
# Contributor: William Brown <glowinthedarkcia at horsefucker dot org>
pkgname=ftba-electron
pkgver=1.25.8
pkgrel=1
epoch=1
url="https://feed-the-beast.com/app"
# launcher-*-all.jar contains libjnidispatch.so for x86, x86_64, s390x, riscv64, ppc64le, ppc, mips64el, arm, armel and aarch64.
arch=(any)
pkgdesc="Offers many different styles of Minecraft modpacks to the community. (Use system Electron)"
source=("https://piston.feed-the-beast.com/app/ftb-app-${pkgver}-amd64.deb"
        "ftb-app.sh")
sha256sums=("5c304798857e3bc584a8762d85be84fbac812c157fac863de1c9bf20566fb013"
            "75932906ceb77038225edcbf5890af9857cf3583cc03da71fd056c3ea23b299e")
license=("LGPL2.1")
depends=("electron28")
# FTBA will download Adoptium for itself and Minecraft, although system Java can be used for Minecraft too.
optdepends=("java-runtime: Playing Minecraft with system Java.")
makedepends=("asar")
provides=("ftba")
conflicts=("ftba")

package() {
  tar -xJf data.tar.xz

  # A missing meta.json will break the app
  # Modify process.resourcesPath to let the frontend detect meta.json correctly
  asar e "$srcdir/opt/FTB Electron App/resources/app.asar" "$srcdir/app"
  sed -i '1i delete process.resourcesPath;process.resourcesPath=process.env["FTB_APP_PATH"];' "$srcdir/app/js/index."*".js"
  asar p "$srcdir/app" "$srcdir/opt/FTB Electron App/resources/app.asar"

  install -Dm755 "$srcdir/ftb-app.sh" "$pkgdir/usr/lib/ftb-app/ftb-app"
  cp -rT "$srcdir/opt/FTB Electron App/resources" "$pkgdir/usr/lib/ftb-app"

  cp -rT "$srcdir/usr/share" "$pkgdir/usr/share"
  sed -i "s#/opt/FTB Electron App/ftb-app#/usr/bin/ftb-app#" "$pkgdir/usr/share/applications/ftb-app.desktop"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/ftb-app/ftb-app" "$pkgdir/usr/bin/ftb-app"
}
