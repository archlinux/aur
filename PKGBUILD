# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=devcontainer-cli
_npm_namespace="@devcontainers"
_npm_name="cli"
pkgver=0.26.1
pkgrel=1
pkgdesc="Dev container CLI, which can take a devcontainer.json and create and configure a dev container from it."
arch=("any")
url="https://github.com/devcontainers/cli"
license=("MIT")
depends=("nodejs")
makedepends=("npm" "jq")
optdepends=()
source=("https://registry.npmjs.org/${_npm_namespace}/${_npm_name}/-/${_npm_name}-${pkgver}.tgz")
sha256sums=('b0b6b3a276c10c1f149b16a3ae312ea11e8addaff5fe45680323355506295078')
noextract=("${_npm_name}-${pkgver}.tgz")

package() {
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
