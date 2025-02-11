# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=sourcegit
pkgver=2025.04
pkgrel=1
pkgdesc="GUI client for GIT users"
arch=('x86_64')
url='https://github.com/sourcegit-scm/sourcegit'
license=('MIT')
depends=('dotnet-runtime-9.0' 'git' 'xdg-utils')
optdepends=('git-credential-manager: third-party authentication support')
makedepends=('dotnet-sdk-9.0' 'desktop-file-utils')

source=("$pkgname-$pkgver.tar.gz::https://github.com/sourcegit-scm/sourcegit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4086b221e28786d9191913fce8776ccd3347b722c9ae728384d5cfaea39b69c')



prepare() {
    cd "$pkgname-$pkgver"

    desktop-file-edit build/resources/_common/applications/sourcegit.desktop \
        --set-icon=sourcegit --set-key=Exec --set-value=sourcegit
}

build() {
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

    cd "$pkgname-$pkgver"

    dotnet publish src/SourceGit.csproj -c Release -r linux-x64 -o publish \
        -p:DisableAot=true \
        -p:DisableUpdateDetection=true
    rm -f publish/SourceGit.pdb
    mv publish/SourceGit "publish/$pkgname"
}

package() {
    cd "$pkgname-$pkgver"

    install -d "$pkgdir/opt/$pkgname/"
    install -d "$pkgdir/usr/bin/"

    cp -Pr "publish/"* "$pkgdir/opt/$pkgname/"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "build/resources/_common/applications/sourcegit.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "build/resources/_common/icons/sourcegit.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
