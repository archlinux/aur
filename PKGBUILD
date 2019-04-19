# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=btcpayserver
pkgdesc="https://github.com/btcpayserver"
pkgver='stable'
pkgpath="github.com/$pkgname/$pkgname"
pkgrel=1
arch=('any')
url="https://${pkgpath}"
license=(MIT)
makedepends=(dotnet-sdk)
source=("$url/archive/stable.tar.gz")
sha256sums=('SKIP')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')

build() {
mv $srcdir/$pkgname-$pkgver $srcdir/$pkgname
cd $srcdir/$pkgname
./build.sh
#set absolute path in run.sh
echo -e '#!/bin/bash \n #launch btcpayserver \n dotnet run --no-launch-profile --no-build -c Release -p "/usr/lib/btcpayserver/BTCPayServer/BTCPayServer.csproj" -- $@' > run.sh
chmod +x run.sh
}

package() {
#create dir structure
mkdir -p $pkgdir/usr/bin/
mkdir -p $pkgdir/usr/lib/
mkdir -p $pkgdir/usr/share/licenses/$pkgname/
#putting the sources in /usr/lib/BTCPayServer
cp -r $srcdir/$pkgname/ $pkgdir/usr/lib/
#symlinking run.sh to /usr/bin
ln -rTsf $pkgdir/usr/lib/$pkgname/run.sh $pkgdir/usr/bin/$pkgname
chmod 755 $pkgdir/usr/bin/$pkgname
#install the lisence
install -Dm644 $pkgdir/usr/lib/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
