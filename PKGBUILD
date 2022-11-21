# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

pkgname=ananicy-cpp
_pkgver=1.0.1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
url="https://gitlab.com/ananicy-cpp/ananicy-cpp/"
license=(GPLv3)
source=(
	"https://gitlab.com/ananicy-cpp/${pkgname}/-/archive/v${_pkgver}/${pkgname}-v${_pkgver}.tar.gz"
	)
md5sums=('e0107e820c42b17ae774a0c695780902'
         'e1f9d6bf78380b04a6a500a671bd8d38')


declare -g -A externals
externals['std-format']="dfa4fdc87c7cb9bb1683125009baa7278bb85901"

for external in "${!externals[@]}"; do
	source+=(https://gitlab.com/vnepogodin/${external}/-/archive/${externals[$external]}/${external}-${externals[$external]}.tar.gz)
done

arch=(x86_64 i386 armv7h x86_64_v3 aarch64 pentium4)
depends=(fmt spdlog nlohmann-json systemd libelf zlib libbpf)
makedepends=(cmake clang git nlohmann-json bpf)
optdepends=("ananicy-rules-git: community rules"
            "ananicy-rules: rules for ananicy-cpp")

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
		-DUSE_BPF_PROC_IMPL=ON \
		-DBPF_BUILD_LIBBPF=OFF \
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
