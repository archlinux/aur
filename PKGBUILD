# Maintainer: Librewish <librewish AT gmail.com>

_pkgname=prelockd
pkgname=${_pkgname}-git
pkgver=0.9.r3.g72c7131
pkgrel=1
pkgdesc="prelockd is a daemon that locks memory mapped binaries and libraries in memory to improve system responsiveness under low-memory conditions."
arch=('any')
url="https://github.com/hakavlad/prelockd"
license=('MIT')
source=(
	"$pkgname::git+https://github.com/hakavlad/prelockd.git#branch=master"
)
md5sums=('SKIP')
depends=(
	'python'
)

makedepends=(
	'git'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=${_pkgname}.install
backup=(
	'etc/prelockd.conf'
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
