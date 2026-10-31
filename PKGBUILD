# Maintainer: Furkan Kerim Karademir <fkerimk26@proton.me>
pkgname=bebisfetch
pkgver=0.2.0
pkgrel=1
pkgdesc="A lightweight, colorful, and fast system information tool written in C#."
arch=('x86_64')
url="https://github.com/bebisland/bebisfetch"
license=('MIT')
depends=('glibc')
makedepends=('dotnet-sdk' 'clang' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23497c41d8bf24ee14d788bc43a775c178dac542b438e1cdf9a0ec9e155b7d35')

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
