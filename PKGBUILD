_dotnet_version=8.0
pkgname="csharp-ls"
pkgver=0.11.0
pkgrel=1
pkgdesc="Roslyn-based LSP language server for C#"
arch=("x86_64")
url="https://github.com/razzmatazz/csharp-language-server"
license=("MIT")
makedepends=("jq")
depends=("dotnet-sdk-$_dotnet_version")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3ae8eccf68ae9528b63bea1e73450fb28eca454dc5a1d503b11f794a1a1c8f7c')
options=("!strip")

build(){
    local dotnet_version
    dotnet_version="$(dotnet --version)"
    cd "$srcdir/csharp-language-server-$pkgver/src/CSharpLanguageServer"
    if [[ "$(jq -r ".sdk.version" "$srcdir/csharp-language-server-$pkgver/global.json")" != "$dotnet_version" ]]
    then
        # Hack SDK version
        echo "Removing global.json for using SDK provided by system..."
        rm "$srcdir/csharp-language-server-$pkgver/global.json"
    fi
    dotnet publish -c Release --no-self-contained
}
check(){
    cd "$srcdir/csharp-language-server-$pkgver/src/CSharpLanguageServer"
    dotnet test -c Release --no-build
}
package(){
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -av "$srcdir/csharp-language-server-$pkgver/src/CSharpLanguageServer/bin/Release/net$_dotnet_version/publish" \
        "$pkgdir/usr/lib/csharp-ls"
    ln -s /usr/lib/csharp-ls/CSharpLanguageServer "$pkgdir/usr/bin/csharp-ls"
}
