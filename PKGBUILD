# Maintainer: Eikano <lcuoin@gmail.com>

_pkgname="daed"
pkgname="${_pkgname}-edge-git"
pkgver=v0.4.0rc1.r488.187.684
pkgrel=1
pkgdesc="A modern dashboard for dae, bundled with latest dae-wing (backend API server) and dae (core)."
arch=('x86_64' 'aarch64')
url="https://github.com/daeuniverse/daed"
license=('AGPL-3.0-or-later AND MIT')
makedepends=('git' 'pnpm' 'clang' 'go')
provides=('daed')
conflicts=('daed' 'daed-git')
source=("git+https://github.com/daeuniverse/${_pkgname}.git"
        "git+https://github.com/daeuniverse/dae-wing.git"
        "git+https://github.com/daeuniverse/dae.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
install="${_pkgname}.install"
options=(!debug)

pkgver() {
	cd "$srcdir/$_pkgname"
	(
		set -o pipefail
		daed_version=$(git describe --tags --abbrev=0 2>/dev/null)
        	daed_count=$(git rev-list --count HEAD)
        	cd wing
        	wing_count=$(git rev-list --count HEAD)
        	cd dae-core
        	dae_count=$(git rev-list --count HEAD)
		printf "%s.r%s.%s.%s" "${daed_version}" "${daed_count}" "${wing_count}" "${dae_count}"
	)
}

prepare() {
	cd "$srcdir/$_pkgname"
        git remote update
	git submodule update --init --recursive
        cd wing
	git reset --hard origin/main
        cd dae-core 
        git reset --hard origin/main
        git submodule update --init --recursive
        cd .. && go mod tidy
}

build() {
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	export CFLAGS="-fno-stack-protector"
	cd "$srcdir/$_pkgname"
        daed_commit=$(git rev-parse --short HEAD) && cd wing
        wing_commit=$(git rev-parse --short HEAD) && cd dae-core
        dae_core_commit=$(git rev-parse --short HEAD)
        package_version="$daed_commit.$wing_commit.$dae_core_commit"
	cd "$srcdir/$_pkgname"
	make VERSION="unstable-$package_version"
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
