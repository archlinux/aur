_dotnet_version=8.0
pkgname="csharp-ls"
pkgver=0.16.0
pkgrel=1
pkgdesc="Roslyn-based LSP language server for C#"
arch=("x86_64")
url="https://github.com/razzmatazz/csharp-language-server"
license=("MIT")
depends=("dotnet-sdk-$_dotnet_version")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('390b5e92f6d9936288dab969a705640c93420f2b1f03af6b1fc8d3f032456f09')
options=("staticlibs")

prepare() {
    cd "$srcdir/csharp-language-server-$pkgver"

    # Most of the time our dotnet version is lower than global.json
    rm global.json

    dotnet restore
}

build(){
    cd "$srcdir/csharp-language-server-$pkgver"
    dotnet publish src/CSharpLanguageServer/CSharpLanguageServer.fsproj \
        -c Release \
        --self-contained false \
        --no-restore \
        --framework "net$_dotnet_version"
}
check(){
    cd "$srcdir/csharp-language-server-$pkgver"
    dotnet test \
        --no-restore \
        --framework "net$_dotnet_version" \
        --filter Name!=testReferenceWorksToAspNetRazorPageReferencedValue
        # Failed with dotnet-sdk 8.0.111
}
package(){
    cd "$srcdir/csharp-language-server-$pkgver"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -av --no-preserve=ownership "src/CSharpLanguageServer/bin/Release/net$_dotnet_version/publish" \
        "$pkgdir/usr/lib/csharp-ls"
    ln -srfv "$pkgdir/usr/lib/csharp-ls/CSharpLanguageServer" "$pkgdir/usr/bin/csharp-ls"
    install -Dm644 "$srcdir/csharp-language-server-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
