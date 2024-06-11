# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=sourcegit
pkgver=8.16
pkgrel=1
pkgdesc="GUI client for GIT users"
arch=('x86_64')
url='https://github.com/sourcegit-scm/sourcegit'
license=('MIT')
depends=('dotnet-runtime-8.0' 'git' 'git-credential-manager' 'xdg-utils')
makedepends=('dotnet-sdk-8.0')

source=("$pkgname-$pkgver.tar.gz::https://github.com/sourcegit-scm/sourcegit/archive/refs/tags/v$pkgver.tar.gz"
        'sourcegit.desktop')
sha256sums=('c2cf6bce4434d1767a6ba45201667853f9ef48a9ebc1951e22cdbdef65f87b77'
            '3488ee13a4ca1bae85c35f866d046304d8716a64c46cadb2576cb8b4ae44b058')



build() {
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
    
    cd "$pkgname-$pkgver"

    dotnet publish src/SourceGit.csproj -c Release -r linux-x64 -o publish -p:PublishAot=true -p:PublishTrimmed=true -p:TrimMode=link --self-contained
    rm -f publish/SourceGit.dbg
    mv publish/SourceGit "publish/$pkgname"
}

package() {
    install -d "$pkgdir/opt/$pkgname/"
    install -d "$pkgdir/usr/bin/"

    cp -r "$pkgname-$pkgver/publish/"* "$pkgdir/opt/$pkgname/"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 sourcegit.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgname-$pkgver/build/resources/_common/usr/share/icons/sourcegit.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
