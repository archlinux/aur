# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl-git
pkgver=master
commit=('d0729f6eca367a3b36ca8dbca7c62b28c4636ca8')
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
sha256sums=('11dc0e82d0106e2cdd1ae57b054c88fc3d7163f8d95358ac84d6ee87776b8487')

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