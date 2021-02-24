pkgname=vpncloud2
pkgver=2.1.0
pkgrel=1
pkgdesc='Peer-to-peer VPN'
arch=('x86_64')
url="https://vpncloud.ddswd.de/"
license=('GPL')
depends=('libsystemd')
makedepends=('rust' 'cargo' 'git')
source=(git+https://github.com/dswd/vpncloud.rs.git#tag=v${pkgver}
        sysusers.conf
        add_mtu_config.patch)
noextract=()
sha256sums=('SKIP'
            'eb756f1f940838cfe35555ba9e8e07d0e7182a72ace03853256ec5b72b0e8fbf'
            '1c8be008faa92063a38b8057ead443efb23a186f52b7c8315b0cac80910bd9ea')
validpgpkeys=('6B5BBBCA2E3392315CC47434694A43B9C7FE6EA9')

prepare() {
        cd vpncloud.rs
        patch -p1 < ${srcdir}/add_mtu_config.patch
}

build() {
        cd vpncloud.rs

        # Build w/ release optimisations,
        cargo build --release
}

package() {
        cd vpncloud.rs
        
        install -d $pkgdir/etc/vpncloud
        install -m600 assets/example.net.disabled $pkgdir/etc/vpncloud/example.net.disabled

        install -D -m644 assets/vpncloud.1 $pkgdir/usr/share/man/man1/vpncloud.1
        install -D -m644 assets/vpncloud@.service $pkgdir/usr/lib/systemd/system/vpncloud@.service
        install -D -m755 target/release/vpncloud $pkgdir/usr/bin/vpncloud
        install -Dm0644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/vpncloud.conf"
}
