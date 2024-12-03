# Maintainer: Sebastian 'gonX' Jensen <gonx@gonx.dk>
# Contributor: LavaDesu <me@lava.moe>
pkgname=opentabletdriver
_pkgname=OpenTabletDriver
pkgver=0.6.4.0
pkgrel=6
pkgdesc="A cross-platform open source tablet driver"
arch=('x86_64')
url="https://opentabletdriver.net"

# license FIXME tracked upstream:
# https://github.com/OpenTabletDriver/OpenTabletDriver/issues/3571
license=('LGPL3') # FIXME: use SPDX format
depends=('dotnet-runtime-6.0' 'gtk3' 'libevdev')
optdepends=('libxrandr: x11 display querying support' 'libx11')
makedepends=('dotnet-sdk>=6.0' 'jq' 'git')
conflicts=(
  'digimend-kernel-drivers-dkms-git'
  'digimend-drivers-git-dkms'
  'digimend-kernel-drivers-dkms'
  'digimend-kernel-drivers'
)
install="notes.install"

# unified binary dotnet releases break when stripped
# see https://github.com/dotnet/runtime/issues/54947
#
# disabling debug is necessary for the time being
# see https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/19
options=('!strip')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/OpenTabletDriver/OpenTabletDriver/archive/v$pkgver.tar.gz"
        "notes.install"
        )

sha256sums=('1ad04f4a32b54b9b62bd944b0196abb6613873b19c269abcc9f9e94c1dc3027f'
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
}
