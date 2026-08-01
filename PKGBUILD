# Maintainer: huaji2369 <3117086599@qq.com>
pkgname=vouch
_pkgname=Vouch
pkgver=0.1.4
pkgrel=1
pkgdesc="Modern, cross-platform Steam authenticator for the desktop"
arch=("x86_64" "aarch64")
url="https://github.com/Monodesu/Vouch"
license=('AGPL-3.0')
depends=(
    'dotnet-runtime'
    'fontconfig'
    'libx11'
)
makedepends=('dotnet-sdk')
options=('!strip') # strip corrupts .NET SingleFile bundle
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "wrapper.sh"
    "Vouch.desktop"    
)
sha256sums=(
    '0c6affa2a98cd30a11fded3e93f6428d09d7d7ff2e4e29e9f4661384d656c874'
    '16008d6ec7f72e16d55a1fe9c0b73ad710d3cc0a646bdd14f30f13096a18e755'
    '35a1d8b090de2659a74bc061a4c12e6eb7ed0658cc09e54044bf9fe5ffab50fa'
)

case "$CARCH" in
    x86_64)
        _rid=linux-x64
        ;;
    aarch64)
        _rid=linux-arm64
        ;;
esac

prepare() {
    cd "$_pkgname-$pkgver"
    dotnet restore -r "$_rid"
}

build() {
	cd "$_pkgname-$pkgver"
    dotnet publish Vouch.App/Vouch.App.csproj -c Release -r "$_rid" \
    -o publish --no-restore --self-contained false \
    -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true
}

check() {
	cd "$_pkgname-$pkgver"
    dotnet test Vouch.Core.Tests \
    -c Release \
    --no-restore
}

package() {
    install -Dm755 wrapper.sh "$pkgdir/usr/bin/vouch"
    install -Dm755 Vouch.desktop "$pkgdir/usr/share/applications/vouch.desktop"
	cd "$_pkgname-$pkgver"
    install -Dm755 publish/Vouch "$pkgdir/usr/lib/vouch/vouch"
    install -Dm644 Vouch.App/Assets/vouch.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/vouch.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
