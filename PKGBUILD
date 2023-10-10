pkgname=dremio-bin
pkgdesc="The Easy and Open Data Lakehouse Platform"
url="https://www.dremio.com"

provides=("dremio")
license=("Apache")
depends=("jdk8-openjdk")

# Use get-latest.sh to generate pkgver and _pkgstr

pkgver=24.2.2
_pkgstr=202309281602050954-7d5e877f

pkgrel=2
arch=("any")

_archive=dremio-community-$pkgver-$_pkgstr

source=("$pkgname.hook" "https://download.dremio.com/community-server/$pkgver-$_pkgstr/$_archive.tar.gz")
sha256sums=('11386376716ef81ae2194c52dc9ce8f2e55effa9fcb572cc3c1e498d54316859'
            'edfd3bbbb69172c9a973dcb0d4d08a223ae2c8f49c8bd32634e5fa0f0c38544b')

package() {
    mkdir -p $pkgdir/opt
    mkdir -p $pkgdir/usr/lib/systemd/system

    # Install dremio
    cp -r $srcdir/$_archive $pkgdir/opt/dremio

    # Link dremio systemd unit
    ln -s /opt/dremio/share/dremio.service $pkgdir/usr/lib/systemd/system/dremio.service

    # Create dremio sysuser
    echo 'u dremio - "Dremio daemon"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

    # Create hook to ensure runtime directories exist with correct owner
    install -Dm644 $srcdir/$pkgname.hook "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
}
