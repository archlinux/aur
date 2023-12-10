pkgname="csharp-ls"
pkgver=0.10.0
pkgrel=2
pkgdesc="Roslyn-based LSP language server for C#"
arch=("x86_64")
url="https://github.com/razzmatazz/csharp-language-server"
license=("MIT")
makedepends=("git" "jq")
depends=("dotnet-sdk-7.0")
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')
options=("!strip")

build(){
    local dotnet_version
    dotnet_version="$(dotnet --version)"
    cd "$srcdir/csharp-language-server"
    if [[ "$(jq -r ".sdk.version" global.json)" != "$dotnet_version" ]]
    then
        # Hack SDK version
        echo "Removing global.json for using SDK provided by system..."
        rm global.json
    fi

    cd src
    dotnet publish -c Release --no-self-contained
}
check(){
    cd "$srcdir/csharp-language-server/src"
    dotnet test -c Release --no-build
}
package(){
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -av "$srcdir/csharp-language-server/src/CSharpLanguageServer/bin/Release/net7.0/publish" \
        "$pkgdir/usr/lib/csharp-ls"
    ln -s /usr/lib/csharp-ls/CSharpLanguageServer "$pkgdir/usr/bin/csharp-ls"
}
