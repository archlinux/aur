# Maintainer: devome <evinedeng@hotmail.com>
# Contributer: maz-1 <ohmygod19993@gmail.com>
# Contributer: plokid <910576949@qq.com>

_dotnet_ver=10.0
_tgtbin="ImeWlConverterCmd"
pkgname=imewlconverter
pkgver=3.4.3
pkgrel=1
pkgdesc="深蓝词库转换：一款开源免费的输入法词库转换程序"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/studyzy/${pkgname}"
license=('GPL-3.0-or-later')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}"{-bin,-cli})
depends=("dotnet-runtime-${_dotnet_ver}")
makedepends=("dotnet-sdk-${_dotnet_ver}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b336679db4ec2fa6c80da6f89305d5d1a2d3e94629c15531fa726429e8f9c84c')

build() {
    export PACKAGE_VERSION="${pkgver}"

    cd "${pkgname}-${pkgver}"
    dotnet publish "src/${_tgtbin}" \
        --configuration Release \
        --framework "net${_dotnet_ver}" \
        --self-contained false \
        --output output \
        -p:PublishSingleFile=false \
        -p:DebugSymbols=false \
        -p:DebugType=none
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd output
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;
    chmod +x "${pkgdir}/usr/lib/${pkgname}/${_tgtbin}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "../lib/${pkgname}/${_tgtbin}" "${pkgdir}/usr/bin/${pkgname}"
}
