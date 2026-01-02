_dotnet_version=10.0
pkgname="csharp-ls"
pkgver=0.21.0
pkgrel=1
pkgdesc="Roslyn-based LSP language server for C#"
arch=("x86_64")
url="https://github.com/razzmatazz/csharp-language-server"
license=("MIT")
depends=("dotnet-sdk-$_dotnet_version" "dotnet-runtime-$_dotnet_version")
makedepends=("dotnet-targeting-pack-$_dotnet_version")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f93aee566c173f9e7eb12339507bb0a6db08e79ad54ee8d6b74a85a09af8445d')

prepare() {
    cd "$srcdir/csharp-language-server-$pkgver"

    # Most of the time our dotnet version is lower than global.json
    rm global.json

    dotnet restore --runtime "$(dotnet --info | grep RID | cut -d : -f 2 | xargs | sed 's/arch/linux/')"
}

build(){
    cd "$srcdir/csharp-language-server-$pkgver"
    dotnet publish src/CSharpLanguageServer/CSharpLanguageServer.fsproj \
        -c Release \
        --self-contained false \
        --no-restore \
        --framework "net$_dotnet_version" \
        --runtime "$(dotnet --info | grep RID | cut -d : -f 2 | xargs | sed 's/arch/linux/')" \
        -p:NoWarn=FS3397
}
package(){
    cd "$srcdir/csharp-language-server-$pkgver"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -av --no-preserve=ownership "src/CSharpLanguageServer/bin/Release/net$_dotnet_version/$(dotnet --info | grep RID | cut -d : -f 2 | xargs | sed 's/arch/linux/')/publish" \
        "$pkgdir/usr/lib/csharp-ls"
    ln -srfv "$pkgdir/usr/lib/csharp-ls/CSharpLanguageServer" "$pkgdir/usr/bin/csharp-ls"
    install -Dm644 "$srcdir/csharp-language-server-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
