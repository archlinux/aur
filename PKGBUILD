# Maintainer: Namkhai B. <echo bmFta2hhaS5uM0Bwcm90b25tYWlsLmNvbQo= | base64 -d>

_pkgname=ananicy-cpp
pkgname=ananicy-cpp-nosystemd
_pkgver=1.0.0-rc5
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
url="https://gitlab.com/ananicy-cpp/ananicy-cpp/"
license=(GPLv3)
source=(
	"https://gitlab.com/ananicy-cpp/${_pkgname}/-/archive/v${_pkgver}/${_pkgname}-v${_pkgver}.tar.gz"
	)
md5sums=('6d8caf9cb384e053df54d795102beb1d')
arch=(x86_64 i386 armv7h)
depends=(fmt spdlog nlohmann-json)
makedepends=(cmake git)
optdepends=("ananicy-rules-git: community rules")

prepare() {
	cd "$_pkgname-v${_pkgver}"

	mkdir -p build
	cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_EXTERNAL_SPDLOG=ON \
		-DUSE_EXTERNAL_JSON=ON \
		-DUSE_EXTERNAL_FMTLIB=ON \
		-DENABLE_SYSTEMD=OFF \
		-DVERSION=${_pkgver}
}

build() {
	cd "$_pkgname-v${_pkgver}/build"

	cmake --build .
}

package() {
	cd "$_pkgname-v${_pkgver}/build"

	export DESTDIR="$pkgdir"
	cmake --install .

	install -m755 -d "$pkgdir/etc/ananicy.d"
}
