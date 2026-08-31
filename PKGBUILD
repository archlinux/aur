# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=sourcegit
pkgver=2026.19
pkgrel=1
pkgdesc="GUI client for GIT users"
arch=('x86_64')
url='https://github.com/sourcegit-scm/sourcegit'
license=('MIT')
depends=('dotnet-runtime-10.0' 'git' 'xdg-utils')
optdepends=('git-credential-manager: third-party authentication support')
makedepends=('dotnet-sdk-10.0' 'desktop-file-utils')

source=("git+https://github.com/sourcegit-scm/$pkgname.git#tag=v$pkgver"
        "git+https://github.com/love-linger/AvaloniaEdit.git")
sha256sums=('692528d0fcc0fc460b10dbe8e07b965954e0ddf9e7a610e8cc4471545e1dae0d'
            'SKIP')

prepare() {
    cd "$pkgname"

    git submodule init
    git config submodule.depends/AvaloniaEdit.url "$srcdir/AvaloniaEdit"
    git -c protocol.file.allow=always submodule update

    desktop-file-edit build/resources/_common/applications/sourcegit.desktop \
        --set-icon=sourcegit --set-key=Exec --set-value=sourcegit
}

build() {
    cd "$pkgname"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
    export DOTNET_NOLOGO=true
    export NUGET_PACKAGES="$PWD/nuget"

    dotnet publish src/SourceGit.csproj -c Release -r linux-x64 -o publish \
        -p:DisableAot=true \
        -p:DisableUpdateDetection=true
    rm -f publish/*.pdb
    mv publish/SourceGit "publish/$pkgname"
}

package() {
    cd "$pkgname"

    install -d "$pkgdir/opt/$pkgname/"
    install -d "$pkgdir/usr/bin/"

    cp -Pr "publish/"* "$pkgdir/opt/$pkgname/"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "build/resources/_common/applications/sourcegit.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "build/resources/_common/icons/sourcegit.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
