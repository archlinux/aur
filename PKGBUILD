# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl-git
pkgver=master
pkgrel=15
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit templates.'
arch=('any')
license=('Unlicense')
depends=('bash' 'grep' 'java-runtime>=16' 'openbsd-netcat' 'sed' 'jq' 'screen' 'sudo')
provides=('mcsctl')
conflicts=('mcsctl')
install="$pkgname.install"
url='https://github.com/Hetsh/mcsctl'
commit=('534fb5078959ca2b7d0c71cd228edb9c6a9e404a')
source=("$url/archive/$commit.tar.gz")
sha256sums=('106cfa5ba1ceb32f470be097b33fd480ec1c62bb7388c10c57f55892743fd502')

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
