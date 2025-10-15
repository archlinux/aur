# Maintainer: meanlint <meanlint@outlook.com>
# Maintainer: shaka042 <chefmayonaisse.observant341 at slmails dot com>
# Contributor: Aria Moradi <aria.moradi007 at gmail dot com>
# Contributor: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=suwayomi-server-preview-bin
_pkgname=suwayomi-server
_PkgName=Suwayomi-Server
pkgver=2.1.1967
pkgrel=1.4
_pkgver="${pkgver%_*}"
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/Suwayomi-Server-preview"
license=("MPL2")
depends=("java-runtime>=21" "libc++" "gcc")
optdepends=("electron: running in Electron"
    "xorg-server-xvfb: Virtual framebuffer X server to run suwayomi in headless mode"
    "flaresolverr: A proxy server to bypass Cloudflare protection")
provides=("suwayomi" "$_pkgname" "tachidesk" "tachidesk-server")
conflicts=("tachidesk")
_jar="$_PkgName-v$_pkgver.jar"
_assets="$_PkgName-v$_pkgver-linux-assets"
backup=("etc/suwayomi/server.conf")
source=("$url/releases/download/v$_pkgver/$_jar"
  "$url/releases/download/v$_pkgver/$_assets.tar.gz"
  "https://raw.githubusercontent.com/Suwayomi/$_PkgName/refs/heads/master/scripts/resources/catch_abort.c")
noextract=("$_jar")
sha256sums=('SKIP'
            'SKIP'
            'c08aa53d12d6b9944bed6e624ed271c94c771e24e9578600b5718b9754a39d3c'
)

build() {
   # Add missing abort handler
   export JAVA_HOME="/usr/lib/jvm/default"
   gcc -fPIC -I$JAVA_HOME/include -I$JAVA_HOME/include/linux -shared catch_abort.c -lpthread -o catch_abort.so
}

package() {
  cd "$srcdir/"
  install -Dm644 "catch_abort.so"                   "$pkgdir/usr/share/java/$_pkgname/bin/catch_abort.so"
  install -Dm644 "$_jar"                            "$pkgdir/usr/share/java/$_pkgname/bin/$_PkgName.jar"
  cd "$srcdir/$_assets/"
  install -Dm644 "$_pkgname.conf"                   "$pkgdir/etc/suwayomi/server.conf"
  install -Dm644 "$_pkgname.service"                "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "$_pkgname.sysusers"               "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$_pkgname.tmpfiles"               "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 "$_pkgname.desktop"                "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png"                    "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm755 "$_pkgname.sh"                     "$pkgdir/usr/bin/$_pkgname"
  # keep backwards compatibility
  ln -sr "$pkgdir/usr/bin/$_pkgname"                "$pkgdir/usr/bin/suwayomi"
}
