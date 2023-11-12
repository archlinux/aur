# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Gore Liu <goreliu@126.com>

_pkgname=docker-systemctl-replacement
pkgname=$_pkgname-git
pkgver=v1.5.7106.r6.gb18d67e
pkgrel=1

pkgdesc="docker systemctl replacement - allows to deploy to systemd-controlled containers without starting an actual systemd daemon"
url='https://github.com/gdraheim/docker-systemctl-replacement'
arch=('any')
license=('EUPL-1.2')

depends=('python')
makedepends=("git")

source=("https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/EUPL-LICENSE.md"
	"${_pkgname}::git+https://github.com/gdraheim/docker-systemctl-replacement")
b2sums=('7c81e385a62dbee1326de1004377b5dabc4ed795542e5f09dd3d4a381ae25992a36cae90c86a2c785b84a56db807836a70afd49ae9f5f499d601cb72f18074ac'
	'SKIP')

pkgver() {
	cd "$_pkgname"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "files/docker/systemctl3.py" "${pkgdir}/usr/bin/systemctl.py"

	# Install LICENSE file
	install -Dm 644 EUPL-LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
