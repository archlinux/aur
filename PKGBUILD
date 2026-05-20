# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: FieldOfClay <me at michaelclayfield dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="olivetin-bin"
pkgver=3000.12.0
pkgrel=1
pkgdesc="Safe and simple access to predefined shell commands from a web interface"
url="https://www.olivetin.app/"
license=("AGPL-3.0")
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
b2sums_x86_64=('7155bce268eb6cb030827b03a0f23d6f446111dfc5f9a67cfe45989652fd588e388a23eb81139405b9ef634ce40d0687adfc78c03157d111025c0b906d092f79')
b2sums_aarch64=('8bd9953a5c2d97b9c3c50961677590e3f10ff6614eb9f851eaa181f4f7b5f1883c628f36a29994023fe7f87f02c3c7e40c86615ed7e07d9fa43beb5f9d059399')
b2sums_armv7h=('d050524c447f4f6b55d3e744ddbc2e9bdc9f8da2eaf0ee53ba609b926f62b7fd5d7491e60c212a12c19adcf87cf5cd89ca6de415b1abac53264d5220bc525653')
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
