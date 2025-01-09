# Maintainer: Lukas "DerGeneralFluff" Lichten <lichtenrider@hotmail.de>
_reponame=BeamMP-Launcher
_vcpkg_version=2024.12.16
# Why use a fixed version instead of git? Because it is a giant repo,
# and updates way too often slowing system updates down when it really isn't needed.

pkgname=beammp-launcher-git
pkgver=r457.c22ea1e
pkgrel=1
pkgdesc="Multiplayer Launcher/Client for BeamMP, providing multiplayer for BeamNG.drive"
arch=('x86_64')
url='https://github.com/BeamMP/BeamMP-Launcher'
license=('AGPL-3.0')
depends=()
makedepends=('vcpkg' 'cmake' 'git')
provides=("beammp-launcher")
conflicts=("beammp-launcher")
source=("git+https://github.com/BeamMP/BeamMP-Launcher"
        "https://github.com/microsoft/vcpkg/archive/refs/tags/${_vcpkg_version}.tar.gz")
b2sums=('SKIP'
        'ea33199c37661c88eb054630f54877d742b6434cc44eed2cb20e0b8a14d66fc9eb4726f3281dff4595a9bd813bc497e314a8906663bb8c53dfb1d6da4faa7f5c')

pkgver() {
	cd "$srcdir/${_reponame}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_reponame}"
	git submodule update --init --recursive
}

build() {
	export VCPKG_ROOT="$srcdir/vcpkg-${_vcpkg_version}"

	cd "$srcdir/${_reponame}"
	cmake -DCMAKE_BUILD_TYPE=Release . -B bin -DCMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake" -DVCPKG_TARGET_TRIPLET=x64-linux

	# cd "$srcdir/${_reponame}/bin"
	cmake --build bin --parallel --config Release
	# make
}

package() {
	install -Dm755 "$srcdir/${_reponame}/bin/BeamMP-Launcher" "$pkgdir/usr/bin/BeamMP-Launcher"
}
