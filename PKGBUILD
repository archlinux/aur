# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: git
pkgname=sd-boot-helper-git
pkgver=r17.ebc9707
pkgrel=1
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
	for hook in 99-sd-boot-install 50-sd-boot-remove;do
		install -Dm644 "$hook.hook" "$pkgdir/usr/share/libalpm/hooks/$hook.hook"
	done
	for script in install remove;do
		install -Dm755 "sd-boot-$script" "$pkgdir/usr/share/libalpm/scripts/sd-boot-$script"
	done
	install -Dm755 update-sd-boot "$pkgdir/usr/bin/update-sd-boot"
}
