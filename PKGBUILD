# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: FieldOfClay <me at michaelclayfield dot com>

pkgname="olivetin-bin"
pkgver=2024.11.09
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
b2sums_x86_64=('145716a3689092ba7d380f1931d90b6c27c25e527fdec4340430cedb5ba61c1743c4e7538ad01d22aca023af246f7c92515d2bc7c8b209a340bce4e5f53ebadd')
b2sums_aarch64=('2bd4097bb9bb341fbf9c2538af1dae539eb8a4422563bea153c48eae68734e88818514d40ee9a8f04f6e680a3f808f4f6317b7ea9712d05bf30264be6b93c497')
b2sums_armv7h=('0e7156608980470f7f60f43a111b12479abf90567b305c658c2dfb78369e7ba311fff6645866550b9d6a0f4147918f92c1cc53ec6fee401c85e15ff894f4475d')
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
