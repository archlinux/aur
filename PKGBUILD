# Based on NixOS's package scripts:
# https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/ro/roslyn-ls/package.nix

_dotnet_sdk_version=10.0
_dotnet_runtime_version=9.0
pkgname=roslyn-ls
pkgver=2.110.4
pkgrel=1
pkgdesc="Language server behind C# Dev Kit for Visual Studio Code"
arch=(x86_64)
url=https://github.com/dotnet/roslyn/tree/main/src/LanguageServer
license=(MIT)
# Require CLI command `dotnet run-api`, available since dotnet sdk 10.
depends=(gcc-libs glibc "dotnet-sdk>=10.0" "dotnet-runtime-$_dotnet_runtime_version")
makedepends=("dotnet-sdk-$_dotnet_sdk_version" "dotnet-targeting-pack-$_dotnet_runtime_version")
source=("roslyn-VSCode-CSharp-$pkgver.tar.gz::https://github.com/dotnet/roslyn/archive/refs/tags/VSCode-CSharp-$pkgver.tar.gz"
        "versions.targets"
        # It is in where the Assembly is, and not writable by normal user.
        # We move it to ${XDG_CACHE_HOME:-$HOME/.cache}/Microsoft/CodeAnalysis/LanguageServer.
        # See also: https://github.com/dotnet/roslyn/issues/76892
        "0001-move-cache-directory.diff")
sha256sums=('76f4a2dad8eb9166be7b3f83d9d6eb7c22c92461b985e92a681e04b0450b9d1b'
            '66ef609bcee14f41754820a9dd4aeda578c338867e93da04ce15b48f9f93026b'
            '39817ac608d5eb5d36ab350faa00afde8fdd89e0e6f229a48bfa6374736a4217')

prepare() {
    cd "$srcdir/roslyn-VSCode-CSharp-$pkgver"
    _runtime_version="$(LANG=C pacman -Qi "dotnet-runtime-$_dotnet_runtime_version" | grep Version | cut -d : -f 2 | cut -d - -f 1 | xargs)"
    _rid="$(dotnet --info | grep RID | cut -d : -f 2 | xargs)"
    patch -Np1 -i ../0001-move-cache-directory.diff
    sed -e "s/%DOTNET_TARGET_FRAMEWORK%/net$_dotnet_runtime_version/g" \
        -e "s/%DOTNET_RUNTIME_VERSION%/${_runtime_version%%.sdk*}/g" \
        "$srcdir/versions.targets" > versions.targets
    sed -i '$ i <Import Project="versions.targets" />' Directory.Build.targets
    # They do not publish an executable when no rid specified...
    dotnet restore ./src/LanguageServer/Microsoft.CodeAnalysis.LanguageServer/Microsoft.CodeAnalysis.LanguageServer.csproj \
        --runtime="$_rid"
}

build() {
    cd "$srcdir/roslyn-VSCode-CSharp-$pkgver"
    _rid="$(dotnet --info | grep RID | cut -d : -f 2 | xargs)"
    dotnet publish ./src/LanguageServer/Microsoft.CodeAnalysis.LanguageServer/Microsoft.CodeAnalysis.LanguageServer.csproj \
        --no-restore --no-self-contained --runtime="$_rid" --configuration Release \
        --property:PublishReadyToRun=false --property:TargetRid="$_rid" \
        --property:EnableWindowsTargeting=false --property:EnableAppHostPackDownload=true
}

package() {
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    _rid="$(dotnet --info | grep RID | cut -d : -f 2 | xargs)"
    cd "$srcdir/roslyn-VSCode-CSharp-$pkgver"
    cp -a --no-preserve=ownership \
        "artifacts/LanguageServer/Release/net$_dotnet_runtime_version/$_rid" \
        "$pkgdir/usr/lib/$pkgname"
    ln -srf "$pkgdir/usr/lib/$pkgname/Microsoft.CodeAnalysis.LanguageServer" \
            "$pkgdir/usr/bin/Microsoft.CodeAnalysis.LanguageServer"
    install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
}
