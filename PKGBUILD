# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: FieldOfClay <me at michaelclayfield dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="olivetin-bin"
pkgver=3000.3.2
pkgrel=1
pkgdesc="Safe and simple access to predefined shell commands from a web interface"
url="https://www.olivetin.app/"
license=("AGPL3")
arch=("x86_64" "aarch64" "armv7h")
provides=("olivetin")
conflicts=("olivetin")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz"::"https://github.com/OliveTin/OliveTin/releases/download/$pkgver/OliveTin-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz"::"https://github.com/OliveTin/OliveTin/releases/download/$pkgver/OliveTin-linux-arm64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz"::"https://github.com/OliveTin/OliveTin/releases/download/$pkgver/OliveTin-linux-arm7.tar.gz")
source=("olivetin.service"
        "olivetin@.service")
b2sums=('402097ad54be50688a22223b96f32a6630ec5479bcf4f99dbaf98d1b212cac4316c4adcf8dd7aeb9216d28dd815b5b80820023a4ca710ebe60f7603795931489'
        '90c4f129b8a481612a7b4c051b48930bce6259df1a1f02c7fcadcabe4eb3031feaa7bc620fd543ed66d2453464c7f5c383e58d7146019a01c98c333ccf382f25')
b2sums_x86_64=('f89639e49451a8f88aaf07a76d1046dc43247301358df9f235cd19f519d4d9f32a8e5ef48884b195f191a4a70e4a82f5bdbbf458bacc1ea2e838b846404b4bbb')
b2sums_aarch64=('f3c3ddde59d4b8d0f5ca43583e1863f6f3dd053abf842af0726096a10c119a3e5d512ea4088b76c22c783cbb645d4bfda99c45362a2a60367d1f1dd5fb0e109f')
b2sums_armv7h=('4aee3c5e9134142a8625981067ec71f0c7826fef4bb4d5e2c295e7224464fc76ff3348f2de8479f4aa77117928c29cc70b44b03c971e7c62b25e648b87f4fdc7')
backup=("etc/olivetin/config.yaml")

prepare(){
 # enter the proper directory
 case "$CARCH" in
  "x86_64") cd "OliveTin-linux-amd64";;
  "armv7h") cd "OliveTin-linux-armv7";;
  "aarch64") cd "OliveTin-linux-arm64";;
  *) echo "[KO] Unsupported architecture provided" && return 1;;
 esac

 # additional configuration defaults
 cat >> "config.yaml" <<CONTENT

# see https://docs.olivetin.app/hide-nav.html
ShowNavigation: true
ShowFooter: true

# see https://docs.olivetin.app/network-ports.html
listenAddressRestActions: localhost:133888
listenAddressGrpcActions: localhost:1339
listenAddressWebUI: localhost:1340

# see https://docs.olivetin.app/update-tracking.html
showNewVersions: true

# Location og the web interface
webUIDir: "/usr/share/webapps/olivetin/webui/"

CONTENT
}

package(){
 # enter the proper directory
 case "$CARCH" in
  "x86_64") cd "OliveTin-linux-amd64";;
  "armv7h") cd "OliveTin-linux-arm7";;
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
