# Maintainer: Hetsh <aur@hetsh.de>
# Maintainer: peterfab9845 <archlinux@peterfab.com>

pkgname=mcsctl-git
pkgver=3.0.0.r4.gff820fd
pkgrel=1
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit templates.'
arch=('any')
license=('Unlicense')
depends=('bash' 'grep' 'java-runtime>=16' 'openbsd-netcat' 'sed' 'jq' 'screen' 'sudo')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="$pkgname.install"
url='https://github.com/Hetsh/mcsctl'
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-*}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

package() {
	work_dir="${pkgname%-*}"
	install -Dm 644 "$work_dir/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$work_dir/mcsctl.sh" "$pkgdir/usr/bin/mcsctl"
	install -Dm 644 "$work_dir/mcs-update@.timer" "$pkgdir/usr/lib/systemd/system/mcs-update@.timer"
	install -Dm 644 "$work_dir/mcs-update@.service" "$pkgdir/usr/lib/systemd/system/mcs-update@.service"
	install -Dm 644 "$work_dir/mcsctl-completion.bash" "$pkgdir/usr/share/bash-completion/completions/mcsctl"

	# Generate an example config file from default options inside the mcsctl script
	sed -n '/\# Mutable config/,/\# \/Mutable config/p' "$work_dir/mcsctl.sh" | head -n -1 | tail -n +2 > "$work_dir/mcsctl.conf.bak"
	install -Dm 644 "$work_dir/mcsctl.conf.bak" "$pkgdir/etc/mcsctl.conf.bak"
}
