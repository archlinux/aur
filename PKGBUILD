pkgname=rala-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Publish static websites with Git over SSH (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/rala"
depends=('gcc-libs' 'glibc' 'git' 'systemd')
provides=("rala=$pkgver")
conflicts=('rala')
install=rala.install
backup=('etc/rala/config.toml')
options=('!strip' '!debug')

_tag="v0.1.0"
source_x86_64=("$url/releases/download/$_tag/rala-$_tag-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/$_tag/rala-$_tag-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d168864acde9d263a3d2dd11b8a14ef381784fea9be0bd68171b58467bbf807a')
sha256sums_aarch64=('ccdcb32fff7aea2f5dfa3eefe6ae230e760b1fa4fdc8fb971ab386c9e008ae95')

package() {
    cd "$srcdir"
    install -Dm755 rala "$pkgdir/usr/bin/rala"

    install -dm770 "$pkgdir/etc/rala"
    install -m600 config.example.toml "$pkgdir/etc/rala/config.toml"
    sed -i 's|^data_dir = .*|data_dir = "/var/lib/rala"|' "$pkgdir/etc/rala/config.toml"

    install -Dm644 packaging/rala.service "$pkgdir/usr/lib/systemd/system/rala.service"
    sed -i 's|^ExecStart=/usr/local/bin/rala |ExecStart=/usr/bin/rala |' \
        "$pkgdir/usr/lib/systemd/system/rala.service"
    install -Dm644 packaging/rala.sysusers "$pkgdir/usr/lib/sysusers.d/rala.conf"
    install -Dm644 packaging/rala.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/rala.conf"
    install -Dm644 README.md "$pkgdir/usr/share/doc/rala/README.md"
}
