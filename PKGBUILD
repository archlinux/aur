# Maintainer:  GI Jack <GI_Jack@hackermail.com>
# Contributor:  M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=raid-check-systemd
pkgver=4.2
pkgrel=4
_centrel=7
pkgdesc="Raid data scrubbing script with systemd timer to be used with mdadm."
arch=('any')
url="https://wiki.archlinux.org/index.php/RAID#Scrubbing"
license=('GPL')
depends=('mdadm' 'systemd')
conflicts=('raid-check')
source=("http://mirror.stream.centos.org/9-stream/BaseOS/x86_64/os/Packages/mdadm-${pkgver}-${_centrel}.el9.x86_64.rpm"
        'raid-check.service'
        'raid-check.timer')

sha256sums=('7bac4fab8071be84c404da1acd199fa711007c2910371f43960ecd3c703ac68e'
            '90db8f53984df9d7ab32fde09a853632e9d76cbd91224c0efd760406118af84b'
            '1a0095d05f57d1a9fc4d234e2c21db9e369ca755f0f31e61030b7a7aa840dee1')
            
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
