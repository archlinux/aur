# Maintainer: Mike Kazantsev <mk.fraggod@gmail.com>

pkgname=telegram-tdlib-purple-git
pkgver=0.8.1.r518.1cc2a5d
pkgrel=2
pkgdesc='libpurple/pidgin Telegram plugin implemented using official tdlib client library'
arch=(x86_64 aarch64)
url='https://github.com/BenWiederhake/tdlib-purple'
license=(GPL2 LGPL2.1 custom:FTL custom:PIX custom:RPD custom:SKIA custom:STB)
depends=(libtgvoip libpng libpurple libwebp)
makedepends=(cmake git gperf)
conflicts=(telegram-tdlib-purple)
provides=(telegram-tdlib-purple="${pkgver}")
source=( $pkgname::git+"$url" td::git+https://github.com/tdlib/td.git )
sha256sums=( SKIP SKIP )

pkgver() {
	cd $pkgname
	ver=$(awk '/^\s*set\(VERSION / {sub(")","",$2); print $2}' CMakeLists.txt)
	[[ -n "$ver" ]] || { echo >&2 "ERROR: Failed to parse version from CMakeLists.txt"; exit 1; }
	printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname

	# build_and_install.sh is the proper way to build this, with the right tdlib version/commit
	# But it needs a bunch of tweaks for this build, so not used here, only grepped for that commit
	td_commit=( $(grep -Po '(?<=git checkout )\S+' build_and_install.sh ||:) )
	[[ ${#td_commit[@]} -eq 1 ]] || {
		echo >&2 "ERROR: failed to grep compatible libtd commit in build_and_install.sh script"; exit 1; }
	td_commit=${td_commit[0]} td_dir="$(realpath "$srcdir")"/td

	# Build specific tdlib version - can be long, use "makepkg -e" to avoid rebuilding from scratch
	pushd "$td_dir"
		[[ $(git rev-parse "$td_commit") = $(git rev-parse HEAD) ]] || git reset --hard "$td_commit"
		mkdir -p build && pushd build
			cmake -DCMAKE_BUILD_TYPE=Release ..
			make
			make install DESTDIR=destdir
	popd; popd

	# Build and statically link libtelegram-tdlib.so against tdlib above
	mkdir -p build && pushd build
	cmake \
		-DTd_DIR="$td_dir"/build/destdir/usr/local/lib/cmake/Td/ \
		-Dtgvoip_INCLUDE_DIRS=/usr/include/tgvoip ..
	make
	popd
}

package() {
	cd $pkgname
	install -Dm755 -t "$pkgdir$(pkg-config --variable plugindir purple)" build/libtelegram-tdlib.so
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" rlottie/licenses/*
}
