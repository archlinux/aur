# Maintainer: Furkan Kerim Karademir <fkerimk26@proton.me>
pkgname=bebisfetch
pkgver=0.2.1
pkgrel=1
pkgdesc="A lightweight, colorful, and fast system information tool written in C#."
arch=('x86_64')
url="https://github.com/bebisland/bebisfetch"
license=('MIT')
depends=('glibc')
makedepends=('dotnet-sdk' 'clang' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b8c104b4b9dcbfa3612ee8850bf2f2caedab23310f6386b0176b115543f262f1')

prepare() {
    cd "$pkgname-$pkgver"
    export DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1
    export NUGET_PACKAGES="$srcdir/nuget"
    dotnet restore src/bebisfetch.csproj -r linux-x64
}

build() {
    cd "$pkgname-$pkgver"
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1
    export NUGET_PACKAGES="$srcdir/nuget"
    dotnet publish src/bebisfetch.csproj \
        -c Release \
        -r linux-x64 \
        -o "$srcdir/publish"
}

package() {
    install -Dm755 "$srcdir/publish/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
