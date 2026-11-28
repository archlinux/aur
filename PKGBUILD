# Maintainer: mcp-cpp-sdk maintainers <releases@users.noreply.github.com>
pkgbase=mcp-cpp-sdk
pkgname=('mcp-cpp-sdk' 'mcp-cpp-sdk-static')
pkgver=0.4.0
pkgrel=1
pkgdesc='Model Context Protocol C++ SDK'
arch=('x86_64')
url='https://github.com/yurirocha15/mcp-cpp-sdk'
license=('Apache-2.0')
options=('!debug' 'staticlibs')
depends=('boost>=1.74' 'nlohmann-json>=3.10.5' 'openssl>=3.0')
makedepends=('cmake>=3.20' 'gtest' 'ninja' 'python')
source=("mcp-cpp-sdk-${pkgver}.tar.gz::https://github.com/yurirocha15/mcp-cpp-sdk/releases/download/v0.4.0/mcp-cpp-sdk-0.4.0.tar.gz"
        "mcp-cpp-sdk-${pkgver}.tar.gz.asc::https://github.com/yurirocha15/mcp-cpp-sdk/releases/download/v0.4.0/mcp-cpp-sdk-0.4.0.tar.gz.asc")
sha256sums=('c5f231d7b96b393d6fef82316ecb4199487b6065ec648e4e3844ba0d71cdab77' 'SKIP')
validpgpkeys=('32F4760A898CAA62344F81B078DDAF6A80105366')

prepare() {
  local source_dir="${srcdir}/mcp-cpp-sdk-${pkgver}"
  local key_file="${source_dir}/keys/release-signing-key.asc"
  local status_file="${srcdir}/artifact-signature.status"
  local gnupg_home="${srcdir}/gnupg"
  install -dm700 "${gnupg_home}"
  GNUPGHOME="${gnupg_home}" gpg --batch --no-auto-key-retrieve --no-auto-check-trustdb --import "${key_file}"
  # Trust the pinned key in this keyring, or gpg warns that it is not certified; the status
  # check below still requires a signature by the pinned keys.
  printf '%s:6:\n' '32F4760A898CAA62344F81B078DDAF6A80105366' | GNUPGHOME="${gnupg_home}" gpg --batch --quiet --import-ownertrust
  GNUPGHOME="${gnupg_home}" gpg --batch --no-auto-key-retrieve --status-fd 1 \
    --verify "${srcdir}/mcp-cpp-sdk-${pkgver}.tar.gz.asc" "${srcdir}/mcp-cpp-sdk-${pkgver}.tar.gz" >"${status_file}"
  python -I -S "${source_dir}/release/verify_gnupg_status.py" \
    --status "${status_file}" \
    --signing-fingerprint 'AC02DB2D7C09871E31DB352042C5770080B00549' \
    --primary-fingerprint '32F4760A898CAA62344F81B078DDAF6A80105366'
}

build() {
  # makepkg's lto option emits bytecode-only objects; the static archive needs machine code too.
  CXXFLAGS+=' -ffat-lto-objects'
  cmake -S "mcp-cpp-sdk-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DMCP_CPP_SDK_BUILD_SHARED=ON -DMCP_CPP_SDK_BUILD_STATIC=ON \
    -DBUILD_TESTING=ON -DBUILD_EXAMPLES=OFF -DBUILD_DOCS=OFF
  cmake --build build
  ctest --test-dir build --output-on-failure
}

package_mcp-cpp-sdk() {
  DESTDIR="${pkgdir}" cmake --install build --component Runtime
  DESTDIR="${pkgdir}" cmake --install build --component Development
  rm -f "${pkgdir}/usr/lib/libmcp-cpp-sdk-static.a" \
        "${pkgdir}/usr/lib/pkgconfig/mcp-cpp-sdk-static.pc"
}

package_mcp-cpp-sdk-static() {
  depends=("mcp-cpp-sdk=${pkgver}-${pkgrel}")
  DESTDIR="${pkgdir}" cmake --install build --component StaticDevelopment
}
