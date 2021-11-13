# Maintainer: Sebastian 'gonX' Jensen <gonx@gonx.dk>
# Contributor: LavaDesu <me@lava.moe>
pkgname=opentabletdriver
_pkgname=OpenTabletDriver
_lpkgname=opentabletdriver
_spkgname=otd
pkgver=0.5.3.3
pkgrel=3
pkgdesc="A cross-platform open source tablet driver"
arch=('x86_64')
url="https://github.com/OpenTabletDriver/OpenTabletDriver"
license=('LGPL3')
depends=('dotnet-runtime-5.0' 'dotnet-host>=5.0' 'gtk3' 'libevdev')
optdepends=('libxrandr: x11 display querying support' 'libx11')
makedepends=('git' 'dotnet-sdk-5.0')
install="notes.install"
source=("OpenTabletDriver-$pkgver.tar.gz::https://github.com/OpenTabletDriver/OpenTabletDriver/archive/v$pkgver.tar.gz"
        'git+https://github.com/OpenTabletDriver/OpenTabletDriver-udev'
        "$_spkgname"
        "$_spkgname-gui"
        "$_lpkgname.service"
        "$_pkgname.desktop"
        "notes.install")

sha256sums=('5673851a3b56ae47e4f1d28ff6131ea8f1ac282ab7250ac4687dfbe760805037'
            'SKIP'
            '8a09d29e683aefcbf54e5fe891d5688f959d9399804f9c151f0e8f6e6a1ede1a'
            '20aac1584a8e08b5a9add1d02ce38e60ddfede615227df6f25c7422217df82b0'
            '88f7d9ae1e9402cfbf9266ddf0de642195b64de13a3d5ce6f93460ba035cf7f2'
            '4399359bf6107b612d10aaa06abb197db540b00a973cfec64c2b40d1fbbb2834'
            'aa10ff32dd3d6762b1cb0174f6000c49bf4d4670887d3f47ec0a4ac584cff859')

_srcdir="OpenTabletDriver-$pkgver"

prepare() {
    cd "$srcdir/$_pkgname-udev/.modules"
    rmdir "$_pkgname"
    ln -s "$srcdir/$_srcdir" "$_pkgname"
}

build() {
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

    cd "$srcdir/$_srcdir"

    dotnet publish        OpenTabletDriver.Daemon   \
        --configuration   Release                   \
        --framework       net5                      \
        --runtime         linux-x64                 \
        --self-contained  false                     \
        --output          "./$_pkgname/out"         \
        /p:SuppressNETCoreSdkPreviewMessage=true    \
        /p:PublishTrimmed=false

    dotnet publish        OpenTabletDriver.Console  \
        --configuration   Release                   \
        --framework       net5                      \
        --runtime         linux-x64                 \
        --self-contained  false                     \
        --output          "./$_pkgname/out"         \
        /p:SuppressNETCoreSdkPreviewMessage=true    \
        /p:PublishTrimmed=false

    dotnet publish        OpenTabletDriver.UX.Gtk   \
        --configuration   Release                   \
        --framework       net5                      \
        --runtime         linux-x64                 \
        --self-contained  false                     \
        --output          "./$_pkgname/out"         \
        /p:SuppressNETCoreSdkPreviewMessage=true    \
        /p:PublishTrimmed=false

    cd "$srcdir/$_pkgname-udev"
    dotnet build          OpenTabletDriver.udev     \
        --configuration   Release                   \
        --framework       net5                      \
        --runtime         linux-x64                 \
        --output          "./$_pkgname.udev/out"    \
        /p:SuppressNETCoreSdkPreviewMessage=true

    dotnet "./$_pkgname.udev/out/$_pkgname.udev.dll" \
        "$srcdir/$_srcdir/$_pkgname/Configurations" \
        "90-$_lpkgname.rules" > /dev/null
}

package() {
    cd "$srcdir"

    install -do root "$pkgdir/usr/share/$_pkgname"

    cd "$srcdir/$_srcdir/$_pkgname/out"
    for binary in *.dll *.json *.pdb; do
        install -Dm 755 -o root "$binary" -t "$pkgdir/usr/share/$_pkgname"
    done
    cd "$srcdir"

    sed -i "s/OTD_VERSION/$pkgver/" "$_pkgname.desktop"

    install -Dm 644 -o root "$srcdir/$_pkgname-udev/90-$_lpkgname.rules" -t "$pkgdir/usr/lib/udev/rules.d"
    install -Dm 644 -o root "$srcdir/$_srcdir/$_pkgname.UX/Assets/$_spkgname.png" -t "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/$_srcdir/$_pkgname/Configurations" "$pkgdir/usr/share/$_pkgname/"

    install -Dm 755 -o root "$_spkgname" -t "$pkgdir/usr/bin"
    install -Dm 755 -o root "$_spkgname-gui" -t "$pkgdir/usr/bin"
    install -Dm 644 -o root "$_lpkgname.service" -t "$pkgdir/usr/lib/systemd/user"
    install -Dm 644 -o root "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
