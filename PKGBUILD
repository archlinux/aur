# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=roslyn-language-server
pkgver=5.11.0_1.26380.4
pkgrel=1
epoch=1
pkgdesc="A Language Server Protocol (LSP) implementation for C# powered by Roslyn"
arch=('x86_64')
url='https://github.com/dotnet/roslyn/tree/main/src/LanguageServer/Microsoft.CodeAnalysis.LanguageServer'
license=('MIT')
depends=(dotnet-runtime-10.0)
makedepends=(dotnet-sdk-10.0 moreutils)

# from nuget package metadata
_commit=dc1db3e7dee178e2744a73eb06dce107c07fa7b1
source=("roslyn-${_commit:0:7}.tar.gz::https://github.com/dotnet/roslyn/archive/$_commit.tar.gz"
        'cache-path.patch')
sha256sums=('7f3412e7ac80e0ef2f197fdd8868d9d6847dba8d07d311cd1b5afbf53af361d9'
            '1b97b5899e102286759dc4e10675d2524b1c104d0164c3c604402618ad09f0d4')

prepare() {
    cd "roslyn-$_commit/src/LanguageServer/Microsoft.CodeAnalysis.LanguageServer"

    jq '.sdk.version="10.0"' < "../../../global.json" | sponge "../../../global.json"
    patch --strip=1 --input=../../../../cache-path.patch

    export NUGET_PACKAGES="$PWD/nuget"
    export DOTNET_NOLOGO=true
    export DOTNET_CLI_TELEMETRY_OPTOUT=true

    dotnet restore -r linux-x64 -p:PublishReadyToRun=true
}

build() {
    cd "roslyn-$_commit/src/LanguageServer/Microsoft.CodeAnalysis.LanguageServer"

    export NUGET_PACKAGES="$PWD/nuget"
    export DOTNET_NOLOGO=true
    export DOTNET_CLI_TELEMETRY_OPTOUT=true

    dotnet publish -c Release --no-restore -r linux-x64 -o publish/
}

package() {
    cd "roslyn-$_commit/src/LanguageServer/Microsoft.CodeAnalysis.LanguageServer"

    install -d "$pkgdir/opt/$pkgname/"
    install -d "$pkgdir/usr/bin/"

    cp -Pr "publish/"* "$pkgdir/opt/$pkgname/"
    ln -s "/opt/$pkgname/Microsoft.CodeAnalysis.LanguageServer" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 ../../../License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
