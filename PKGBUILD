_dotnet_version=8.0
pkgname="csharp-ls"
pkgver=0.15.0
pkgrel=1
pkgdesc="Roslyn-based LSP language server for C#"
arch=("x86_64")
url="https://github.com/razzmatazz/csharp-language-server"
license=("MIT")
makedepends=("jq")
depends=("dotnet-sdk-$_dotnet_version")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('144fa2ae5647422395ff3a55bba1c6f7dbf17ddcb7ae266f308efcb2b819700e')
options=("staticlibs")

build(){
    local runtime_dotnet_version required_dotnet_version
    runtime_dotnet_version="$(dotnet --version)"
    required_dotnet_version="$(jq -r ".sdk.version" "$srcdir/csharp-language-server-$pkgver/global.json")"
    cd "$srcdir/csharp-language-server-$pkgver/src/CSharpLanguageServer"
    if [[ "$required_dotnet_version" != "$runtime_dotnet_version" ]]
    then
        # Hack SDK version
        echo "Removing global.json for using SDK provided by system..."
        rm "$srcdir/csharp-language-server-$pkgver/global.json"
    fi
    dotnet publish -c Release \
        --no-self-contained \
        -p:PackAsTool=false \
        -o "$srcdir/csharp-language-server-$pkgver/linux-out"
}
check(){
    cd "$srcdir/csharp-language-server-$pkgver"
    dotnet test -c Release --no-build
}
package(){
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -av "$srcdir/csharp-language-server-$pkgver/linux-out" \
        "$pkgdir/usr/lib/csharp-ls"
    ln -s ../lib/csharp-ls/CSharpLanguageServer "$pkgdir/usr/bin/csharp-ls"
    install -Dm644 "$srcdir/csharp-language-server-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
