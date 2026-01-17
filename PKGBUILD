# Maintainer: devome <evinedeng@hotmail.com>
# Contributer: maz-1 <ohmygod19993@gmail.com>
# Contributer: plokid <910576949@qq.com>

_dotnet_ver=9.0
pkgname=imewlconverter
pkgver=3.3.1
pkgrel=2
pkgdesc="一款开源免费的输入法词库转换程序"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/studyzy/${pkgname}"
license=('GPL-3.0-or-later')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}"{-bin,-cli})
depends=("dotnet-runtime-${_dotnet_ver}")
makedepends=("dotnet-sdk-${_dotnet_ver}" "git")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('256a428d24b22d9b70f43c09f59d7160ad4f2a362c2ad553f47e026dade95c4e')

prepare() {
    cd "${pkgname}"
    sed -i "s|dotnet ImeWlConverterCmd.dll|${pkgname}|g" src/ImeWlConverterCmd/Program.cs
}

build() {
    cd "${pkgname}"
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

    cd "${pkgname}"
    install -Dm644 README.md *.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 builddir/*      -t "${pkgdir}/usr/lib/${pkgname}"
    install -dm755                    "${pkgdir}/usr/bin"
    ln -sf  "${_binary}"              "${pkgdir}/usr/bin/${pkgname}"
    chmod 755 "${pkgdir}${_binary}"
}
