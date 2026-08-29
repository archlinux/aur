# Maintainer: NidoBr <nidobrcontato@gmail.com>

pkgname=haur-git
pkgver=r100.f4aad88
pkgrel=1
pkgdesc="A minimal, modular, and hook-based AUR helper written in Tcl"
arch=('any')
url="https://codeberg.org/NidoBr/haur"
license=('GPL2')

# Core dependencies required for haur to run
depends=(
	'tcl'
	'tcllib'
	'curl'
	'git'
	'pacman'
)

# Optional dependencies for advanced features
optdepends=(
	'devtools: for clean chroot building support'
	'bash-completion: for CLI autocompletion'
)

makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://codeberg.org/NidoBr/haur.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	if git describe --long --tags >/dev/null 2>&1; then
		git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

package() {
	cd "${pkgname%-git}"

	# Base directories
	install -d "${pkgdir}/usr/lib/haur"
	install -d "${pkgdir}/etc/haur"
	install -d "${pkgdir}/usr/bin"

	# Application core files
	cp -a core "${pkgdir}/usr/lib/haur/"
	install -Dm755 haur.tcl "${pkgdir}/usr/lib/haur/haur.tcl"

	# Configuration and Hooks
	cp -a hooks.d "${pkgdir}/etc/haur/"

	# Executable symlink
	ln -s /usr/lib/haur/haur.tcl "${pkgdir}/usr/bin/haur"

	install -Dm644 haur.bash-completion "${pkgdir}/usr/share/bash-completion/completions/haur"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/haur/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
