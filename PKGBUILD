# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=nbxplorer
pkgcaps=NBXplorer
pkgdesc="A minimalist UTXO tracker for HD Cryptocurrency Wallets."
pkgver='stable'
pkgpath="github.com/dgarage/${pkgname}"
pkgrel=4
arch=('any')
url="https://${pkgpath}"
license=(MIT)
makedepends=('dotnet-host-bin' 'dotnet-runtime' 'dotnet-runtime-bin' 'dotnet-sdk' 'dotnet-sdk-bin' 'aspnet-runtime-2.1' 'aspnet-runtime-bin')
depends=(${makedepends} 'bitcoin-daemon')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
mv ${srcdir}/${pkgcaps}-${pkgver} ${srcdir}/${pkgname}
cd ${srcdir}/${pkgname}
./build.sh
#set absolute path in run.sh
echo -e '#!/bin/bash
#launch nbxplorer
dotnet run --no-launch-profile --no-build -c Release -p "/usr/lib/nbxplorer/NBXplorer/NBXplorer.csproj" -- $@
' > run.sh
chmod +x run.sh

echo -e '#!/bin/bash
#launch nbxplorer
nohup dotnet run --no-launch-profile --no-build -c Release -p "/usr/lib/nbxplorer/NBXplorer/NBXplorer.csproj" -- $@ > /dev/null 2>&1 &sleep 3
' > run1.sh
chmod +x run1.sh

echo -e '[Unit]
Description=NBXplorer
After=network.target
After=bitcoind.service

[Service]
Type=oneshot
ExecStart=/usr/bin/nbxplorer-nohup
RemainAfterExit=yes
Restart=on-failure
#User=

[Install]
WantedBy=multi-user.target
' > nbxplorer.service
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
#symlinking run1.sh to /usr/bin/nbxplorer-nohup
ln -rTsf $pkgdir/usr/lib/${pkgname}/run1.sh ${pkgdir}/usr/bin/${pkgname}-nohup
chmod 755 ${pkgdir}/usr/bin/${pkgname}-nohup
#install systemd service
install -Dm644 ${pkgdir}/usr/lib/${pkgname}/nbxplorer.service ${pkgdir}/usr/lib/systemd/system/
#install the lisence
install -Dm644 ${pkgdir}/usr/lib/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
