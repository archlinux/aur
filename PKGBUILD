# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl-git
pkgver=master
commit=('3877e5cef1a50e6b450b09acc6cc2563bb1d6cc1')
pkgrel=9
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit template.'
arch=('any')
url='https://github.com/Hetsh/mcsctl'
license=('GPL3')
depends=('bash' 'grep' 'java-runtime-headless>=8' 'jq' 'screen' 'sudo' 'systemd')
provides=('mcsctl')
conflicts=('mcsctl')
install="$pkgname.install"
source=("$url/archive/$commit.tar.gz")
sha256sums=('c204bc859239553c3107c5f9b8a086e39c6e8f3c3e30199c9716bd17ca0aff80')

package() {
	work_dir="${pkgname%-git}-$commit"
	install -Dm 644 "$work_dir/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$work_dir/mcsctl.sh" "$pkgdir/usr/bin/mcsctl"
	install -Dm 644 "$work_dir/mcs-update@.timer" "$pkgdir/usr/lib/systemd/system/mcs-update@.timer"
	install -Dm 644 "$work_dir/mcs-update@.service" "$pkgdir/usr/lib/systemd/system/mcs-update@.service"
	
	# Generate an example config file from default options inside the mcsctl script
	sed -n '/\# Mutable config/,/\# \/Mutable config/p' "$work_dir/mcsctl.sh" | head -n -1 | tail -n +2 > "$work_dir/mcsctl.conf.bak"
	install -Dm 644 "$work_dir/mcsctl.conf.bak" "$pkgdir/etc/mcsctl.conf.bak"
}
