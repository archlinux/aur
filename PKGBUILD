pkgname=v6emul-git
pkgver=1.0.0.r41.g664bca4
pkgrel=1
pkgdesc="Command-line emulator for the Vector-06C Soviet PC. Git version"
arch=('x86_64')
url="https://github.com/parallelno/v6emul"
license=('MIT')
depends=('glibc' 'gcc-libs' 'luajit')
makedepends=('cmake' 'git' 'nlohmann-json')
provides=('v6emul')
conflicts=('v6emul')
options=('!debug')
# system-deps.patch replaces the FetchContent builds of nlohmann/json and LuaJIT
# with the system packages.
# build-fixes.patch fixes two upstream build failures on current Arch: a missing
# <climits> include for PATH_MAX, and an implicit json -> std::string_view
# conversion that nlohmann/json dropped after the 3.11.3 pinned by upstream.
# Re-check that both still apply on every upstream bump.
source=("${pkgname}::git+${url}.git"
        "system-deps.patch"
        "build-fixes.patch")
sha256sums=('SKIP'
            'b0e0b6d831af83177309b55a40bcb0fd970ecea8fa0641f81f122e74d2a2e9ec'
            '3828e3069ff2bfa6b07ce9fb798a68ffd365b31d3024d2ff0148a89571602dd6')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  patch -Np1 -i "${srcdir}/system-deps.patch"
  patch -Np1 -i "${srcdir}/build-fixes.patch"
}

build() {
  export V6EMUL_VERSION="${pkgver}"
  cmake -S "${pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  install -Dm755 build/app/v6emul "${pkgdir}/usr/bin/v6emul"

  cd "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/v6emul/boot/" res/boot/*
  install -Dm644 -t "${pkgdir}/usr/share/v6emul/fdd/" res/fdd/*
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
