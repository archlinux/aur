# Maintainer: Nathan Chere <git@nathanchere.com.au>
pkgname=grayjay-git
pkgver=3
pkgrel=1
pkgdesc="Grayjay Desktop - follow creators, not platform (privacy- and freedom-respecting client for YouTube, Rumble, Twitch, Spotify etc)"
arch=('x86_64')
url="https://github.com/futo-org/Grayjay.Desktop"
license=('Source First License 1.1')
depends=('dotnet-runtime')
makedepends=('dotnet-sdk' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/futo-org/Grayjay.Desktop/archive/refs/tags/$pkgver.tar.gz"
        "grayjay-engine::git+https://github.com/futo-org/Grayjay.Engine.git"
        "futo-mdns::git+https://github.com/futo-org/FUTO.MDNS.git")
sha256sums=('d92e55a3c186b5a7549a956e08952ca6655d4941ffb08ed602b3a939b555cafb'
            'SKIP'
            'SKIP')

prepare() {
    cd "Grayjay.Desktop-$pkgver"
    rm -rf Grayjay.Engine FUTO.MDNS
    cp -r "$srcdir/grayjay-engine" Grayjay.Engine/
    cp -r "$srcdir/futo-mdns" FUTO.MDNS/
}

build() {
    cd "Grayjay.Desktop-$pkgver"
    dotnet restore Grayjay.ClientServer/Grayjay.ClientServer.csproj
    dotnet build Grayjay.ClientServer/Grayjay.ClientServer.csproj --configuration Release --no-restore
}

package() {
    cd "Grayjay.Desktop-$pkgver"
    install -dm 755 "$pkgdir/usr/lib/$pkgname"
    install -dm 755 "$pkgdir/usr/bin"
    
    cp -r Grayjay.ClientServer/bin/Release/net8.0/* "$pkgdir/usr/lib/$pkgname/"
    
    # Create launcher script
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec dotnet /usr/lib/$pkgname/Grayjay.ClientServer.dll "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}