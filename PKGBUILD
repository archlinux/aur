# Maintainer: Zachary M <minein12 at protonmail dot com>

pkgname='min-ed-launcher'
pkgver=0.12.2
_pkgver=v${pkgver}
pkgrel=2
pkgdesc='Minimal Elite Dangerous Launcher'
url='https://github.com/rfvgyhn/min-ed-launcher'
arch=('x86_64')
license=(MIT)
makedepends=(
    'dotnet-sdk-8.0-bin'
    'git'
)
source=("git+${url}.git#tag=${_pkgver}")
sha256sums=('65d3962f8b45a46ed5fd0b014d7118c7f5d57fdeb35ce7376c587681318e2413')
install=${pkgname}.install
options=(!strip)

build() {
    cd "$pkgname"

    dotnet restore -r linux-x64
    dotnet publish src/MinEdLauncher/MinEdLauncher.fsproj -r linux-x64 \
     --self-contained true --no-restore -o "build" \
     -c Release -p:PublishSingleFile=true
}

package() {
    cd "$pkgname"

    install -Dm 644 LICENSE \
        -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm 755 build/MinEdLauncher \
        -t "$pkgdir/usr/bin"

    ln -s "/usr/bin/MinEdLauncher" "$pkgdir/usr/bin/minedlauncher"

    install -Dm 644 resources/min-ed-launcher.desktop \
        -t "$pkgdir/usr/share/applications"

    install -Dm 644 resources/min-ed-launcher.svg \
        -t "$pkgdir/usr/share/icons/hicolor/scalable"
}
