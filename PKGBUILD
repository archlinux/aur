# Maintainer:  GI Jack <GI_Jack@hackermail.com>
# Contributor:  M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=raid-check-systemd
pkgver=4.1
pkgrel=4
_centrel=14
pkgdesc="Raid data scrubbing script with systemd timer to be used with mdadm."
arch=('any')
url="https://wiki.archlinux.org/index.php/RAID#Scrubbing"
license=('GPL')
depends=('mdadm' 'systemd')
conflicts=('raid-check')
source=("http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/mdadm-${pkgver}-${_centrel}.el8.x86_64.rpm"
        'raid-check.service'
        'raid-check.timer')

sha256sums=('df662e347f53ddd30ae04fe56dbfcd8d35807f9bce59edbf899056b671850e8a'
            '90db8f53984df9d7ab32fde09a853632e9d76cbd91224c0efd760406118af84b'
            '2a7677fb83b67f71cb626169746ccaf39417f2b291b4cbc5a264706fdb8cc8b2')
            
backup=('etc/conf.d/raid-check')
install="$pkgname.install"

build() {
    cd $srcdir
    sed -i 's|sysconfig|conf.d|g' 'usr/sbin/raid-check'
}

package() {
    install -Dm 755 "$srcdir/usr/sbin/raid-check" "$pkgdir/usr/bin/raid-check"
    install -Dm 644 "$srcdir/etc/sysconfig/raid-check" "$pkgdir/etc/conf.d/raid-check"

    install -Dm 644 "$srcdir/raid-check.service" "$pkgdir/usr/lib/systemd/system/raid-check.service"
    install -Dm 644 "$srcdir/raid-check.timer" "$pkgdir/usr/lib/systemd/system/raid-check.timer"
}
