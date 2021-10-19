# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl
pkgver=2.2.0
pkgrel=3
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit templates.'
arch=('any')
license=('Unlicense')
depends=('bash' 'grep' 'java-runtime>=16' 'openbsd-netcat' 'sed' 'jq' 'screen' 'sudo')
provides=('mcsctl')
conflicts=('mcsctl-git')
install="$pkgname.install"
url='https://github.com/Hetsh/mcsctl'
source=("$url/archive/${pkgver}.tar.gz")
sha256sums=('209864e49556dfeae12c80198ee6cbadf130dc92bee1728238765a07e301b8fc')

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
