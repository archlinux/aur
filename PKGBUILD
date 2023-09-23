# Maintainer: Mike Kazantsev <mk.fraggod@gmail.com>

pkgname=telegram-tdlib-purple-minimal-git
pkgver=0.8.1.r518.1cc2a5d
pkgrel=1
pkgdesc='libpurple/pidgin Telegram plugin implemented using official tdlib client library, packaged for bitlbee, without voip and image-processing dependencies'
arch=(x86_64 aarch64)
url='https://github.com/BenWiederhake/tdlib-purple'
license=(GPL2)
depends=(libpurple)
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

prepare() {
	cd $pkgname
	# build_and_install.sh is the proper way to build this, with the right tdlib version/commit
	# But cloning td repo from scratch every time gets old fast, so replaced with proper $srcdir clone here
	script=build_and_install.sh td_checkout="$(realpath "$srcdir")"/td
	sed -i \
		-e 's|^\( *\)git clone https://github.com/tdlib/td.git *$|\1'"ln -s '$td_checkout' td|" \
		-e 's|^\( *\)sudo make install *$|\1true|' "$script"
	grep -q "'$td_checkout'" "$script" && grep -qv '^ *sudo ' "$script" || {
		echo >&2 "ERROR: failed to patch git-clone/sudo in build_and_install.sh script"; exit 1; }

	# Extra parameters for a minimal build
	sed -i 's|^\( *cmake .* -DNoVoip=True\)\( ..\) *$|\1 -DNoWebp=True -DNoLottie=True\2|' "$script"
	grep -q 'cmake .* -DNoWebp=True -DNoLottie=True ..' "$script" || {
		echo >&2 "ERROR: failed to patch cmake opts in build_and_install.sh script"; exit 1; }
}

build() {
	cd $pkgname
	rm -rf build "$srcdir"/td/build # script will fail on repeated runs otherwise
	./build_and_install.sh
}

package() {
	cd $pkgname
	install -Dm755 -t "$pkgdir$(pkg-config --variable plugindir purple)" build/libtelegram-tdlib.so
}
