# Maintainer: taotieren <admin@taotieren.com>

pkgbase=luatos-cli-git
pkgname=(luatos-cli-git luatos-mcp-git luatos-log-ffi-git)
pkgver=1.11.0.r0.g22a8f95
pkgrel=1
pkgdesc="LuatOS command-line toolset (pure Rust)-brushing, logging, project management, firmware resources and builds"
arch=($CARCH)
url="https://github.com/wendal/luatos-cli"
license=('MIT')
depends=(
    glibc
    libbz2.so
    libgcc_s.so
    liblzma.so
    systemd-libs
)
makedepends=(
    git
    rust
    pkgconf
)
optdepends=(
    "ch343ser-dkms"
    "libftdi: A library to talk to FTDI chips"
)
backup=()
options=('!lto')
install=
source=("${pkgbase}::git+${url}.git"
        luatos-cli.install
        luatos-mcp.install
        luatos-log-ffi.install)
sha256sums=('SKIP'
            '028878803a8de1324da183486e04457b413417d6af7396f86deae87929232904'
            '62097f257e96bb89ba585211451b6df9d168f96842289d757a190c34465b9ac7'
            '6c38d27bc0d64be9576a0189ab750fb762205622886ed35725d177a4f6f4526d')

pkgver() {
    cd "${srcdir}/${pkgbase}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgbase}" clean -dfx
    cd "${srcdir}/${pkgbase}/"
    cargo update -w
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgbase}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --all-features
    # cargo build --release --all-features -p luatos-cli
}

# check() {
#     cd "${srcdir}/${pkgbase}/"

#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features
# }

package_luatos-cli-git() {
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    replaces=()
    install=${pkgname%-git}.install
    cd "${srcdir}/${pkgbase}/"

    export RUSTUP_TOOLCHAIN=stable
    install -Dm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -rv docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin/"
}

package_luatos-mcp-git() {
    pkgdesc="LuatOS MCP server - exposes flash/log/project tools to AI agents over stdio"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    replaces=()
    depends+=(
        luatos-cli
    )
    install=${pkgname%-git}.install
    cd "${srcdir}/${pkgbase}/"

    install -Dm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin/"
}

package_luatos-log-ffi-git() {
    pkgdesc="C ABI export of luatos-log SOC binary log decoder (Air1601/CCM4211)"
    provides=(libluatos_log_ffi.so)
    conflicts=(libluatos_log_ffi.so)
    replaces=()
    depends=(
        glibc
        libgcc_s.so
    )
    install=${pkgname%-git}.install
    cd "${srcdir}/${pkgbase}/"

    export RUSTUP_TOOLCHAIN=stable
    install -vDm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

    install -vDm0755 "target/release/libluatos_log_ffi.so" -t "${pkgdir}/usr/lib/"
    install -vDm0644 "crates/luatos-log-ffi/include/luatos_log.h" -t "${pkgdir}/usr/include/"

    install -vDm0644 /dev/stdin "${pkgdir}/usr/lib/pkgconfig/${pkgname%-git}.pc" <<EOF
prefix=/usr
exec_prefix=\${prefix}
libdir=\${prefix}/lib
includedir=\${prefix}/include

Name: ${pkgname%-git}
Description: ${pkgdesc}
Version: ${pkgver%%.r*}
URL: ${url}
Libs: -L\${libdir} -lluatos_log_ffi
Cflags: -I\${includedir}
EOF

    install -vDm0644 /dev/stdin "${pkgdir}/usr/lib/cmake/${pkgname%-git}/${pkgname%-git}Config.cmake" <<EOF
# ${pkgname%-git}Config.cmake -- CMake package configuration
#
# Imported target:
#   ${pkgname%-git}::${pkgname%-git}      shared library, C ABI
#
# Usage:
#   find_package(${pkgname%-git} REQUIRED)
#   target_link_libraries(my_app PRIVATE ${pkgname%-git}::${pkgname%-git})
#
# Decoded symbols: luatos_soclog_analyze(), pySoclogAnalyze() (alias),
#                  luatos_soclog_version()

get_filename_component(_luatos_log_ffi_dir "\${CMAKE_CURRENT_LIST_FILE}" DIRECTORY)
get_filename_component(_luatos_log_ffi_prefix "\${_luatos_log_ffi_dir}/../../.." ABSOLUTE)

if(NOT TARGET ${pkgname%-git}::${pkgname%-git})
  add_library(${pkgname%-git}::${pkgname%-git} SHARED IMPORTED)
  set_target_properties(${pkgname%-git}::${pkgname%-git} PROPERTIES
    IMPORTED_LOCATION "\${_luatos_log_ffi_prefix}/lib/libluatos_log_ffi.so"
    INTERFACE_INCLUDE_DIRECTORIES "\${_luatos_log_ffi_prefix}/include"
  )
endif()

set(${pkgname%-git}_FOUND TRUE)
set(${pkgname%-git}_VERSION "${pkgver%%.r*}")
set(${pkgname%-git}_INCLUDE_DIRS "\${_luatos_log_ffi_prefix}/include")
set(${pkgname%-git}_LIBRARIES "\${_luatos_log_ffi_prefix}/lib/libluatos_log_ffi.so")
EOF

    install -vDm0644 /dev/stdin "${pkgdir}/usr/lib/cmake/${pkgname%-git}/${pkgname%-git}ConfigVersion.cmake" <<EOF
set(PACKAGE_VERSION "${pkgver%%.r*}")

if(PACKAGE_VERSION VERSION_LESS PACKAGE_FIND_VERSION)
  set(PACKAGE_VERSION_COMPATIBLE FALSE)
else()
  set(PACKAGE_VERSION_COMPATIBLE TRUE)
  if(PACKAGE_FIND_VERSION VERSION_EQUAL PACKAGE_VERSION)
    set(PACKAGE_VERSION_EXACT TRUE)
  endif()
endif()
EOF
}
