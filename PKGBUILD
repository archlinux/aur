# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=btcpayserver
pkgdesc="https://github.com/btcpayserver"
pkgver='stable'
pkgpath="github.com/${pkgname}/${pkgname}"
pkgrel=6
arch=('any')
url="https://${pkgpath}"
license=(MIT)
makedepends=('dotnet-host-bin' 'dotnet-runtime' 'dotnet-runtime-bin' 'dotnet-sdk' 'dotnet-sdk-bin' 'aspnet-runtime-2.1' 'aspnet-runtime-bin')
depends=(${makedepends} 'nbxplorer')
source=("$url/archive/stable.tar.gz")
sha256sums=('SKIP')

build() {
mv ${srcdir}/${pkgname}-${pkgver} ${srcdir}/${pkgname}
cd ${srcdir}/${pkgname}
./build.sh
#set absolute path in run.sh
echo -e '#!/bin/bash
#launch btcpayserver
dotnet run --no-launch-profile --no-build -c Release -p "/usr/lib/btcpayserver/BTCPayServer/BTCPayServer.csproj" -- $@
' > run.sh
chmod +x run.sh

echo -e '#!/bin/bash
#launch nbxplorer
nohup dotnet run --no-launch-profile --no-build -c Release -p "/usr/lib/btcpayserver/BTCPayServer/BTCPayServer.csproj" -- $@ > /dev/null 2>&1 &sleep 3
' > run1.sh
chmod +x run1.sh

echo -e '[Unit]
Description=Btcpayserver
After=network.target
After=nbxplorer.service

[Service]
Type=oneshot
ExecStart=/usr/bin/btcpayserver-nohup
RemainAfterExit=yes
Restart=on-failure
#User=

[Install]
WantedBy=multi-user.target
' > btcpayserver.service
}

package() {
#create dir structure
mkdir -p ${pkgdir}/usr/bin/
mkdir -p ${pkgdir}/usr/lib/
mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
#putting the sources in /usr/lib/BTCPayServer
cp -r ${srcdir}/${pkgname}/ ${pkgdir}/usr/lib/
#symlinking run.sh to /usr/bin
ln -rTsf ${pkgdir}/usr/lib/${pkgname}/run.sh ${pkgdir}/usr/bin/${pkgname}
chmod 755 ${pkgdir}/usr/bin/${pkgname}
#symlinking run1.sh to /usr/bin/btcpayserver-nohup
ln -rTsf $pkgdir/usr/lib/${pkgname}/run1.sh ${pkgdir}/usr/bin/${pkgname}-nohup
chmod 755 ${pkgdir}/usr/bin/${pkgname}-nohup
#inatll systemd service
install -Dm644 ${pkgdir}/usr/lib/${pkgname}/btcpayserver.service ${pkgdir}/usr/lib/systemd/system/btcpayserver.service
#install the lisence
install -Dm644 ${pkgdir}/usr/lib/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
