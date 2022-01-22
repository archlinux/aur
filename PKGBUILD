# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="olivetin-bin"
_pkgver=2022-01-06
pkgver="${_pkgver//-/}"
pkgrel=1
pkgdesc="Safe and simple access to predefined shell commands from a web interface"
url="https://www.olivetin.app/"
license=("AGPL3")
arch=("x86_64" "armv5h" "armv6h" "armv7h" "aarch64")
provides=("olivetin")
source_x86_64=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-$_pkgver-linux-amd64.tar.gz")
source_armv5h=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-$_pkgver-linux-arm32v5.tar.gz")
source_armv6h=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-$_pkgver-linux-arm32v6.tar.gz")
source_armv7h=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-$_pkgver-linux-arm32v7.tar.gz")
source_aarch64=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-$_pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('1b760465e1ff93d46d985c604f2cd9798ac298b75420e8c4ca8ec2a7e34e6be1')
sha256sums_armv5h=('02d333366483e5ffac88540e013bc725ac3cfaafaa3adb239814711173e8b127')
sha256sums_armv6h=('b77e5648b396585ffb610ceaa6968a2d57c54933be0b16988a5764e865dea1db')
sha256sums_armv7h=('658df43ad0cfa94c713ed6e747fc89ae1a142a63a9c8ac7cd73435852fc5f24c')
sha256sums_aarch64=('c4badaac91973e83330b3d868ceefdbc03cc06cbf4d00ef7008c5cb1cfe945e1')
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
