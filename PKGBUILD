# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl-git
pkgver=master
pkgrel=11
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit templates.'
arch=('any')
license=('GPL3')
depends=('bash' 'grep' 'java-runtime-headless>=8' 'netcat' 'jq' 'screen' 'sudo' 'systemd')
provides=('mcsctl')
conflicts=('mcsctl')
install="$pkgname.install"
url='https://github.com/Hetsh/mcsctl'
commit=('7f22f1d2007681ffb3db3d3ec0a9ff9c912094f5')
source=("$url/archive/$commit.tar.gz")
sha256sums=('c1134331caf56d6f83e89606ab1957c03912e89330ac18fc60c826167d64c808')

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
