# Maintainer: Sebastian 'gonX' Jensen <gonx@gonx.dk>
# Contributor: LavaDesu <me@lava.moe>
pkgname=opentabletdriver
_pkgname=OpenTabletDriver
pkgver=0.6.6.2
pkgrel=1
pkgdesc="A cross-platform open source tablet driver"
arch=('x86_64')
url="https://opentabletdriver.net"
license=('LGPL-3.0-or-later')
depends=('dotnet-runtime-8.0' 'gtk3' 'libevdev')
optdepends=('libxrandr: x11 display querying support' 'libx11')
makedepends=('dotnet-sdk>=8.0' 'jq' 'git')
conflicts=(
  'digimend-kernel-drivers-dkms-git'
  'digimend-drivers-git-dkms'
  'digimend-kernel-drivers-dkms'
  'digimend-kernel-drivers'
)
install="notes.install"

# unified binary dotnet releases break when stripped
# see https://github.com/dotnet/runtime/issues/54947
options=('!strip')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/OpenTabletDriver/OpenTabletDriver/archive/v$pkgver.tar.gz"
        "notes.install"
        )

sha256sums=('1602f3291bad333be56671933e5ba6fb17144432729c10b2a0b40626e8c9dd28'
            '33e50caf00ab290463acaa09b024bcd8bcf6a39911db2fc506e88495171bf3e3')

_srcdir="OpenTabletDriver-$pkgver"

build() {
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

    cd "$srcdir/$_srcdir"

    if check_option "strip" y; then
        EXTRA_OPTIONS="/p:DebugType=None /p:DebugSymbols=false"
    fi

    export OTD_CONFIGURATIONS="${PWD}/OpenTabletDriver.Configurations/Configurations"
    ./eng/linux/package.sh --package Generic -c Release -- $EXTRA_OPTIONS
}

package() {
    cd "$srcdir/$_srcdir"

    cp -r ./dist/files/* "${pkgdir}/"

    # moving LICENSE to the suggested Arch folder is also tracked upstream:
    # https://github.com/OpenTabletDriver/OpenTabletDriver/issues/3572
    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    mv "$pkgdir"/usr/share/doc/opentabletdriver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rmdir -p --ignore-fail-on-non-empty "$pkgdir"/usr/share/doc/opentabletdriver
}
