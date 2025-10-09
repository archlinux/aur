# Maintainer:  MadeOfMagicAndWires <contact at made of magic and wires dot online>
# Contributor: meanlint <meanlint@outlook.com>
# Contributor: shaka042 <chefmayonaisse.observant341 at slmails dot com>
# Contributor: Aria Moradi <aria.moradi007 at gmail dot com>
# Contributor: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=suwayomi-server-bin
pkgver=2.1.1867
pkgrel=1
_pkgver="${pkgver%_*}"
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/Suwayomi-Server"
license=("MPL2")
depends=("java-runtime>=21" "libc++" "gcc")
optdepends=("electron: running in Electron"
    "xorg-server-xvfb: Virtual framebuffer X server to run suwayomi in headless mode")
provides=("suwayomi" "suwayomi-webui" "$pkgname" "tachidesk" "tachidesk-server")
conflicts=("tachidesk" "suwayomi-server-preview-bin")
_pkgname=$(printf "${pkgname//s/S}" | cut -d - -f -2)
_jar="${_pkgname}-v$_pkgver.jar"
_assets="${_pkgname}-v$_pkgver-linux-assets"
backup=("etc/suwayomi/server.conf")
source=(
    "$url/releases/download/v$_pkgver/${_jar}"
    "$url/releases/download/v$_pkgver/$_assets.tar.gz"
    "https://raw.githubusercontent.com/Suwayomi/${_pkgname}/refs/tags/v${pkgver}/scripts/resources/catch_abort.c"
)
noextract=("$_jar")
sha256sums=('51e307c2581e4e1a002991ab3e3a77503c8b074c42695987a984a7382d0ac5af'
            '82cf8909bd13de5c4c59c47be07e95eb49481dc65abc2890d4650f39123dbcff'
            'c08aa53d12d6b9944bed6e624ed271c94c771e24e9578600b5718b9754a39d3c')

build() {
   # Add missing abort handler
   export JAVA_HOME="/usr/lib/jvm/default"
   gcc -fPIC -I$JAVA_HOME/include -I$JAVA_HOME/include/linux -shared catch_abort.c -lpthread -o catch_abort.so
}

package() {
  cd "$srcdir/"
  install -Dm644 "catch_abort.so"                  "$pkgdir/usr/share/java/$pkgname/bin/catch_abort.so"
  install -Dm644 "$_jar"                           "$pkgdir/usr/share/java/$pkgname/bin/$_pkgname.jar"
  cd "$srcdir/$_assets/"
  install -Dm644 "${pkgname%-bin}.conf"                   "$pkgdir/etc/suwayomi/server.conf"
  install -Dm644 "${pkgname%-bin}.service"                "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "${pkgname%-bin}.sysusers"               "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "${pkgname%-bin}.tmpfiles"               "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 "${pkgname%-bin}.desktop"                "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "${pkgname%-bin}.png"                    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 "${pkgname%-bin}.sh"                     "$pkgdir/usr/bin/$pkgname"
  # keep backwards compatibility
  ln -sr "$pkgdir/usr/bin/${pkgname%-bin}"                "$pkgdir/usr/bin/suwayomi"
}
