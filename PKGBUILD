# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=btcpayserver
pkgdesc="https://github.com/btcpayserver"
pkgver='stable'
pkgpath="github.com/${pkgname}/${pkgname}"
pkgrel=3
arch=('any')
url="https://${pkgpath}"
license=(MIT)
makedepends=('dotnet-host-bin' 'dotnet-runtime' 'dotnet-runtime-bin' 'dotnet-sdk' 'dotnet-sdk-bin' 'aspnet-runtime-2.1' 'aspnet-runtime-bin')
depends=(${makedepends} 'nbxplorer')
source=("$url/archive/stable.tar.gz"
"btcpayserver.service")
sha256sums=('8a3e18656dea329e73bd1e7d7028f47108dc50cd36c8d392c92db5d764cbf7f9'
            '17cabc9ce74302daad6199dd6d4f86a25fa983c64528bd905c1357b156529411')

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
#inatll systemd service
install -Dm644 ${srcdir}/btcpayserver.service ${pkgdir}/usr/lib/systemd/system/btcpayserver.service
#install the lisence
install -Dm644 ${pkgdir}/usr/lib/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
