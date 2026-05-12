# Maintainer:  MadeOfMagicAndWires <contact at made of magic and wires dot online>
# Contributor: meanlint <meanlint@outlook.com>
# Contributor: shaka042 <chefmayonaisse.observant341 at slmails dot com>
# Contributor: Aria Moradi <aria.moradi007 at gmail dot com>
# Contributor: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=suwayomi-server-bin
pkgver=2.2.2100
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
_pkgname=$(printf "${pkgname}" | cut -d - -f -2)
_PkgName=${_pkgname//s/S}
_jar="${_pkgname}-v$_pkgver.jar"
_assets="${_PkgName}-v$_pkgver-linux-assets"
backup=("etc/suwayomi/server.conf")
source=(
    "$url/releases/download/v$_pkgver/${_jar}"
    "$url/releases/download/v$_pkgver/$_assets.tar.gz"
    "https://raw.githubusercontent.com/Suwayomi/${_PkgName}/refs/tags/v${pkgver}/scripts/resources/catch_abort.c"
)
noextract=("$_jar")
sha256sums=('3c8132a43bfa9b959b0c8fdbdcf9aa01bd809047ff4fbc1a4aae0eb71331f05e'
            '1beb44e42760445e6a8e83f354926100fbf6161f624782d6d78a1f81130046f2'
            'c08aa53d12d6b9944bed6e624ed271c94c771e24e9578600b5718b9754a39d3c')

build() {
   # Add missing abort handler
   export JAVA_HOME="/usr/lib/jvm/default"
   gcc -fPIC -I$JAVA_HOME/include -I$JAVA_HOME/include/linux -shared catch_abort.c -lpthread -o catch_abort.so
}

package() {
  cd "$srcdir/"
  install -Dm644 "catch_abort.so"                         "$pkgdir/usr/share/java/$_pkgname/bin/catch_abort.so"
  install -Dm644 "$_jar"                                  "$pkgdir/usr/share/java/$_pkgname/bin/$_PkgName.jar"
  cd "$srcdir/$_assets/"
  install -Dm644 "${pkgname%-bin}.conf"                   "$pkgdir/etc/suwayomi/server.conf"
  install -Dm644 "${pkgname%-bin}.service"                "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "${pkgname%-bin}.sysusers"               "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "${pkgname%-bin}.tmpfiles"               "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 "${pkgname%-bin}.desktop"                "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "${pkgname%-bin}.png"                    "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm755 "${pkgname%-bin}.sh"                     "$pkgdir/usr/bin/$_pkgname"
  # keep backwards compatibility
  ln -sr "$pkgdir/usr/bin/${_pkgname}"                "$pkgdir/usr/bin/suwayomi"
}
