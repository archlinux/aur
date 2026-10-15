# Maintainer: Zachary M <minein12 at protonmail dot com>

pkgname='min-ed-launcher'
pkgver=0.14.0
pkgrel=1
pkgdesc='Minimal Elite Dangerous Launcher'
url='https://github.com/rfvgyhn/min-ed-launcher'
arch=('x86_64')
license=(MIT)
makedepends=(
    'dotnet-sdk-bin'
)
depends=(
    'hicolor-icon-theme'
    'libstdc++'
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3d235419414a9a70a3a728aef8663241d72ba898c0b9c17dceabfda390a911a3')
install=${pkgname}.install
options=(!strip)

build() {
    cd "$pkgname-$pkgver"

    dotnet restore -r linux-x64
    dotnet publish src/MinEdLauncher/MinEdLauncher.fsproj -r linux-x64 \
     --self-contained true --no-restore -o "build" \
     -c Release -p:PublishSingleFile=true
}

package() {
    cd "$pkgname-$pkgver"

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
