# Maintainer: Mike Kazantsev <mk.fraggod@gmail.com>

pkgname=telegram-tdlib-purple-minimal-git
pkgver=0.7.9.r496.80a9163
pkgrel=3
pkgdesc='libpurple Telegram plugin implemented using official tdlib client library, packaged for bitlbee, without voip and image-processing dependencies. Needs TD_API_ID and TD_API_HASH env vars to be set for makepkg.'
arch=(x86_64 aarch64)
url='https://github.com/ars3niy/tdlib-purple'
license=(GPL2)
depends=(libpurple telegram-tdlib)
makedepends=(cmake git)
conflicts=(telegram-tdlib-purple)
provides=(telegram-tdlib-purple="${pkgver}")
source=($pkgname::git+"$url")
sha256sums=(SKIP)

pkgver() {
	cd $pkgname
	ver=$(awk '/^\s*set\(VERSION / {sub(")","",$2); print $2}' CMakeLists.txt)
	[[ -n "$ver" ]] || { echo >&2 "ERROR: Failed to parse version from CMakeLists.txt"; exit 1; }
	printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	mkdir -p build
	cd build

	cmake_opts=()
	if [[ -n "$TD_API_ID" && -n "$TD_API_HASH" ]]
	then cmake_opts+=( -DAPI_ID="$TD_API_ID" -DAPI_HASH="$TD_API_HASH" )
	else
		echo >&2 "WARNING: --------------------"
		echo >&2 "WARNING: tdlib-purple will be built with default/testing API_ID and API_HASH credentials."
		echo >&2 "WARNING: This can cause 400 (API_ID_PUBLISHED_FLOOD) error on login when using it."
		echo >&2 "WARNING: Set/export TD_API_ID and TD_API_HASH env vars to use custom (working) values there."
		echo >&2 "WARNING: Check https://core.telegram.org/api/obtaining_api_id URL for how to easily get those."
		echo >&2 "WARNING: --------------------"
	fi

	cmake -DNoWebp=True -DNoLottie=True -DNoVoip=True "${cmake_opts[@]}" ..
	make
}

package() {
	cd $pkgname
	install -Dm755 -t "$pkgdir$(pkg-config --variable plugindir purple)" build/libtelegram-tdlib.so
}
