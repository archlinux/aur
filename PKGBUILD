# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Frank J. T. Wojcik <fwojcik@uw.edu>
# Contributor: Reini Urban <rurban@cpan.org>
# Contributor: Austin Appleby <aappleby@google.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname=SMHasher3
pkgname=smhasher3
_pkgver=6ab43433 # All commits to the main branch after the initial release are a new release.
pkgver=20260326.r2118.6ab4343
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
b2sums=('310e7b08c97ad79fbc940aac9f76bd041cd192f7a85702569ba54b349df2f6e1c085e8e0d9c53dceacd117e5a8015019c6c36b226e3da601e1e375b1593bfccf')

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
