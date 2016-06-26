# Maintainer: Oscar Rainford <oscar@fourbytes.me>
pkgname=vpncloud
pkgver=0.6.0
pkgrel=1
pkgdesc='Peer-to-peer VPN'
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=('libsystemd' 'start-stop-daemon')
makedepends=('rust' 'cargo' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+ssh://git@github.com/dswd/vpncloud.rs.git#tag=v0.6.0'
        'git+ssh://git@github.com/jedisct1/libsodium.git#tag=1.0.10')
noextract=()
sha256sums=('SKIP' 'SKIP')
validpgpkeys=('6B5BBBCA2E3392315CC47434694A43B9C7FE6EA9')

prepare() {
        cd vpncloud.rs

        # Pull submodules
        git submodule init
        git config submodule.libsodium.url $srcdir/libsodium
        git submodule update
}

build() {
        cd vpncloud.rs

        # Build w/ release optimisations,
        cargo build --release
}

package() {
        cd vpncloud.rs
        
        install -d $pkgdir/etc/vpncloud
        install -m600 deb/vpncloud/example.net $pkgdir/etc/vpncloud/example.net

        install -D -m644 deb/vpncloud/debian/vpncloud.service $pkgdir/usr/lib/systemd/system/vpncloud.service
        install -D -m755 deb/vpncloud/vpncloud-control $pkgdir/usr/bin/vpncloud-control
        install -D -m755 target/release/vpncloud $pkgdir/usr/bin/vpncloud
}
