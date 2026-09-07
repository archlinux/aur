# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>

_pkgname=elasticsearch-head

pkgname=${_pkgname}-git
pkgver=5.0.0.r32.g2d51fec
pkgrel=3
pkgdesc="A web front end for an elastic search cluster"
arch=('any')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
url="https://github.com/mobz/${_pkgname}"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('git' 'npm')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "${_pkgname}"
	npm install --cache "${srcdir}/npm-cache" --global --prefix "${pkgdir}/usr"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}


# vim:set ts=2 sw=2 et:
