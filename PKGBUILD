# Maintainer: su226 <thesu226 at outlook dot com>
# Contributor: alphRomeo323 <alpharomeo323dev at protonmail dot com>
# Contributor: William Brown <glowinthedarkcia at horsefucker dot org>
pkgname=ftba-electron
pkgver=202312062219_b2294521bd
pkgrel=1
url="https://feed-the-beast.com/app"
# launcher_*.jar contains libjnidispatch.so for x86, x86_64, s390x, riscv64, ppc64le, ppc, mips64el, arm, armel and aarch64.
arch=(any)
pkgdesc="Offers many different styles of Minecraft modpacks to the community. (Use system Electron)"
source=("https://apps.modpacks.ch/FTBApp/release/${pkgver//_/-}/FTBA_linux_${pkgver//_/-}.deb"
        "ftb-app.desktop"
        "ftb-app"
        "preload.js")
sha256sums=("c5e84451d9e82be8008b1e56f32d9df521ef4a5e896daf4a91f24593079459d4"
            "2b50da4dc2811b175e5602e91dfe18e981cba3e2e80deccb8f12b59776d8c530"
            "d989f8ad94ac6c3fc5f0fde1b48db114e1f0732b092f5b077acee418a3bb333a"
            "b4f7738e557d146db3546ad63b6ac1cd8d4ebb167ed782671e536a6e744e997f")
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

  _jar="launcher-${pkgver//_/-}-all.jar"
  install -Dm644 "$srcdir/opt/FTBA/$_jar" "$pkgdir/usr/lib/ftb-app/$_jar"
  install -Dm755 "$srcdir/opt/FTBA/FTBApp" "$pkgdir/usr/lib/ftb-app/FTBApp"
  cp -r "$srcdir/opt/FTBA/.install4j" "$pkgdir/usr/lib/ftb-app/.install4j"
  install -Dm755 "$srcdir/ftb-app" "$pkgdir/usr/lib/ftb-app/bin/ftb-app"
  # preload.js will set the correct process.execPath for /usr/lib/ftb-app/bin/ftb-app to find /usr/lib/ftb-app/FTBApp
  # This is required only when run /usr/lib/ftb-app/bin/ftb-app directly
  install -Dm644 "$srcdir/preload.js" "$pkgdir/usr/lib/ftb-app/bin/preload.js"
  # Since 1.6.3 or 202312062219-b2294521bd (maybe 1.6.0?) a missing version.json will break the app.
  # Modify __dirname to let the frontend detect version.json correctly
  asar e "$srcdir/opt/FTBA/bin/resources/app.asar" "$pkgdir/usr/lib/ftb-app/bin"
  sed -i 's#__dirname#"/usr/lib/ftb-app/bin"#g' "$pkgdir/usr/lib/ftb-app/bin/js/chunk-3344634f.ddc5d1b9.js"

  install -Dm644 "$srcdir/ftb-app.desktop" "$pkgdir/usr/share/applications/ftb-app.desktop"
  install -Dm644 "$srcdir/opt/FTBA/.install4j/FTBApp.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ftb-app.png"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/ftb-app/FTBApp" "$pkgdir/usr/bin/ftb-app"
}
