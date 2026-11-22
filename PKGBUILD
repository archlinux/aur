# Maintainer: Lukas "DerGeneralFluff" Lichten <lichtenrider@hotmail.de>
_reponame=BeamMP-Launcher
_vcpkg_version=2026.10.16
# Why use a fixed version instead of git? Because it is a giant repo,
# and updates way too often slowing system updates down when it really isn't needed.

pkgname=beammp-launcher-git
pkgver=r612.92f41b6
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
        'ad12c58820c0dcb7395e7b720234054bb9ca6e935548f324a291989d0ec044b1efcf28b3671ab336ff3d43b905afccc45ba58d74e97945a7f21e1fca2b6aa118')

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
