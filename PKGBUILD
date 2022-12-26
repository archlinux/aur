# Maintainer: Sebastian 'gonX' Jensen <gonx@gonx.dk>
# Contibutor: MoeLava <me@lava.moe>
# Contibutor: InfinityGhost <infinityghostgit@gmail.com>
pkgname=opentabletdriver-git
_pkgname=OpenTabletDriver
_lpkgname=opentabletdriver
_spkgname=otd
pkgver=v0.7.0.0pre.r255.g1eee9d76
pkgrel=2
pkgdesc="A cross-platform open source tablet driver"
arch=('x86_64')
url="https://github.com/OpenTabletDriver/OpenTabletDriver"
license=('LGPL3')
depends=('dotnet-runtime>=7.0' 'dotnet-host>=7.0' 'gtk3' 'libevdev')
optdepends=('libxrandr: x11 display querying support' 'libx11')
makedepends=('git' 'dotnet-sdk>=7.0')
provides=("opentabletdriver")
conflicts=("opentabletdriver")
install="notes.install"
source=('git+https://github.com/OpenTabletDriver/OpenTabletDriver'
        "$_spkgname"
        "$_spkgname-gui"
        "$_lpkgname.service"
        "$_pkgname.desktop"
        "notes.install"
        )
options=(!strip) # sorry, seems like dotnet bug

sha256sums=('SKIP'
            '05b7792f0ee8ffcee40225dd750fe453800c511d228eff5bafe3dd6189390caf'
            'cdd143d2a18d0eb226585d796f39258a2c1575b31475c50d794ecbfab12d64d3'
            '88f7d9ae1e9402cfbf9266ddf0de642195b64de13a3d5ce6f93460ba035cf7f2'
            '4399359bf6107b612d10aaa06abb197db540b00a973cfec64c2b40d1fbbb2834'
            'cddf5b0928bc6e1d8d87ac503b4dd31536d956b1f37e7e3fa1c1b47a0ad23880')

pkgver() {
    cd "$srcdir/$_pkgname"
    # check for the DI rewrite commit that makes plugins incompatible
    if git merge-base --is-ancestor 10a3c07206028f7df5befbdeca6aadb30efe4cb3 HEAD >/dev/null; then
        printf "%s.r%s.g%s\n" \
        "v0.7.0.0pre" \
        $(git log --oneline 10a3c072.. | wc -l) \
        $(git describe --long --tags | sed 's/.*-g\(.*\)/\1/')
    else
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    fi
}

build() {
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

    cd "$srcdir/$_pkgname"
    # check for the DI rewrite commit that makes plugins incompatible
    if git merge-base --is-ancestor 10a3c07206028f7df5befbdeca6aadb30efe4cb3 HEAD >/dev/null; then
        PREFIX="0.7.0.0-pre"
    else
        PREFIX=$(git describe --long --tags | sed 's/-.*//;s/v//')
    fi

    ./build.sh linux-x64 \
        /p:VersionPrefix="$PREFIX" \
        $EXTRA_OPTIONS

    ./generate-rules.sh
}

package() {
    cd "$srcdir"

    install -do root "$pkgdir/usr/share/$_pkgname"

    shopt -s nullglob
    cd "$srcdir/$_pkgname/bin"
    for binary in OpenTabletDriver.* *.pdb; do
        install -Dm 755 -o root "$binary" -t "$pkgdir/usr/share/$_pkgname"
    done
    cd "$srcdir"

    sed -i "s/OTD_VERSION/$pkgver/" "$_pkgname.desktop"

    install -Dm 644 -o root "$_pkgname/bin/99-$_lpkgname.rules" -t "$pkgdir/usr/lib/udev/rules.d"
    install -Dm 644 -o root "$_pkgname/$_pkgname.UX/Assets/$_spkgname.png" -t "$pkgdir/usr/share/pixmaps"

    install -Dm 755 -o root "$_spkgname" -t "$pkgdir/usr/bin"
    install -Dm 755 -o root "$_spkgname-gui" -t "$pkgdir/usr/bin"
    install -Dm 644 -o root "$_lpkgname.service" -t "$pkgdir/usr/lib/systemd/user"
    install -Dm 644 -o root "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
