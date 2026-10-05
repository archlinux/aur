# Maintainer: Cyridge cyridge@proton.me
# Contributor: Namkhai B. <echo em.roekn.kn | sed s/\\./@/2 | rev>

_pkgname=ananicy-cpp
pkgname=ananicy-cpp-nosystemd
pkgver=1.2.0
pkgrel=1
_stdformat=dfa4fdc87c7cb9bb1683125009baa7278bb85901
pkgdesc="Ananicy rewritten in C++ for much lower CPU and memory usage (without systemd)"
url="https://gitlab.com/ananicy-cpp/ananicy-cpp"
license=(GPL-3.0-only)
arch=(x86_64 i686 aarch64 armv7h)
depends=(fmt spdlog nlohmann-json gcc-libs glibc)
makedepends=(cmake)
optdepends=("cachyos-ananicy-rules: cachyos rules"
	"cachyos-ananicy-rules-git: cachyos rules git")
provides=(ananicy-cpp)
conflicts=(ananicy-cpp)
source=("https://gitlab.com/ananicy-cpp/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz"
        "https://gitlab.com/ananicy-cpp/stl-polyfills/std-format/-/archive/${_stdformat}/std-format-${_stdformat}.tar.gz"
        glibc-2.42-headers.patch)
sha256sums=('d75157b9588748ce6ae04c3e2d71625d8eec6bf2d23e06f8cb6f9687c74813f7'
            'a9a98ba8ff2b3f7e12f2ac75361018a9ba42f9298aa7e8f6bad3613a03591bc0'
            'bc77738a583e9855167c8b78c23d3739d4c2c396f7561ecdd4522c8ed45b5c94')

prepare() {
    cd "${_pkgname}-v${pkgver}"

    rm -rf external/std-format
    mv "../std-format-${_stdformat}" external/std-format

    # upstream 7786652, not in a release yet
    patch -Np1 -i ../glibc-2.42-headers.patch
}

build() {
    cmake -B build -S "${_pkgname}-v${pkgver}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_EXTERNAL_SPDLOG=ON \
        -DUSE_EXTERNAL_JSON=ON \
        -DUSE_EXTERNAL_FMTLIB=ON \
        -DENABLE_SYSTEMD=OFF \
        -DVERSION=${pkgver}
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build --component Runtime
    install -dm755 "$pkgdir/etc/ananicy.d"
}
