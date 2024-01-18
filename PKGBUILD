# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="olivetin-bin"
pkgver=2023.12.21
pkgrel=1
pkgdesc="Safe and simple access to predefined shell commands from a web interface"
url="https://www.olivetin.app/"
license=("AGPL3")
arch=("x86_64" "aarch64" "armv7h")
provides=("olivetin")
conflicts=("olivetin")
source_x86_64=("https://github.com/OliveTin/OliveTin/releases/download/$pkgver/OliveTin-linux-amd64.tar.gz")
source_aarch64=("https://github.com/OliveTin/OliveTin/releases/download/$pkgver/OliveTin-linux-arm64.tar.gz")
source_armv7h=("https://github.com/OliveTin/OliveTin/releases/download/$pkgver/OliveTin-linux-arm7.tar.gz")
source=("olivetin.service"
        "olivetin@.service")
b2sums=('cf0964dfb726921c3b523722ae3a883e4630d1fef19f2208a9bf0ebd5907856ee54ff8f49cee8c4ec896be5253230ed4bc36b1a8d8a4bce4d1c1b57324664e01'
        'd9e2203ae618d8028231de270f65cb58fb190a97f7152a3bdfc40db32d7eefc8c599ae2e91d288e246b4743af767b3ce2dca27f8a3e3c7fbbbfbb50bf9df15af')
b2sums_x86_64=('927b8ecffb514b32392e04b16a8925b6324e95d24ad1a2f539cca491e1f55810c2dcefc57b18dedf669e7d31ac893d3026d9cf1f3b5e9da25626b2c9302609a5')
b2sums_armv7h=('bcb0122e839af37c1e20dde560ba3f4279f49746b3275948a24661da9e1ab8d1620691229ad3bdf6f2e55c7935532f6ace70892f6ebe5a2e5d06d8cb13a5c790')
b2sums_aarch64=('833cd774ca0905b59e5eb8a8ac9f0b7fa4f2c5cb4dbeb3b83285f931fb8d96b76839508ad1f46695b16e4f1b2b09af564a2a0659b6d0490a64847ec5204ab37b')
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
