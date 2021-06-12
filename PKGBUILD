# Maintainer: Yauheni Kirylau <actionless dot loveless AT gmail.com>
# shellcheck disable=SC2034,SC2148,SC2154,SC2164

pkgname=nohang-git
pkgver=0.2.0.r8.gb84cf12
pkgrel=1
pkgdesc="A sophisticated low memory handler"
arch=('any')
url="https://github.com/hakavlad/nohang"
license=('MIT')
source=(
	"$pkgname::git+https://github.com/hakavlad/nohang.git#branch=master"
)
md5sums=('SKIP')
depends=(
	'python'
	'systemd'
)
optdepends=(
	'libnotify: to show GUI notifications'
	'sudo: to show GUI notifications if nohang started with UID=0'
	'logrotate: maintaining a separate log is one of the options'
)
makedepends=(
	'git'
)
provides=('nohang')
conflicts=('nohang')
backup=(
	'etc/nohang/nohang.conf'
	'etc/nohang/nohang-desktop.conf'
	'etc/logrotate.d/nohang'
)

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	set -o pipefail
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${pkgname}" || exit 2
	make \
		DESTDIR="${pkgdir}" \
		PREFIX="/usr" \
		SBINDIR="/usr/bin" \
		SYSCONFDIR="/etc" \
		SYSTEMDUNITDIR="/usr/lib/systemd/system" \
		install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
