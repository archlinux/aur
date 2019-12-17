# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=nbxplorer
pkgcaps=NBXplorer
pkgdesc="A minimalist UTXO tracker for HD Cryptocurrency Wallets."
pkgver='stable'
pkgpath="github.com/dgarage/${pkgname}"
pkgrel=3
arch=('any')
url="https://${pkgpath}"
license=(MIT)
makedepends=('dotnet-host-bin' 'dotnet-runtime' 'dotnet-runtime-bin' 'dotnet-sdk' 'dotnet-sdk-bin' 'aspnet-runtime-2.1' 'aspnet-runtime-bin')
depends=(${makedepends} 'bitcoin-daemon')
source=("${url}/archive/${pkgver}.tar.gz"
"nbxplorer.service")
sha256sums=('SKIP'
            '198e6e0ba127402b549c88b2748f80026a511b9b956291803a64355571d859dd')

build() {
mv ${srcdir}/${pkgcaps}-${pkgver} ${srcdir}/${pkgname}
cd ${srcdir}/${pkgname}
cp -b ../nbxplorer.service nbxplorer.service
./build.sh
#set absolute path in run.sh
echo -e '#!/bin/bash
#launch nbxplorer
dotnet run --no-launch-profile --no-build -c Release -p "/usr/lib/nbxplorer/NBXplorer/NBXplorer.csproj" -- $@
' > run.sh
chmod +x run.sh
}

package() {
#create dir structure
mkdir -p ${pkgdir}/usr/bin/
mkdir -p ${pkgdir}/usr/lib/
mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
mkdir -p ${pkgdir}/usr/lib/systemd/system/
#putting the sources in /usr/lib/nbxplorer
cp -r ${srcdir}/${pkgname}/ ${pkgdir}/usr/lib/
#symlinking run.sh to /usr/bin/nbxplorer
ln -rTsf $pkgdir/usr/lib/${pkgname}/run.sh ${pkgdir}/usr/bin/${pkgname}
chmod 755 ${pkgdir}/usr/bin/${pkgname}
#install the lisence
install -Dm644 ${pkgdir}/usr/lib/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
install -Dm644 ${pkgdir}/usr/lib/${pkgname}/nbxplorer.service ${pkgdir}/usr/lib/systemd/system/
}
