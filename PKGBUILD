# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# shellcheck disable=SC2001,SC2016,SC2034,SC2154 shell=bash

_pkgname=pikaur-static
pkgname="${_pkgname}"
pkgver=1.33.1
pkgrel=1
pkgdesc='AUR helper without dependencies which asks all questions before installing/building. Static build for recovery situations, similar to `pacman-static`'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/actionless/pikaur"
license=('GPL-3.0-only')
source=(
	"$pkgname-$pkgver.tar.gz"::${url}/archive/"$pkgver".tar.gz
)
b2sums=('a74408b7368499426cd1c5c124686689fe91e9c5a1c2e71716c62d9b752a1b562cb5e01576397b21f10200bf7c565a879de796493c30be0f2f93fd79590232e7')
depends=(
	'git'
)
makedepends=(
	'nuitka'
	'python-ordered-set'
	'ccache'
	'fish'
	'python-markdown-it-py'
	'python-pysocks'
	'python-defusedxml'
)
optdepends=(
	'devtools: for Arch Pkgs support in -G/--getpkgbuild operation'
	'pacman-contrib: to use in pacman hook/systemd timer for cleaning up pikaur cache'
)
conflicts=("${_pkgname}-git")
provides=("$_pkgname")
changelog="CHANGELOG"
options=('!buildflags' '!strip')

build() {
	cd "${srcdir}/pikaur-${pkgver}" || exit 2
	sed -i -e "s/^VERSION[: ].*=.*/VERSION = '${pkgver}'/g" pikaur/config.py
	make standalone
}

package() {
	cd "${srcdir}/pikaur-${pkgver}" || exit 2
	install -Dm644 "${srcdir}/pikaur-${pkgver}/packaging/usr/lib/systemd/user/pikaur-cache.service" \
					"${pkgdir}/usr/lib/systemd/user/${_pkgname}-cache.service"
	install -Dm644 "${srcdir}/pikaur-${pkgver}/packaging/usr/lib/systemd/user/pikaur-cache.timer" \
					"${pkgdir}/usr/lib/systemd/user/${_pkgname}-cache.timer"
	for langmo in $(cd ./locale && ls ./*.mo); do
		lang=$(sed -e 's/.mo$//' <<< "${langmo}")
		install -Dm644 "locale/${langmo}" "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/${_pkgname}.mo"
	done
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 pikaur.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	install -Dm755 "${srcdir}/pikaur-${pkgver}/pikaur_static/pikaur-standalone" "${pkgdir}/usr/bin/${_pkgname}"
}
