# Maintainer: Kaz Walker <me@kaz.codes>
pkgname=garm-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='GitHub Actions Runner Manager - self-hosted runner orchestrator (official binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/cloudbase/garm'
license=('Apache-2.0')
provides=('garm')
conflicts=('garm')
options=('!strip' '!debug')
install="$pkgname.install"

source=('garm.service'
        'garm.sysusers'
        'garm.tmpfiles')
source_x86_64=("garm-${pkgver}-linux-amd64.tgz::${url}/releases/download/v${pkgver}/garm-linux-amd64.tgz"
               "garm-cli-${pkgver}-linux-amd64.tgz::${url}/releases/download/v${pkgver}/garm-cli-linux-amd64.tgz")
source_aarch64=("garm-${pkgver}-linux-arm64.tgz::${url}/releases/download/v${pkgver}/garm-linux-arm64.tgz"
                "garm-cli-${pkgver}-linux-arm64.tgz::${url}/releases/download/v${pkgver}/garm-cli-linux-arm64.tgz")
sha256sums=('98e3ef2f58cb3240eaea88e6959a7c9db7686a35fdb9971fcdee32ab39069de9'
            'd44464210177dadb30fb3fb0ab3c14c5ec1054e02739096522c5e2b91418ebe6'
            '69263c89f1cddf6f754d40698bdb695dea6cd0b1a46ad5f59dda947eb0db5fd1')
sha256sums_x86_64=('11176acb8a725f914b9b947891b4837d374fb616195562cc0ad45a7be8b6c746'
                   '983fa54557f3f5ce3aa1eeb2387499f5f823d14512a0559ba888667bc3b3e88e')
sha256sums_aarch64=('8b91ed21b911f2c77d9065438b1c5e40ebb79b63cf5dc8b7dc326bbe4ac608cc'
                    '2e05cf59a7a92d145ba79a3f4bcdabdca370c6e136f0de779e526edf497b234b')

package() {
    # Daemon and CLI (each tarball contains a single static binary)
    install -Dm755 garm "$pkgdir/usr/bin/garm"
    install -Dm755 garm-cli "$pkgdir/usr/bin/garm-cli"

    # Upstream contrib/garm.service, with ExecStart pointed at /usr/bin
    install -Dm644 garm.service "$pkgdir/usr/lib/systemd/system/garm.service"

    # garm system user; config and state directories owned by it
    install -Dm644 garm.sysusers "$pkgdir/usr/lib/sysusers.d/garm.conf"
    install -Dm644 garm.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/garm.conf"

    # Default location for external provider binaries
    install -d "$pkgdir/opt/garm/providers.d"
}
