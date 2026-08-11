# Maintainer: Harsh Sharma <harsh@codelif.in>
pkgname=whatevr-git
_pkgname=whatevr
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Native WhatsApp client for Linux (whatevrd daemon + whatkevr Qt/Kirigami frontend)"
arch=('x86_64' 'aarch64')
url="https://github.com/codelif/whatevr"
license=('BSD-3-Clause')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools'
         'kcoreaddons' 'kdbusaddons' 'ki18n' 'kirigami' 'prison' 'qqc2-desktop-style' 'kirigami-addons'
         'rlottie' 'sqlite' 'glibc'
         'desktop-file-utils' 'shared-mime-info' 'xdg-utils')
makedepends=('git' 'go' 'gcc' 'just' 'cmake' 'ninja' 'extra-cmake-modules' 'vulkan-headers')
provides=('whatevr' 'whatevrd' 'whatkevr')
conflicts=('whatevr' 'whatevr-bin')
install="$_pkgname.install"
source=("$_pkgname::git+https://github.com/codelif/whatevr.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	# 0.1.0.r5.gabc1234  — from the most recent v* tag, or 0.0.0 if untagged.
	git describe --long --tags --abbrev=7 2>/dev/null \
		| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
		|| printf "0.0.0.r%s.g%s" \
			"$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	just build-release
}

package() {
	cd "$srcdir/$_pkgname"
	just install /usr "$pkgdir"
	install -Dm644 "$srcdir/$_pkgname/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
