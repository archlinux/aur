# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=vmaware-git
_pkgname=VMAware
pkgver=2.8.0.r8.g3ddef56
pkgrel=1
pkgdesc='Advanced VM detection library and tool'
url='https://github.com/NotRequiem/VMAware'
arch=('x86_64')  # Upstream's supposedly compatible with other architectures but this is untested so for now it's x86_64 only
depends=(
	glibc
	libgcc
	libstdc++
)
makedepends=(git cmake)
conflicts=('vmaware')
provides=('vmaware')
license=('MIT')

source=("git+$url")
b2sums=('SKIP')

build() {
	local cmake_options=(
		-B build
		-S $_pkgname
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)

	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir/" cmake --install build

	install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
