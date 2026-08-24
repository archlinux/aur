# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Frank J. T. Wojcik <fwojcik@uw.edu>
# Contributor: Reini Urban <rurban@cpan.org>
# Contributor: Austin Appleby <aappleby@google.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname=SMHasher3
pkgname=smhasher3
_pkgver=51d3cd1a # All commits to the main branch after the initial release are a new release.
pkgver=20260804.r2121.51d3cd1
pkgrel=1
pkgdesc="A tool for testing the quality of hash functions in terms of their distribution, collision, and performance properties"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/fwojcik/${pkgname}"
license=('GPL-3.0-or-later')
depends=('libgcc_s.so' 'libstdc++.so')
makedepends=('cmake' 'git')
optdepends=()
backup=()
source=("git+${url}.git#commit=${_pkgver}")
b2sums=('25cc2cc87dd2dae89ef829ac6fe5e97fa754c13b5128eaf7165cd50099b6d1970823560966f0a90c1e6a50a239a8c8092c40ad843f30a2a7c9c99c873c83107b')

# https://gitlab.com/fwojcik/smhasher3#current-status
# "There won't be explicit release versioning. Instead, the version string has been updated to include the commit date of the last commit."
pkgver() {
	cd "${pkgname}"
	printf "%s.r%s.%s" \
		"$(TZ=UTC0 git log --max-count=1 --format=%cd --date=format-local:%Y%m%d)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${pkgname}"
	cmake -B build --install-prefix=/usr
	cmake --build build --parallel
}

package() {
	cd "${pkgname}"
	install --mode=755 -D --target-directory="${pkgdir}/usr/bin" build/SMHasher3
	install --mode=644 -D --target-directory="${pkgdir}/usr/share/doc/${pkgname}" README.md
	install --mode=644 -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
