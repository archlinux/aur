# Maintainer: Mike Kazantsev <mk.fraggod@gmail.com>

pkgname=telegram-tdlib-purple-minimal-git
pkgver=0.8.1.r523.d220fa8
pkgrel=2
pkgdesc='libpurple/pidgin Telegram plugin implemented using official tdlib client library, packaged for bitlbee, without voip and image-processing dependencies'
arch=(x86_64 aarch64)
url='https://github.com/BenWiederhake/tdlib-purple/'
license=(GPL2)
depends=(libpurple)
makedepends=(cmake git gperf)
conflicts=(telegram-tdlib-purple)
provides=(telegram-tdlib-purple="${pkgver}")
source=(
	"$pkgname"::git+"$url"
	td::git+https://github.com/tdlib/td.git
	0001.dont-drop-calls-for-other-apps.patch )
b2sums=( SKIP SKIP SKIP )

pkgver() {
	cd $pkgname
	ver=$(awk '/^\s*set\(VERSION / {sub(")","",$2); print $2}' CMakeLists.txt)
	[[ -n "$ver" ]] || { echo >&2 "ERROR: Failed to parse version from CMakeLists.txt"; exit 1; }
	printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $pkgname
	git submodule init
	git config submodule.td.url "$srcdir/td"
	git -c protocol.file.allow=always submodule update

	# Disables dropping incoming voice calls with "calls are not supported"
	# So that those can be potentially picked-up on another device, like a phone
	p=0001.dont-drop-calls-for-other-apps.patch
	patch --dry-run -tNp1 -i "$srcdir"/$p && patch -tNp1 -i "$srcdir"/$p \
		|| { echo >&2 "ERROR: patch failed - $p"; exit 1; }
}

build() {
	cd $pkgname

	# Build specific tdlib version - can be long, use "makepkg -e" to avoid rebuilding from scratch
	pushd td
		mkdir -p build && pushd build
			cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release ..
			make
			make install DESTDIR=destdir
	popd; popd

	# Build and statically link libtelegram-tdlib.so against tdlib above
	mkdir -p build && pushd build
	cmake \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-DTd_DIR="$(realpath ../td)"/build/destdir/usr/local/lib/cmake/Td/ \
		-DNoVoip=True -DNoWebp=True -DNoLottie=True ..
	make
	popd
}

package() {
	cd $pkgname
	install -Dm755 -t "$pkgdir$(pkg-config --variable plugindir purple)" build/libtelegram-tdlib.so
}
