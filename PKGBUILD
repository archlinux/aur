# Maintainer: Jan-Niklas Tomski <jan-niklas at tomski dot me>
# Contributor: Greg Brown <greg.brown.00 at outlook dot com>
pkgver=r141.ab6341d
pkgname='dracut-sshd-git'
pkgrel=1
pkgdesc='Provide SSH access to initramfs'
arch=(any)
url='https://github.com/gsauthof/dracut-sshd'
license=('GPL-3.0-or-later')
depends=('dracut' 'openssh')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gsauthof/dracut-sshd.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}" || exit

	# Arch's openssh package does not have support for Type=Notify
	sed -e 's/^Type=notify/Type=simple/' \
			-e 's@^\(ExecStart=/usr/sbin/sshd\) -D@\1 -e -D@' \
			-i \
			"./46sshd/sshd.service"
}

package() {
	cd "$srcdir/${pkgname%-git}" || exit

	target="$pkgdir/usr/lib/dracut/modules.d/46sshd"
	install -Dt "$target" -m 0755 46sshd/module-setup.sh
	install -Dt "$target" -m 0644 46sshd/sshd.service
	install -Dt "$target" -m 0644 46sshd/motd
	install -Dt "$target" -m 0644 46sshd/profile
	install -Dt "$target" -m 0644 46sshd/sshd_config
}
