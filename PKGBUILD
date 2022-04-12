# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="olivetin-bin"
_pkgver=2022-04-07
pkgver="${_pkgver//-/}"
pkgrel=1
pkgdesc="Safe and simple access to predefined shell commands from a web interface"
url="https://www.olivetin.app/"
license=("AGPL3")
arch=("x86_64" "armv5h" "armv6h" "armv7h" "aarch64")
provides=("olivetin")
conflicts=("olivetin")
source_x86_64=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-$_pkgver-linux-amd64.tar.gz")
source_armv5h=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-$_pkgver-linux-arm32v5.tar.gz")
source_armv6h=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-$_pkgver-linux-arm32v6.tar.gz")
source_armv7h=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-$_pkgver-linux-arm32v7.tar.gz")
source_aarch64=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-$_pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('834adb89db7bed9819c8a600b8e368145019b84db9d53b0b7cecf0c7ca1b9115')
sha256sums_armv5h=('b767a246b516741afcc2f491519aba88c2b78f8da0f299f5c99c8896136cade5')
sha256sums_armv6h=('a31d9f61323ec9ae9f46f6dba6292214c84a0d9fbd70ac067b289618a972286c')
sha256sums_armv7h=('0e3a748b1f0ef453bf4821ebd65b0b33e114de16e56b37ffa05a29f607897f0f')
sha256sums_aarch64=('43554c7194200adf912981c4fc0ff8c479ba2d1c39a7f65517666014cfa3d120')
backup=("etc/OliveTin/config.yaml")

prepare(){
 case "$CARCH" in
  "x86_64") cd "OliveTin-$_pkgver-linux-amd64";;
  "armv5h") cd "OliveTin-$_pkgver-linux-arm32v5";;
  "armv6h") cd "OliveTin-$_pkgver-linux-arm32v6";;
  "armv7h") cd "OliveTin-$_pkgver-linux-arm32v7";;
  "aarch64") cd "OliveTin-$_pkgver-linux-arm64";;
  *) echo "[KO] Unsupported architecture provided" && return 1;;
 esac

 # additional configurations defaults
 cat >> "config.yaml" <<CONTENT

# see https://docs.olivetin.app/hide-nav.html
hideNavigation: false

# see https://docs.olivetin.app/network-ports.html
listenAddressRestActions: localhost:1338
listenAddressGrpcActions: localhost:1339
listenAddressWebUI: localhost:1340

# see https://docs.olivetin.app/update-tracking.html
checkForUpdates: true
showNewVersions: true
CONTENT

 # use arch paths
 sed -i "OliveTin.service" \
     -e "s|\[Service\]|&\nWorkingDirectory=/var/lib/olivetin\nUser=root\nGroup=root|" \
     -e "s|/usr/local/bin/OliveTin|/usr/bin/olivetin|"
}

package(){
 case "$CARCH" in
  "x86_64") cd "OliveTin-$_pkgver-linux-amd64";;
  "armv5h") cd "OliveTin-$_pkgver-linux-arm32v5";;
  "armv6h") cd "OliveTin-$_pkgver-linux-arm32v6";;
  "armv7h") cd "OliveTin-$_pkgver-linux-arm32v7";;
  "aarch64") cd "OliveTin-$_pkgver-linux-arm64";;
  *) echo "[KO] Unsupported architecture provided" && return 1;;
 esac
 install -d -m 755 "$pkgdir/etc/OliveTin"
 install -d -m 755 "$pkgdir/usr/share/webapps"
 install -d -m 755 "$pkgdir/var/lib/olivetin"
 install -D -m 755 "OliveTin" "$pkgdir/usr/bin/olivetin"
 install -D -m 644 "OliveTin.service" "$pkgdir/usr/lib/systemd/system/olivetin.service"
 install -D -m 644 "config.yaml" "$pkgdir/etc/OliveTin/config.yaml"
 cp -r "webui" "$pkgdir/usr/share/webapps/olivetin"
 ln -s "/usr/share/webapps/olivetin" "$pkgdir/var/lib/olivetin/webui"
}
