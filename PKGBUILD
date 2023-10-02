pkgname=dremio-bin
pkgdesc="The Easy and Open Data Lakehouse Platform"
url="https://www.dremio.com"

provides=("dremio")
license=("Apache")
depends=("jdk8-openjdk")

pkgver=24.1.0
_pkgstr=202306130653310132-d30779f6
_archive=dremio-community-$pkgver-$_pkgstr

pkgrel=1
arch=("any")

#curl -sI https://download.dremio.com/community-server/dremio-community-LATEST.tar.gz | grep location | cut -f2 -d' '

source=("$pkgname.hook" "https://download.dremio.com/community-server/$pkgver-$_pkgstr/$_archive.tar.gz")
sha256sums=('11386376716ef81ae2194c52dc9ce8f2e55effa9fcb572cc3c1e498d54316859'
            'cc68a065f6095029a81478867d392835ccd2272b0bd9bf3893565cfde8066572')

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
