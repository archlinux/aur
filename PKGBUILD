# Maintainer: Lukas "DerGeneralFluff" Lichten <lichtenrider@hotmail.de>
_reponame=BeamMP-Launcher
pkgname=beammp-launcher-git
pkgver=r435.811fe41
pkgrel=1
pkgdesc="Multiplayer Launcher/Client for BeamMP, providing multiplayer for BeamNG.drive"
arch=('x86_64')
url='https://github.com/BeamMP/BeamMP-Launcher'
# Project is being relicensed into AGPL, but this has not finished yet
license=('proprietary')
# license=('AGPL-3.0')
depends=()
makedepends=('vcpkg' 'cmake' 'git')
provides=("beammp-launcher")
conflicts=("beammp-launcher")
source=("git+https://github.com/BeamMP/BeamMP-Launcher"
        "git+https://github.com/microsoft/vcpkg")
b2sums=('SKIP'
        'SKIP')

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
	export VCPKG_ROOT="$srcdir/vcpkg"
	vcpkg install --downloads-root="$srcdir/cache" --vcpkg-root="$VCPKG_ROOT" --binarysource=clear zlib nlohmann-json openssl cpp-httplib[openssl]
	cd "$srcdir/${_reponame}"
	cmake -DCMAKE_BUILD_TYPE=Release . -B bin -DCMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake" -DVCPKG_TARGET_TRIPLET=x64-linux

	# cd "$srcdir/${_reponame}/bin"
	cmake --build bin --parallel --config Release
	# make
}

package() {
	install -Dm755 "$srcdir/${_reponame}/bin/BeamMP-Launcher" "$pkgdir/usr/bin/BeamMP-Launcher"
}
