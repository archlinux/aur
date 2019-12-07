# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=nbxplorer
pkgcaps=NBXplorer
pkgdesc="A minimalist UTXO tracker for HD Cryptocurrency Wallets."
pkgver='stable'
pkgpath="github.com/dgarage/${pkgname}"
pkgrel=1
arch=('any')
url="https://${pkgpath}"
license=(MIT)
makedepends=('dotnet-sdk-bin')
depends=('dotnet-sdk>=3.1.0')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
mv ${srcdir}/${pkgcaps}-${pkgver} ${srcdir}/${pkgname}
cd ${srcdir}/${pkgname}
./build.sh
#set absolute path in run.sh
echo -e '#!/bin/bash \n #launch nbxplorer \n dotnet run --no-launch-profile --no-build -c Release -p "/usr/lib/nbxplorer/NBXplorer/NBXplorer.csproj" -- $@' > run.sh
chmod +x run.sh
}

package() {
#create dir structure
mkdir -p ${pkgdir}/usr/bin/
mkdir -p ${pkgdir}/usr/lib/
mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
#putting the sources in /usr/lib/nbxplorer
cp -r ${srcdir}/${pkgname}/ ${pkgdir}/usr/lib/
#symlinking run.sh to /usr/bin/nbxplorer
ln -rTsf $pkgdir/usr/lib/${pkgname}/run.sh ${pkgdir}/usr/bin/${pkgname}
chmod 755 ${pkgdir}/usr/bin/${pkgname}
#install the lisence
install -Dm644 ${pkgdir}/usr/lib/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
