# Maintainer: devome <evinedeng@hotmail.com>
# Contributer: maz-1 <ohmygod19993@gmail.com>
# Contributer: plokid <910576949@qq.com>

_dotnet_ver=8.0
pkgname=imewlconverter
pkgver=3.2.0
pkgrel=1
pkgdesc="一款开源免费的输入法词库转换程序"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/studyzy/${pkgname}"
license=('GPL-3.0-or-later')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}"{-bin,-cli})
depends=("dotnet-runtime-${_dotnet_ver}")
makedepends=("dotnet-sdk-${_dotnet_ver}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('690a151f6666855208c64199f7430a39e62e0eadffe36680992b98877940ffc3')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i -E "s|<Version>.+</Version>|<Version>${pkgver}</Version>|" src/ImeWlConverterCmd/ImeWlConverterCmd.csproj
    sed -i "s|dotnet ImeWlConverterCmd.dll|${pkgname}|g" src/ImeWlConverterCmd/Program.cs
}

build() {
    cd "${pkgname}-${pkgver}"
    dotnet publish "src/ImeWlConverterCmd" \
        --configuration Release \
        --framework "net${_dotnet_ver}" \
        --self-contained false \
        --output builddir \
        -p:DebugSymbols=false \
        -p:DebugType=none
    mv builddir/Readme.txt CHANGELOG.txt
}

package() {
    local _binary="/usr/lib/${pkgname}/ImeWlConverterCmd"

    cd "${pkgname}-${pkgver}"
    install -Dm644 README.md *.txt  -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 builddir/*       -t "${pkgdir}/usr/lib/${pkgname}"
    install -dm755                     "${pkgdir}/usr/bin"
    ln -sf  "${_binary}"               "${pkgdir}/usr/bin/${pkgname}"
    chmod 755 "${pkgdir}/${_binary}"
}
