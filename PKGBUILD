# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="olivetin-bin"
pkgver=2023.03.25
pkgrel=1
pkgdesc="Safe and simple access to predefined shell commands from a web interface"
url="https://www.olivetin.app/"
license=("AGPL3")
arch=("x86_64" "armv5h" "armv6h" "armv7h" "aarch64")
provides=("olivetin")
conflicts=("olivetin")
source_x86_64=("https://github.com/OliveTin/OliveTin/releases/download/$pkgver/OliveTin-linux-amd64.tar.gz")
source_armv5h=("https://github.com/OliveTin/OliveTin/releases/download/$pkgver/OliveTin-linux-arm32v5.tar.gz")
source_armv6h=("https://github.com/OliveTin/OliveTin/releases/download/$pkgver/OliveTin-linux-arm32v6.tar.gz")
source_armv7h=("https://github.com/OliveTin/OliveTin/releases/download/$pkgver/OliveTin-linux-arm32v7.tar.gz")
source_aarch64=("https://github.com/OliveTin/OliveTin/releases/download/$pkgver/OliveTin-linux-arm64.tar.gz")
source=("olivetin.service"
        "olivetin@.service")
sha256sums=('7d69ac6da345c383b616df7bab83257efa63c7c3574991dfe6e7b8976664ddb3'
            '23d7f8b5bdc5d508cb8c23efd356d99ea5ad6d29f79c1cd4084f7d0f302ac49a')
sha256sums_x86_64=('b3ee849b4af4ddd89c4cee01ae07ee689628836f9448996f14e1a7030f5b0f71')
sha256sums_armv5h=('b03fa6a960bd5e6cf9c3348f4b857cb0296f2283163d946b2081bbaede5fdc23')
sha256sums_armv6h=('9bf9611363d6febab79ff4f195323d7ae83d1fefe566e83b32f14157961ea63e')
sha256sums_armv7h=('4c0d687bb108d2cf4e6dea4582c1c2e16b7e285a462e00efcd14aa3cad4a3e54')
sha256sums_aarch64=('cce2f55d7faa932fd874c96563c2d571731b1ea8d34761b7b5994c45a1874559')
backup=("etc/olivetin/config.yaml")

prepare(){
 # enter the proper directory
 case "$CARCH" in
  "x86_64") cd "OliveTin-linux-amd64";;
  "armv5h") cd "OliveTin-linux-arm32v5";;
  "armv6h") cd "OliveTin-linux-arm32v6";;
  "armv7h") cd "OliveTin-linux-arm32v7";;
  "aarch64") cd "OliveTin-linux-arm64";;
  *) echo "[KO] Unsupported architecture provided" && return 1;;
 esac

 # additional configuration defaults
 cat >> "config.yaml" <<CONTENT

# see https://docs.olivetin.app/hide-nav.html
ShowNavigation: true
ShowFooter: true

# see https://docs.olivetin.app/network-ports.html
listenAddressRestActions: localhost:1338
listenAddressGrpcActions: localhost:1339
listenAddressWebUI: localhost:1340

# see https://docs.olivetin.app/update-tracking.html
checkForUpdates: true
showNewVersions: true
CONTENT
}

package(){
 # enter the proper directory
 case "$CARCH" in
  "x86_64") cd "OliveTin-linux-amd64";;
  "armv5h") cd "OliveTin-linux-arm32v5";;
  "armv6h") cd "OliveTin-linux-arm32v6";;
  "armv7h") cd "OliveTin-linux-arm32v7";;
  "aarch64") cd "OliveTin-linux-arm64";;
  *) echo "[KO] Unsupported architecture provided" && return 1;;
 esac
 
 # binary
 install -D -m 755 "OliveTin" "$pkgdir/usr/bin/olivetin"
 
 # configuration
 install -d -m 755 "$pkgdir/etc/olivetin"
 install -D -m 644 "config.yaml" "$pkgdir/etc/olivetin/config.yaml"

 # webui files
 install -d -m 755 "$pkgdir/usr/share/webapps/olivetin"
 cp -r "webui" "$pkgdir/usr/share/webapps/olivetin"

 # systemd unit
 install -D -m 644 "$srcdir/olivetin.service" "$pkgdir/usr/lib/systemd/system/olivetin.service"
 install -D -m 644 "$srcdir/olivetin@.service" "$pkgdir/usr/lib/systemd/system/olivetin@.service"
}
