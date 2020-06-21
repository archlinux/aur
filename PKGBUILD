# Maintainer: MoeLava <me@lava.moe>
# Maintainer: InfinityGhost <infinityghostgit@gmail.com>
pkgname=opentabletdriver-git
_pkgname=OpenTabletDriver
_lpkgname=opentabletdriver
_spkgname=otd
pkgver=v0.2.0.rc1.r179.g402b178
pkgrel=2
pkgdesc="A cross-platform open source tablet driver"
arch=('x86_64')
url="https://github.com/InfinityGhost/OpenTabletDriver"
license=('GPL')
depends=('dotnet-runtime>=3.0' 'dotnet-host>=3.0' 'fontconfig' 'gtk3' 'libevdev' 'libxrandr' 'libx11')
makedepends=('git' 'dotnet-sdk>=3.0')
provides=("opentabletdriver")
conflicts=("opentabletdriver")
install="reload-systemd.install"
source=('git+https://github.com/InfinityGhost/OpenTabletDriver'
        'git+https://github.com/InfinityGhost/OpenTabletDriver-udev'
        "$_spkgname"
        "$_spkgname-gui"
        "$_lpkgname.service"
        "$_pkgname.desktop"
        "reload-systemd.install")

sha256sums=('SKIP'
            'SKIP'
            '3b4e49ee69a632538869f0e21446da16d21aa5075241c5c35545cecb485134d8'
            '0407c3d546a382a8715318a785e11140c11a94f44edef3f730cb0f27ed7cff62'
            'f115b727640f78a8d641fab5554305b6e064d73dc4c3f869db85bcaf412f98f1'
            '4399359bf6107b612d10aaa06abb197db540b00a973cfec64c2b40d1fbbb2834'
            '1570586c391e9d0d923cc7e6af01f92a9a95e04fd510cf5c33080a55656f2ad6')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

    cd "$srcdir/$_pkgname"
    dotnet publish        OpenTabletDriver.Daemon   \
        --configuration   Release                   \
        --runtime         linux-x64                 \
        --self-contained  false                     \
        --output          "./$_pkgname/out"         \
        /p:PublishTrimmed=false

    dotnet publish        OpenTabletDriver.Console  \
        --configuration   Release                   \
        --runtime         linux-x64                 \
        --self-contained  false                     \
        --output          "./$_pkgname/out"         \
        /p:PublishTrimmed=false

    dotnet publish        OpenTabletDriver.UX.Gtk   \
        --configuration   Release                   \
        --framework       netcoreapp3.1             \
        --runtime         linux-x64                 \
        --self-contained  false                     \
        --output          "./$_pkgname/out"         \
        /p:PublishTrimmed=false

    cd "$srcdir/$_pkgname-udev"
    dotnet build          OpenTabletDriver.udev     \
        --configuration   Release                   \
        --runtime         linux-x64                 \
        --output          "./$_pkgname.udev/out"

    dotnet "./$_pkgname.udev/out/$_pkgname.udev.dll"       \
        "$srcdir/$_pkgname/TabletDriverLib/Configurations" \
        "30-$_lpkgname.rules" > /dev/null
}

package() {
    cd "$srcdir"

    install -do root "$pkgdir/usr/share/$_pkgname"

    cd "$srcdir/$_pkgname/$_pkgname/out"
    for binary in *.dll *.json *.pdb; do
        install -Dm 755 -o root "$binary" -t "$pkgdir/usr/share/$_pkgname"
    done
    cd "$srcdir"

    sed -i "s/OTD_VERSION/$pkgver/" "$_pkgname.desktop"

    install -Dm 644 -o root "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm 644 -o root "$srcdir/$_pkgname-udev/30-$_lpkgname.rules" -t "$pkgdir/usr/lib/udev/rules.d"
    install -Dm 644 -o root "$srcdir/$_pkgname/$_pkgname.UX/Assets/$_spkgname.png" -t "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/$_pkgname/TabletDriverLib/Configurations" "$pkgdir/usr/share/$_pkgname/"

    install -Dm 755 -o root "$_spkgname" -t "$pkgdir/usr/bin"
    install -Dm 755 -o root "$_spkgname-gui" -t "$pkgdir/usr/bin"
    install -Dm 644 -o root "$_lpkgname.service" -t "$pkgdir/usr/lib/systemd/user"
    install -Dm 644 -o root "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
