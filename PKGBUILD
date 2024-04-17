# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=sourcegit
pkgver=8.8
pkgrel=1
pkgdesc="GUI client for GIT users"
arch=('x86_64')
url='https://github.com/sourcegit-scm/sourcegit'
license=('MIT')
depends=('dotnet-runtime-8.0' 'git' 'git-credential-manager' 'xdg-utils')
makedepends=('dotnet-sdk-8.0' 'libicns')

source=("$pkgname-$pkgver.tar.gz::https://github.com/sourcegit-scm/sourcegit/archive/refs/tags/v$pkgver.tar.gz"
        'sourcegit.desktop')
sha256sums=('84cdbd39fb375c393dfee888473381406056bb74984525845f8fbecb087d42b1'
            '18e4e0df2b0ca3a50048f35cd193bd9b7f53e910ccd52c3405dead0bee1c3bc5')



build() {
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
    
    cd "$pkgname-$pkgver"

    dotnet publish src/SourceGit.csproj -c Release -r linux-x64 -o publish -p:PublishAot=true -p:PublishTrimmed=true -p:TrimMode=link --self-contained
    rm publish/SourceGit.dbg
    icns2png -x -s 256x256 build/resources/App.icns 2>/dev/null
}

package() {
    _bin=SourceGit

    install -d "$pkgdir/opt/$pkgname/"
    install -d "$pkgdir/usr/bin/"

    cp -r "$srcdir/$pkgname-$pkgver/publish/"* "$pkgdir/opt/$pkgname/"
    ln -s "/opt/$pkgname/$_bin" "$pkgdir/usr/bin/$_bin"

    install -Dm644 "sourcegit.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-$pkgver/App_256x256x32.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
