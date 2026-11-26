# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=devcontainer-cli
_npm_namespace="@devcontainers"
_npm_name="cli"
pkgver=0.91.0
pkgrel=1
pkgdesc="Dev container CLI, which can take a devcontainer.json and create and configure a dev container from it."
arch=("any")
url="https://github.com/devcontainers/cli"
license=("MIT")
depends=("nodejs")
makedepends=("npm" "jq")
optdepends=()
source=("https://registry.npmjs.org/${_npm_namespace}/${_npm_name}/-/${_npm_name}-${pkgver}.tgz")
sha256sums=('d83e2291a799818ea8abfba634f0bb699f05a8df21376feefb07bb631844f41f')
noextract=("${_npm_name}-${pkgver}.tgz")

package() {
	install -dm 644 -t "${srcdir}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/

	npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_npm_name}-${pkgver}.tgz"

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
	find "${pkgdir}" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="${pkgdir}/usr/lib/node_modules/${_npm_namespace}/${_npm_name}/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
	mv "${tmppackage}" "${pkgjson}"
	chmod 644 "${pkgjson}"
}

