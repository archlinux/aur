# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Frank J. T. Wojcik <fwojcik@uw.edu>
# Contributor: Reini Urban <rurban@cpan.org>
# Contributor: Austin Appleby <aappleby@google.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname=SMHasher3
pkgname=smhasher3
_pkgver=release # The initial release
pkgver=20251015.r2100.5035a92
pkgrel=1
pkgdesc="A tool for testing the quality of hash functions in terms of their distribution, collision, and performance properties"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/fwojcik/${pkgname}"
license=('GPL-3.0-or-later')
depends=('libgcc_s.so' 'libstdc++.so')
makedepends=('cmake' 'git')
optdepends=()
backup=()
source=(
	"git+${url}.git#tag=${_pkgver}"
	"support_cmake4.patch::${url}/-/commit/6ab4343396fbe0f7a1c7ac4f01d0eb9acffe4202.patch"
)
b2sums=(
	'ae97ff6ec16c7e7081b29f7fefcb6c2670d4a1cb4fade97b254999c9e8551c52ae37b8574669f2d7bbc630b8418be81e58d8237036b55133fde3414efe9395df'
	'8545d4555a704f2b61064bdbf90eea1d0709a24d31eb0ff0727a1c1cd6befcf1f1fa534b2fc3ce4ea2e543368c50ed6c90f73c740c8be4a4670bfe3c070df462'
)

prepare() {
	patch --verbose --directory "${pkgbase}" --strip 1 --ignore-whitespace --input "${srcdir}/support_cmake4.patch" --unified
}

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
