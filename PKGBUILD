# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: FieldOfClay <me at michaelclayfield dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="olivetin-bin"
pkgver=3000.8.0
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
b2sums_x86_64=('aae9d25978a6edc947cbe97daf644d6132c00ff0ecf644859f9b0d25e41ac25f98ffe251ae249c8c3fb2669cf79a58c965759edc1777d7c4e560a58230b56ef2')
b2sums_aarch64=('cfa38e8d8bf056bc1e7f3c05e710b4e8fb51ee12a329171118a8d7bd356daf4f8b7f1a1f29d083433e08bd8c58c0cc2c1fa31cca83b5105eec3dcbd61e2cc63d')
b2sums_armv7h=('e699a9a23b3cfacd085f497140a69c90de1584e610ddaf29718adeaa31454e96a202c691e8200da92ae4604093e2174f2378201d5a3c0adc8bca76c5e09ca1ef')
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
