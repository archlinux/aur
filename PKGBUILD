_dotnet_version=9.0
_pkgname=LocalizationManager
pkgname=${_pkgname,,}
pkgver=0.7.16
pkgrel=1
pkgdesc="CLI tool and TUI editor for managing .NET .resx localization files."
arch=(x86_64)
url=https://github.com/nickprotop/LocalizationManager
license=(MIT)
depends=("dotnet-runtime-$_dotnet_version" "aspnet-runtime-$_dotnet_version")
makedepends=(dotnet-sdk "dotnet-targeting-pack-$_dotnet_version")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/nickprotop/LocalizationManager/archive/refs/tags/v$pkgver.tar.gz"
        "0001-allow-not-publishing-single-file.diff"
        "0002-set-content-root-path-to-app-directory.diff")
sha256sums=('be551e4bd4531a421834d833b1c4fed11ecedccb23a255d28c7b1330614eb6b4'
            '33698f1578eb8c4fedf8ed0ea287ea70c8ed23b1c4a14aab3953c44a3c562192'
            '8980627fbf922c0a44b21fc3cc8762f14c94a6a698b8acc318d2f249e668409e')

prepare() {
    dotnet --info | grep RID | cut -d : -f 2 | sed 's/arch/linux/' | xargs > _rid
    local _rid
    _rid="$(<_rid)"
    cd "$_pkgname-$pkgver"
    patch -Np1 -i ../0001-allow-not-publishing-single-file.diff
    patch -Np1 -i ../0002-set-content-root-path-to-app-directory.diff
    dotnet restore ./LocalizationManager.csproj --runtime="$_rid" 
}
build() {
    local _rid
    _rid="$(< _rid)"
    cd "$_pkgname-$pkgver"
    dotnet publish ./LocalizationManager.csproj --no-self-contained --no-restore --configuration=Release \
        --runtime="$_rid" --property:PublishSingleFile=false
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
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*.md
    install -Dm644 docs/lrm.1 "$pkgdir/usr/share/man/man1/lrm.1"
    install -Dm644 lrm-completion.bash "$pkgdir/usr/share/bash-completion/completions/lrm"
    install -Dm644 _lrm "$pkgdir/usr/share/zsh/site-functions/_lrm"
}
