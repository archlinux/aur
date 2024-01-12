# Maintainer: su226 <thesu226 at outlook dot com>
# Contributor: alphRomeo323 <alpharomeo323dev at protonmail dot com>
# Contributor: William Brown <glowinthedarkcia at horsefucker dot org>
pkgname=ftba
pkgver=202401041638_9dc7936164
pkgrel=1
url="https://feed-the-beast.com/app"
arch=(x86_64)
pkgdesc="Offers many different styles of Minecraft modpacks to the community."
source=("https://apps.modpacks.ch/FTBApp/release/${pkgver//_/-}/FTBA_linux_${pkgver//_/-}.deb"
        "ftb-app.desktop")
sha256sums=("148f0b178da76a1600415491dc9c4856ad7b5ccc8ee542cac4cfa8f40be40027"
            "2b50da4dc2811b175e5602e91dfe18e981cba3e2e80deccb8f12b59776d8c530")
license=("LGPL2.1")
depends=("java-runtime=17" "alsa-lib" "nss" "gtk3")
# FTBA will download Adoptium for Minecraft, although system Java can be used too.
optdepends=("java-runtime=11: For playing some version of Minecraft with system Java."
            "java-runtime=8: For playing some version of Minecraft with system Java.")

package() {
  tar -xzf "$srcdir/data.tar.gz" -C "$pkgdir"

  # remove macOS specific files
  rm -r "$pkgdir/opt/FTBA/bin/ftbapp.app"

  # remove bundled jre, java-runtime=17 is dependency.
  rm -r "$pkgdir/opt/FTBA/jre"

  # set correct permission
  chmod +x "$pkgdir/opt/FTBA/bin/ftb-app"

  # move /opt/FTBA to /usr/lib/ftb-app
  install -d "$pkgdir/usr/lib"
  mv "$pkgdir/opt/FTBA" "$pkgdir/usr/lib/ftb-app"
  rmdir "$pkgdir/opt"

  install -Dm644 "$srcdir/ftb-app.desktop" "$pkgdir/usr/share/applications/ftb-app.desktop"
  install -Dm644 "$pkgdir/usr/lib/ftb-app/.install4j/FTBApp.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ftb-app.png"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/ftb-app/FTBApp "$pkgdir/usr/bin/ftb-app"
}
