_dotnet_version=9.0
_pkgname=LocalizationManager
pkgname=${_pkgname,,}
pkgver=0.7.9
pkgrel=1
pkgdesc="CLI tool and TUI editor for managing .NET .resx localization files."
arch=(x86_64)
url=https://github.com/nickprotop/LocalizationManager
license=(MIT)
depends=("dotnet-runtime-$_dotnet_version" "aspnet-runtime-$_dotnet_version")
makedepends=(dotnet-sdk "dotnet-targeting-pack-$_dotnet_version")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/nickprotop/LocalizationManager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a2cad0faf5220f89c5e68f6e703a4a6e84aebcbe3d1c1ffa23ae5da58b0b17e6')

prepare() {
    dotnet --info | grep RID | cut -d : -f 2 | sed 's/arch/linux/' | xargs > _rid
    local _rid
    _rid="$(<_rid)"
    cd "$_pkgname-$pkgver"
    sed -i -e '/<PublishSingleFile>true<\/PublishSingleFile>/ d' ./LocalizationManager.csproj
    dotnet restore ./LocalizationManager.csproj --runtime="$_rid" 
}
build() {
    local _rid
    _rid="$(< _rid)"
    cd "$_pkgname-$pkgver"
    dotnet publish ./LocalizationManager.csproj --no-self-contained --no-restore --configuration=Release \
        --runtime="$_rid"
}
package() {
    local _rid
    _rid="$(< _rid)"
    cd "$_pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/lib" "$pkgdir/usr/bin"
    cp -a --no-preserve=ownership "bin/Release/net$_dotnet_version/$_rid/publish" \
        "$pkgdir/usr/lib/$pkgname"
    ln -srfv "$pkgdir/usr/lib/$pkgname/lrm" "$pkgdir/usr/bin/lrm"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
