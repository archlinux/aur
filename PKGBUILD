_dotnet_version=10.0
pkgname="csharp-ls"
pkgver=0.26.0
pkgrel=1
pkgdesc="Roslyn-based LSP language server for C#"
arch=("x86_64")
url="https://github.com/razzmatazz/csharp-language-server"
license=("MIT")
depends=("dotnet-sdk-$_dotnet_version" "dotnet-runtime-$_dotnet_version")
makedepends=("dotnet-targeting-pack-$_dotnet_version")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3757ce1994f528429b973b5aad4c256b50a0ab2136dd662db8eda012b3ec8bd7')

prepare() {
    dotnet --info | grep RID | cut -d : -f 2 | sed 's/arch/linux/' | xargs > _runtime
    local _runtime
    _runtime="$(< _runtime)"
    cd "$srcdir/csharp-language-server-$pkgver"
    sed -i '/<MSBuildTreatWarningsAsErrors>/ s/true/false/' ./src/CSharpLanguageServer/CSharpLanguageServer.fsproj

    # Most of the time our dotnet version is lower than global.json
    rm global.json

    dotnet restore --runtime "$_runtime"
}

build(){
    local _runtime
    _runtime="$(< _runtime)"
    cd "$srcdir/csharp-language-server-$pkgver"
    dotnet publish src/CSharpLanguageServer/CSharpLanguageServer.fsproj \
        -c Release \
        --self-contained false \
        --no-restore \
        --framework "net$_dotnet_version" \
        --runtime "$_runtime"
}
package(){
    local _runtime
    _runtime="$(< _runtime)"
    cd "$srcdir/csharp-language-server-$pkgver"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -av --no-preserve=ownership "src/CSharpLanguageServer/bin/Release/net$_dotnet_version/$_runtime/publish" \
        "$pkgdir/usr/lib/csharp-ls"
    ln -srfv "$pkgdir/usr/lib/csharp-ls/CSharpLanguageServer" "$pkgdir/usr/bin/csharp-ls"
    install -Dm644 "$srcdir/csharp-language-server-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
