# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

pkgname=ananicy-cpp
_pkgver=1.0.0-rc7
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
url="https://gitlab.com/ananicy-cpp/ananicy-cpp/"
license=(GPLv3)
source=(
	"https://gitlab.com/ananicy-cpp/${pkgname}/-/archive/v${_pkgver}/${pkgname}-v${_pkgver}.tar.gz"
	)
md5sums=('fb921722da05102093ca86beb0998ee7'
         'e3654b522fb829dcad2818ff7b8de8e9')


declare -g -A externals
externals['std-format']="45296602ad78a804411e7c3b617e13759f38e4e7"

for external in "${!externals[@]}"; do
	source+=(https://gitlab.com/ananicy-cpp/stl-polyfills/${external}/-/archive/${externals[$external]}/${external}-${externals[$external]}.tar.gz)
done

arch=(x86_64 i386 armv7h x86_64_v3 aarch64 pentium4)
depends=(fmt spdlog nlohmann-json systemd)
makedepends=(cmake git)
optdepends=("ananicy-rules-git: community rules")

prepare() {
	cd "$pkgname-v${_pkgver}"

	echo Externals: "${!externals[@]}"
	for external in "${!externals[@]}"; do
		mv -v "../${external}-${externals[$external]}/"* external/${external}/
	done

	cmake -B build -S . \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_EXTERNAL_SPDLOG=ON \
		-DUSE_EXTERNAL_JSON=ON \
		-DUSE_EXTERNAL_FMTLIB=ON \
		-DENABLE_SYSTEMD=ON \
		-DVERSION=${_pkgver}
}

build() {
	cd "$pkgname-v${_pkgver}"

	cmake --build build
}

package() {
	cd "$pkgname-v${_pkgver}"

	export DESTDIR="$pkgdir"
	cmake --install build --component Runtime

	install -m755 -d "$pkgdir/etc/ananicy.d"
}
