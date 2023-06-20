# Maintainer: Integral <integral@murena.io>
# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=daed-git
_pkgname=${pkgname%-git}
pkgver=0.1.0rc.r9.g1a54ab7
pkgrel=2
pkgdesc="A modern dashboard for dae, bundled with dae-wing (backend API server) and dae (core)."
arch=('x86_64')
url="https://github.com/daeuniverse/daed"
license=('AGPL' 'MIT')
makedepends=('git' 'pnpm' 'clang' 'go')
provides=('daed')
conflicts=('daed')
source=("git+https://github.com/daeuniverse/${_pkgname}.git")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
	cd "$srcdir/$_pkgname"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule update --init --recursive
}

build() {
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	export CFLAGS="-fno-stack-protector"
	cd "$srcdir/$_pkgname"
	make VERSION="unstable-$pkgver"
}

package() {
	depends=(
		v2ray-geoip
		v2ray-domain-list-community
	)

	cd "$srcdir/$_pkgname"

	install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
	install -vDm644 "install/${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
	install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -d "${pkgdir}/etc/daed/"

	mkdir -p "${pkgdir}/usr/share/daed"
	ln -vs "/usr/share/v2ray/geoip.dat" "${pkgdir}/usr/share/daed/geoip.dat"
	ln -vs "/usr/share/v2ray/geosite.dat" "${pkgdir}/usr/share/daed/geosite.dat"

	echo "After installation completed, open your browser and navigate to http://localhost:2023"
}
