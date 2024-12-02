_dotnet_version=8.0
pkgname="csharp-ls"
pkgver=0.15.0
pkgrel=3
pkgdesc="Roslyn-based LSP language server for C#"
arch=("x86_64")
url="https://github.com/razzmatazz/csharp-language-server"
license=("MIT")
depends=("dotnet-sdk-$_dotnet_version")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('144fa2ae5647422395ff3a55bba1c6f7dbf17ddcb7ae266f308efcb2b819700e')
options=("staticlibs")

prepare() {
    cd "$srcdir/csharp-language-server-$pkgver"

    # Most of the time our dotnet version is lower than global.json
    rm global.json

    dotnet restore
}

build(){
    cd "$srcdir/csharp-language-server-$pkgver"
    dotnet publish -c Release \
        --self-contained false \
        --no-restore \
        --framework "net$_dotnet_version" \
        -p:PackAsTool=false
}
check(){
    cd "$srcdir/csharp-language-server-$pkgver"
    dotnet test
}
package(){
    cd "$srcdir/csharp-language-server-$pkgver"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -av "src/CSharpLanguageServer/bin/Release/net$_dotnet_version/publish" \
        "$pkgdir/usr/lib/csharp-ls"
    ln -s ../lib/csharp-ls/CSharpLanguageServer "$pkgdir/usr/bin/csharp-ls"
    install -Dm644 "$srcdir/csharp-language-server-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
