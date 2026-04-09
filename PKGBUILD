# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=roslyn-language-server
pkgver=11.0.100
pkgrel=1
pkgdesc="A Language Server Protocol (LSP) implementation for C# powered by Roslyn"
arch=('x86_64')
url='https://github.com/dotnet/roslyn/tree/main/src/LanguageServer/Microsoft.CodeAnalysis.LanguageServer'
license=('MIT')
depends=(dotnet-runtime-10.0)
makedepends=(dotnet-sdk-10.0)

source=("roslyn-$pkgver.tar.gz::https://github.com/dotnet/roslyn/archive/refs/tags/v$pkgver.tar.gz"
        'cache-path.patch')
sha256sums=('2a4974b11ad36481e5641a7a06d2aca8c242905466dadbac2a2d88e3ef989cdc'
            '1b97b5899e102286759dc4e10675d2524b1c104d0164c3c604402618ad09f0d4')

prepare() {
    cd "roslyn-$pkgver/src/LanguageServer/Microsoft.CodeAnalysis.LanguageServer"

    patch --strip=1 --input=../../../../cache-path.patch

    export NUGET_PACKAGES="$PWD/nuget"
    export DOTNET_NOLOGO=true
    export DOTNET_CLI_TELEMETRY_OPTOUT=true

    dotnet restore -r linux-x64 -p:PublishReadyToRun=true
}

build() {
    cd "roslyn-$pkgver/src/LanguageServer/Microsoft.CodeAnalysis.LanguageServer"

    export NUGET_PACKAGES="$PWD/nuget"
    export DOTNET_NOLOGO=true
    export DOTNET_CLI_TELEMETRY_OPTOUT=true

    dotnet publish -c Release --no-restore -r linux-x64 -o publish/
}

package() {
    cd "roslyn-$pkgver/src/LanguageServer/Microsoft.CodeAnalysis.LanguageServer"

    install -d "$pkgdir/opt/$pkgname/"
    install -d "$pkgdir/usr/bin/"

    cp -Pr "publish/"* "$pkgdir/opt/$pkgname/"
    ln -s "/opt/$pkgname/Microsoft.CodeAnalysis.LanguageServer" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 ../../../License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
