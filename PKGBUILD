# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: FieldOfClay <me at michaelclayfield dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="olivetin-bin"
pkgver=3000.17.1
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
b2sums_x86_64=('21f95c506d8bf86d8a56883fb4666cc455759d9cc21f8dbf2f275b609c5a23919ec3b5b16a94b32adbf2d12050ec04e21738b1a5bbf02324b0441dca9f67de64')
b2sums_aarch64=('b1b8573898a58d663620a36874bd5b4151aedb03044032a1f6180cefd87b5aff1d6845cec67c15681c120686865eed5041e028955f4116605bc5bd810edada4f')
b2sums_armv7h=('0f7a7846ee50853a5d6f0f77b57ae3255bc7f348c234eb8697f4ff9cd92aa03824ad544d749ac28f0bf07b1522f00a99ffc8fe25800f96c07d9288efac156043')
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
