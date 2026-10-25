# Maintainer: Elecksy <personal@elecksy.top>
# Contributor: Sebastian 'gonX' Jensen <gonx@gonx.dk>
# Contributor: LavaDesu <me@lava.moe>
pkgname=opentabletdriver-rc
_pkgname=OpenTabletDriver
_tag=v0.6.8-rc1
pkgver=0.6.8rc1
pkgrel=1
provides=('opentabletdriver')
pkgdesc="A cross-platform open source tablet driver (release candidate)"
arch=('x86_64')
url="https://opentabletdriver.net"
license=('LGPL-3.0-or-later')
depends=('dotnet-runtime-10.0' 'gtk3' 'libevdev')
optdepends=('libxrandr: x11 display querying support' 'libx11')
makedepends=('dotnet-sdk-10.0' 'jq' 'git')
conflicts=(
  'opentabletdriver'
  'digimend-kernel-drivers-dkms-git'
  'digimend-drivers-git-dkms'
  'digimend-kernel-drivers-dkms'
  'digimend-kernel-drivers'
)
install="notes.install"

# unified binary dotnet releases break when stripped
# see https://github.com/dotnet/runtime/issues/54947
options=('!strip')
source=("$_pkgname-$_tag.tar.gz::https://github.com/OpenTabletDriver/OpenTabletDriver/archive/$_tag.tar.gz"
        "notes.install"
        )

sha256sums=('62bce912d8882f3dbfee4fbe4d2187e76b250e1643e410cc761beb6a48c45a7e'
            '33e50caf00ab290463acaa09b024bcd8bcf6a39911db2fc506e88495171bf3e3')

_srcdir="OpenTabletDriver-${_tag#v}"

build() {
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

    cd "$srcdir/$_srcdir"

    if check_option "strip" y; then
        EXTRA_OPTIONS="/p:DebugType=None /p:DebugSymbols=false"
    fi

    export OTD_CONFIGURATIONS="${PWD}/OpenTabletDriver.Configurations/Configurations"
    ./eng/bash/package.sh --package Generic -c Release -- $EXTRA_OPTIONS
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
