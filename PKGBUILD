# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: git
pkgname=sd-boot-helper-git
pkgver=r9.f7c82c5
pkgrel=2
pkgdesc="Add/Update/Remove sd-boot entries automatically"
arch=(any)
url="https://github.com/ahmubashshir/sd-boot-helper"
license=('GPL')
depends=('base')
makedepends=('git')
source=(
	"sd-boot-helper::git+https://github.com/ahmubashshir/sd-boot-helper.git"
)
backup=(
	'etc/default/sd-boot'
)
sha256sums=('SKIP')

pkgver()
{
	cd "$srcdir/sd-boot-helper"
	( set -o pipefail
		git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$srcdir/sd-boot-helper"
	install -Dm644 sd-boot.default "$pkgdir/etc/default/sd-boot"
	install -Dm644 99-sd-boot.hook "$pkgdir/usr/share/libalpm/hooks/99-sd-boot.hook"
	install -Dm755 sd-boot "$pkgdir/usr/share/libalpm/scripts/sd-boot"
	install -Dm755 update-sd-boot "$pkgdir/usr/bin/update-sd-boot"
}
