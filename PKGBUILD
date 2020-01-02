# Maintainer: MoeLava <me@lava.moe>
pkgname=opentabletdriver-git
_pkgname=OpenTabletDriver
_lpkgname=opentabletdriver
pkgver=r302.5e922de
pkgrel=1
pkgdesc="A cross-platform open source tablet driver"
arch=('x86_64')
url="https://github.com/InfinityGhost/OpenTabletDriver"
license=('GPL')
depends=('dotnet-runtime>=3.0' 'dotnet-host>=3.0' 'fontconfig' 'libxrandr' 'libx11' 'libxtst')
makedepends=('git' 'dotnet-sdk>=3.0')
provides=("opentabletdriver")
conflicts=("opentabletdriver")
install="$_lpkgname.install"
source=('git+https://github.com/InfinityGhost/OpenTabletDriver'
        "30-$_lpkgname.rules"
        "$_lpkgname"
        "$_lpkgname.install"
        "$_pkgname.desktop")

sha256sums=('SKIP'
            'f0eed4291884647da3b685e0f8d0e44ee2336892be9cb632dc21e018740d1d66'
            'f9f5ac5d01b9820b88dc8701da7be3f705270537c2b5dc20a82744c216732a97'
            '304ec78284e99395b3091923da540af3a1826205663aa8fd2d52deb64f852166'
            'f837c3c8903cdd88252cb4faeed5cae8f73451dfaa667bbc4a39ebe713acf0d4')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
}

build() {
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
    cd "$srcdir/$_pkgname"

    dotnet publish        OpenTabletDriver     \
        --configuration   Release              \
        --runtime         linux-x64            \
        --self-contained  false                \
        --output          "./$_pkgname/out"    \
        /p:PublishTrimmed=false
}

package() {
    cd "$srcdir"

    install -do root "$pkgdir/usr/share/$_pkgname"

    cd "$srcdir/$_pkgname/$_pkgname/out"
    for binary in *.so *.dll *.json *.pdb; do
        install -Dm 755 -o root "$binary" -t "$pkgdir/usr/share/$_pkgname"
    done
    cd "$srcdir"

    install -Dm 644 -o root "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm 644 -o root "30-$_lpkgname.rules" -t "$pkgdir/usr/lib/udev/rules.d"
    install -Dm 644 -o root "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

    install -Dm 755 -o root "$srcdir/$_pkgname/$_pkgname/out/OpenTabletDriver" -t "$pkgdir/usr/share/$_pkgname"
    install -Dm 755 -o root "$_lpkgname" -t "$pkgdir/usr/bin"
}