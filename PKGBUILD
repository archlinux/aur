# Maintainer: Zachary M <minein12 at protonmail dot com>

_pkgname='min-ed-launcher'
pkgname="${_pkgname}-git"
pkgver=0.12.2.r26.g9814c54
pkgrel=1
pkgdesc='Minimal Elite Dangerous Launcher'
url='https://github.com/rfvgyhn/min-ed-launcher'
arch=('x86_64')
license=(MIT)
makedepends=(
    'dotnet-sdk-8.0-bin'
    'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
install=${pkgname}.install
options=(!strip)

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
