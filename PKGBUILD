# Maintainer: su226 <thesu226 at outlook dot com>
# Contributor: alphRomeo323 <alpharomeo323dev at protonmail dot com>
# Contributor: William Brown <glowinthedarkcia at horsefucker dot org>
pkgname=ftba-electron
pkgver=202401041638_9dc7936164
pkgrel=1
url="https://feed-the-beast.com/app"
# launcher_*.jar contains libjnidispatch.so for x86, x86_64, s390x, riscv64, ppc64le, ppc, mips64el, arm, armel and aarch64.
arch=(any)
pkgdesc="Offers many different styles of Minecraft modpacks to the community. (Use system Electron)"
source=("https://apps.modpacks.ch/FTBApp/release/${pkgver//_/-}/FTBA_linux_${pkgver//_/-}.deb"
        "ftb-app.desktop"
        "ftb-app.sh")
sha256sums=("148f0b178da76a1600415491dc9c4856ad7b5ccc8ee542cac4cfa8f40be40027"
            "2b50da4dc2811b175e5602e91dfe18e981cba3e2e80deccb8f12b59776d8c530"
            "79fd5651f4994d98c6f48a91ccf8eae316c8ee21cd30e02bfe58202cf48aecf3")
license=("LGPL2.1")
depends=("java-runtime=17" "electron22")
# FTBA will download Adoptium for Minecraft, although system Java can be used too.
optdepends=("java-runtime=11: For playing some version of Minecraft with system Java."
            "java-runtime=8: For playing some version of Minecraft with system Java.")
makedepends=("asar")
provides=("ftba")
conflicts=("ftba")

package() {
  tar -xzf data.tar.gz

  install -Dm644 "$srcdir/opt/FTBA/launcher-${pkgver//_/-}-all.jar" "$pkgdir/usr/lib/ftb-app/launcher-${pkgver//_/-}-all.jar"
  install -Dm755 "$srcdir/opt/FTBA/FTBApp" "$pkgdir/usr/lib/ftb-app/FTBApp"
  cp -r "$srcdir/opt/FTBA/.install4j" "$pkgdir/usr/lib/ftb-app/.install4j"

  # Since 1.6.3 or 202312062219-b2294521bd (maybe 1.6.0?) a missing version.json will break the app.
  # Modify __dirname to let the frontend detect version.json correctly
  asar e "$srcdir/opt/FTBA/bin/resources/app.asar" "$srcdir/app"
  sed -i 's#__dirname#"/usr/lib/ftb-app/bin/app.asar"#g' "$srcdir/app/js/chunk-3344634f."*".js"
  asar p "$srcdir/app" "$srcdir/app.asar"
  install -Dm644 "$srcdir/app.asar" "$pkgdir/usr/lib/ftb-app/bin/app.asar"
  install -Dm755 "$srcdir/ftb-app.sh" "$pkgdir/usr/lib/ftb-app/bin/ftb-app"

  install -Dm644 "$srcdir/ftb-app.desktop" "$pkgdir/usr/share/applications/ftb-app.desktop"
  install -Dm644 "$srcdir/opt/FTBA/.install4j/FTBApp.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ftb-app.png"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/ftb-app/FTBApp" "$pkgdir/usr/bin/ftb-app"
}
