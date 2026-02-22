# Maintainer: Pierce Thompson <pierce at insprill dot net>
# Contributor: Mattias Giese <mattias.giese@posteo.net>

pkgname=beammp-server
_pkgname=BeamMP-Server
pkgver=3.9.0
pkgrel=1
pkgdesc='Server for the multiplayer mod BeamMP for BeamNG.drive'
arch=('x86_64' 'aarch64')
url='https://github.com/BeamMP/BeamMP-Server'
license=('AGPL-3.0-only')
# https://github.com/BeamMP/BeamMP-Server/blob/3befc84f00b33e47663bef19cdee9d5e4d325dea/scripts/debian-13/4-install-runtime-deps.sh
depends=('lua53' 'curl')
# https://github.com/BeamMP/BeamMP-Server/blob/3befc84f00b33e47663bef19cdee9d5e4d325dea/scripts/debian-13/1-install-deps.sh
makedepends=('zip' 'unzip' 'tar' 'git' 'gcc' 'cmake' 'make' 'ninja')
provides=($pkgname)
source=(
	"git+https://github.com/BeamMP/${_pkgname}.git#tag=v${pkgver}" 
	'downgrade-sol2.patch'
	'sol2-fix-emplace.patch'
	'beammp-server.service'
	'beammp-server.sysusers'
	'beammp-server.tmpfiles'
)
sha256sums=(
	'SKIP'
	'6ca91a7d420a1df31792f1adcf3e31aed9e353ff6b1645c6ff2fdce154764b03'
	'5c6197d0534317bea578597fdec2d84ca912812eb4c82a00a9184916ae038cdd'
	'd5bd5f83e818c5174f25be79443078cefae5a632a6f72f7915c14e98ef4f98fe'
	'7e8d591152d3de0cea273b6aa212ebafab906f2f76126ff3fac73dd4d31cbfd5'
	'0a8ec12961b98c3447a434b794f9c982b4cc412176087730490d65dbc487f13a'
)

prepare() {
	cd "$srcdir/${_pkgname}"
	git submodule update --init --recursive

	# TODO: Remove when updated
	# The vcpkg version used in the latest release doesn't specify a minimum cmake version,
	# which causes the build to fail.
	# https://github.com/BeamMP/BeamMP-Server/commit/184d50bf8c3c1da58dad8ed63f4d5b2347524ca8
	# https://github.com/BeamMP/BeamMP-Server/commit/eb2deb73c1c1d5c974ab35882de4df28f7ff54cd
	cd vcpkg
	git checkout 5bf0c55239da398b8c6f450818c9e28d36bf9966
	cd ..

	# TODO: Remove when updated
	# Another patch from after the latest release which "fixes" a compile error in sol2 v3.5.0.
	# https://github.com/BeamMP/BeamMP-Server/commit/21874afb872a6bef69e2034d93e4dbc6fedcd74f
	patch -Np1 -i "$srcdir/downgrade-sol2.patch"

	# The two commands below are copied from the configure script.
	# https://github.com/BeamMP/BeamMP-Server/blob/3befc84f00b33e47663bef19cdee9d5e4d325dea/scripts/debian-13/2-configure.sh
	# The `-DCMAKE_TOOLCHAIN_FILE` param is copied from the workflow file.
	# https://github.com/BeamMP/BeamMP-Server/blob/3befc84f00b33e47663bef19cdee9d5e4d325dea/.github/workflows/linux.yml#L61
	./vcpkg/bootstrap-vcpkg.sh
	cmake . -B bin -DCMAKE_TOOLCHAIN_FILE=./vcpkg/scripts/buildsystems/vcpkg.cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-O3 -g -Wl,-z,norelro -Wl,--hash-style=gnu -Wl,-z,noseparate-code -ffunction-sections -fdata-sections -Wl,--gc-sections" -DBeamMP-Server_ENABLE_LTO=ON

	# Patch sol2 to fix compile errors with GCC 15 on the older version we're pinned to.
	# We ignore any errors since it won't apply during a rebuild
	# https://github.com/ThePhD/sol2/commit/d805d027e0a0a7222e936926139f06e23828ce9f
	_deps="$srcdir/${_pkgname}/bin/vcpkg_installed/$([[ $CARCH == x86_64 ]] && echo x64-linux || echo arm64-linux)"
	patch -Np1 -d "$_deps" -i "$srcdir/sol2-fix-emplace.patch" || true
}

build() {
	cd "$srcdir/${_pkgname}"
	# https://github.com/BeamMP/BeamMP-Server/blob/3befc84f00b33e47663bef19cdee9d5e4d325dea/scripts/debian-13/3-build.sh
	cmake --build bin --parallel -t BeamMP-Server
	objcopy --only-keep-debug bin/BeamMP-Server bin/BeamMP-Server.debug
	objcopy --add-gnu-debuglink bin/BeamMP-Server bin/BeamMP-Server.debug
	strip -s bin/BeamMP-Server
}

test() {
	cd "$srcdir/${_pkgname}"
	# https://github.com/BeamMP/BeamMP-Server/blob/3befc84f00b33e47663bef19cdee9d5e4d325dea/.github/workflows/linux.yml#L79
	cmake --build bin --parallel -t BeamMP-Server-tests
	./bin/BeamMP-Server-tests
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm755 "$srcdir/$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
