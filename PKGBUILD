_pkgbase=kiot
pkgname=kiot-git
pkgver=r37.2d1ad37
pkgrel=1
pkgdesc="A background daemon that exposes information and actions of the KDE
Plasma session to a home automation controller like Home Assistant"
arch=(x86_64)
url="https://github.com/davidedmundson/kiot"
license=(MIT)
depends=(qt6-mqtt)
makedepends=(cmake extra-cmake-modules)
provides=(kiot)
conflicts=(kiot)
source=("git+$url.git" "kiot.service")
md5sums=('SKIP'
	 'b5911f006b47b2e114ca7f05a81d94ae')

pkgver() {
	cd "$srcdir/$_pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgbase"
	local cmake_options=(
		-B build
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_BUILD_TYPE=None
		-Wno-dev
	)
	cmake "${cmake_options[@]}"
	cmake --build build -j$(nproc)
}

package() {
	cd "$srcdir/$_pkgbase"
	DESTDIR="$pkgdir" cmake --install build 
	install -Dm644 "$srcdir"/$_pkgbase.service "$pkgdir"/usr/lib/systemd/user/$_pkgbase.service
}

