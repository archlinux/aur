# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl
pkgver=2.1.0
pkgrel=1
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit template.'
arch=('any')
url='https://github.com/Hetsh/mcsctl'
license=('GPL3')
depends=('bash' 'grep' 'java-runtime-headless>=8' 'jq' 'screen' 'sudo' 'systemd')
provides=('mcsctl')
conflicts=('mcsctl-git')
install="$pkgname.install"
source=("https://github.com/Hetsh/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('66905358136543205027112ef879d19a171332419e9b57a65445dbafb0a1bb04')

package() {
	work_dir="$pkgname-$pkgver"
	install -Dm 644 "$work_dir/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$work_dir/mcsctl.sh" "$pkgdir/usr/bin/mcsctl"
	install -Dm 644 "$work_dir/mcs-update@.timer" "$pkgdir/usr/lib/systemd/system/mcs-update@.timer"
	install -Dm 644 "$work_dir/mcs-update@.service" "$pkgdir/usr/lib/systemd/system/mcs-update@.service"
	
	# Generate an example config file from default options inside the mcsctl script
	sed -n '/\# Mutable config/,/\# \/Mutable config/p' "$work_dir/mcsctl.sh" | head -n -1 | tail -n +2 > "$srcdir/$pkgname-$pkgver/mcsctl.conf.bak"
	install -Dm 644 "$srcdir/$work_dir/mcsctl.conf.bak" "$pkgdir/etc/mcsctl.conf.bak"
}
