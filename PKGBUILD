# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="olivetin-bin"
_pkgver=2022-10-19
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="Safe and simple access to predefined shell commands from a web interface"
url="https://www.olivetin.app/"
license=("AGPL3")
arch=("x86_64" "armv5h" "armv6h" "armv7h" "aarch64")
provides=("olivetin")
conflicts=("olivetin")
source_x86_64=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-linux-amd64.tar.gz")
source_armv5h=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-linux-arm32v5.tar.gz")
source_armv6h=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-linux-arm32v6.tar.gz")
source_armv7h=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-linux-arm32v7.tar.gz")
source_aarch64=("https://github.com/OliveTin/OliveTin/releases/download/$_pkgver/OliveTin-linux-arm64.tar.gz")
source=("olivetin.service"
        "olivetin@.service")
sha256sums=('7d69ac6da345c383b616df7bab83257efa63c7c3574991dfe6e7b8976664ddb3'
            '23d7f8b5bdc5d508cb8c23efd356d99ea5ad6d29f79c1cd4084f7d0f302ac49a')
sha256sums_x86_64=('95e8a37ff01d85736db155be4d763fdc6d444414dbbd66e2f2749ee73eef6bbb')
sha256sums_armv5h=('422ced0e3afba7c0ca937a3c5833c2693b196f61d5e0dadae6ece748d7f4a0b8')
sha256sums_armv6h=('ec12b5db6ddc00acc778950d5b5a4bcd2d188338fb8bb802bffb6a21ba0e790d')
sha256sums_armv7h=('cf311c4e25c7278e3ed53378ff260bcc4945efc9c29efcae2f60fce94aee5f56')
sha256sums_aarch64=('a0cc96d3f33c95a0f3c76c7177d3b01de9846226d8b8bc434bfce21719602bd2')
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
