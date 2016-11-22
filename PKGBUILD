# Maintainer:	M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=raid-check-systemd
pkgver=3.3.2
pkgrel=1
_cent_rel=7
pkgdesc="Raid data scrubbing script with systemd timer to be used with mdadm."
arch=('any')
url="https://wiki.archlinux.org/index.php/RAID#Scrubbing"
license=('GPL')
depends=('mdadm' 'systemd')
# makedepends=('rpmextract')
conflicts=('raid-check')
source=("http://mirror.centos.org/centos/7/os/x86_64/Packages/mdadm-$pkgver-$_cent_rel.el7.x86_64.rpm"
	'raid-check.service'
	'raid-check.timer')
sha256sums=('b319904cfb0d5dd20e8cf9e7bd781d77b0aaca9f932ebf0c950bf9ad4dcd400c'
            '90db8f53984df9d7ab32fde09a853632e9d76cbd91224c0efd760406118af84b'
            '4ef8adc88574127d2d8f119d42f2190782f8cafca8a7c627b6d5cace6b12af47')
backup=('etc/conf.d/raid-check')
install="$pkgname.install"
        
# --- Source package is also available from the Fedora project mirrors ---
# https://mirrors.kernel.org/fedora/releases/23/Everything/x86_64/os/Packages/m/mdadm-3.3.2-2.fc23.x86_64.rpm

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
