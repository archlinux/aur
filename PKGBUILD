# Maintainer: devome <evinedeng@hotmail.com>
# Contributer: plokid <910576949@qq.com>

_dotnet_ver=8.0
pkgname=imewlconverter
pkgver=3.1.0
pkgrel=1
pkgdesc="一款开源免费的输入法词库转换程序"
arch=('i686' 'x86_64')
url="https://github.com/studyzy/${pkgname}"
license=('GPL-3.0-or-later')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=("dotnet-runtime-${_dotnet_ver}")
makedepends=("dotnet-sdk-${_dotnet_ver}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e6a0c9d086a65986dbfc556bd458f599001f9f6ee8dcddeea71aa244cf21398c')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i -E "s|<Version>.+</Version>|<Version>${pkgver}</Version>|" src/ImeWlConverterCmd/ImeWlConverterCmd.csproj
    rm docker.md
}

build() {
    cd "${pkgname}-${pkgver}"
    dotnet build --configuration Release ./src/ImeWlConverterCmd
    mv "src/ImeWlConverterCmd/bin/Release/net${_dotnet_ver}/"*.txt .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 *.md *.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    cp --preserve=mode -r "src/ImeWlConverterCmd/bin/Release/net${_dotnet_ver}" "${pkgdir}/usr/share/${pkgname}"
    ln -s "/usr/share/${pkgname}/ImeWlConverterCmd" "${pkgdir}/usr/bin/${pkgname}"
}

