# Based on NixOS's package scripts:
# https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/ro/roslyn-ls/package.nix

_dotnet_sdk_version=10.0
_dotnet_runtime_version=$_dotnet_sdk_version
pkgname=roslyn-ls
pkgver=2.120.3
pkgrel=1
pkgdesc="Language server behind C# Dev Kit for Visual Studio Code"
arch=(x86_64)
url=https://github.com/dotnet/roslyn/tree/main/src/LanguageServer
license=(MIT)
# Require CLI command `dotnet run-api`, available since dotnet sdk 10.
depends=(gcc-libs glibc "dotnet-sdk-$_dotnet_sdk_version" "dotnet-runtime-$_dotnet_runtime_version")
makedepends=(jq "dotnet-targeting-pack-$_dotnet_runtime_version")
source=("roslyn-VSCode-CSharp-$pkgver.tar.gz::https://github.com/dotnet/roslyn/archive/refs/tags/VSCode-CSharp-$pkgver.tar.gz"
        "versions.targets"
        # It is in where the Assembly is, and not writable by normal user.
        # We move it to ${XDG_CACHE_HOME:-$HOME/.cache}/Microsoft/CodeAnalysis/LanguageServer.
        # See also: https://github.com/dotnet/roslyn/issues/76892
        "0001-move-cache-directory.diff")
sha256sums=('094632a98fe9a1464238120b43ff6777b2da340b2859454f448cfdf1e89e3a71'
            '66ef609bcee14f41754820a9dd4aeda578c338867e93da04ce15b48f9f93026b'
            '39817ac608d5eb5d36ab350faa00afde8fdd89e0e6f229a48bfa6374736a4217')

prepare() {
    dotnet --info | grep RID | cut -d : -f 2 | sed 's/^arch/linux/' | xargs > _rid
    _rid="$(< _rid)"
    _runtime_version_pacman="$(LANG=C pacman -Qi "dotnet-runtime-$_dotnet_runtime_version" | grep Version | cut -d : -f 2 | cut -d - -f 1 | xargs)"
    _runtime_version="${_runtime_version_pacman%.*.sdk*}.${_runtime_version_pacman#*.sdk}"
    _sdk_version_pacman="$(LANG=C pacman -Qi "dotnet-sdk-$_dotnet_sdk_version" | grep Version | cut -d : -f 2 | cut -d - -f 1 | xargs)"
    _sdk_version="${_sdk_version_pacman%.*.sdk*}.${_sdk_version_pacman#*.sdk}"
    cd "$srcdir/roslyn-VSCode-CSharp-$pkgver"
    patch -Np1 -i ../0001-move-cache-directory.diff
    sed -e "s/%DOTNET_TARGET_FRAMEWORK%/net$_dotnet_runtime_version/g" \
        -e "s/%DOTNET_RUNTIME_VERSION%/${_runtime_version_pacman%%.sdk*}/g" \
        "$srcdir/versions.targets" > versions.targets
    sed -i '$ i <Import Project="versions.targets" />' Directory.Build.targets
    mv global.json global.json.old
    jq ".sdk.version=\"$_sdk_version\" | .tools.dotnet=\"$_sdk_version\"" global.json.old > global.json
    # They do not publish an executable when no rid specified...
    dotnet restore ./src/LanguageServer/Microsoft.CodeAnalysis.LanguageServer/Microsoft.CodeAnalysis.LanguageServer.csproj \
        --runtime="$_rid"
}

build() {
    _rid="$(< _rid)"
    cd "$srcdir/roslyn-VSCode-CSharp-$pkgver"
    dotnet publish ./src/LanguageServer/Microsoft.CodeAnalysis.LanguageServer/Microsoft.CodeAnalysis.LanguageServer.csproj \
        --no-restore --no-self-contained --runtime="$_rid" --configuration Release \
        --property:PublishReadyToRun=false --property:TargetRid="$_rid" \
        --property:EnableWindowsTargeting=false --property:EnableAppHostPackDownload=true
}

package() {
    _rid="$(< _rid)"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cd "$srcdir/roslyn-VSCode-CSharp-$pkgver"
    cp -a --no-preserve=ownership \
        "artifacts/LanguageServer/Release/net$_dotnet_runtime_version/$_rid" \
        "$pkgdir/usr/lib/$pkgname"
    ln -srf "$pkgdir/usr/lib/$pkgname/Microsoft.CodeAnalysis.LanguageServer" \
            "$pkgdir/usr/bin/Microsoft.CodeAnalysis.LanguageServer"
    install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
}
