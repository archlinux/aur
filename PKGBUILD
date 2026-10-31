# Maintainer: ZeroDDS Contributors <admin@zerodds.org>
pkgname=zerodds
pkgver=1.0.0_rc.7
pkgrel=1
pkgdesc="Pure-Rust OMG Data Distribution Service implementation (built from source)"
arch=('x86_64' 'aarch64')
url="https://zerodds.org"
license=('Apache-2.0')
provides=('zerodds')
conflicts=('zerodds-bin')
depends=('glibc' 'gcc-libs')
# clang: bindgen of iceoryx2-pal-posix loads libclang.
makedepends=('rust' 'clang' 'cmake' 'dpkg' 'pkgconf' 'openssl')
# The static libraries of zerodds-dev stay in, as in zerodds-bin.
options=('!lto' '!debug' 'staticlibs')
source=("zerodds-${pkgver}.tar.gz::https://github.com/zero-objects/zero-dds/archive/refs/tags/v1.0.0-rc.7.tar.gz")
sha256sums=('a630791f71b35854a96587fc20f1d347451ae5e0d228dccada82dab18ca3bd7e')
_source_dir=zero-dds-1.0.0-rc.7
_tag_version=1.0.0-rc.7

_unpack_debs() {
    local deb
    for deb in "$1"/*.deb; do
        bsdtar -xOf "$deb" 'data.tar.*' | bsdtar -xpf - -C "${pkgdir}"
    done
}

prepare() {
    cd "${_source_dir}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${_source_dir}"
    # .cargo/config.toml names the cross linker of the release build for
    # aarch64; here the build runs on the target itself.
    export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=cc
    # The command of .github/workflows/publish-deb.yml.
    cargo build --frozen --release --workspace --target "${CARCH}-unknown-linux-gnu" \
        --features zerodds-corba-cosnaming/daemon,zerodds-xrce-agent/daemon
}

package() {
    cd "${_source_dir}"
    bash packaging/linux/deb/assemble-debs.sh --target "${CARCH}-unknown-linux-gnu" \
        --version "${_tag_version}" --out "${srcdir}/debs"
    _unpack_debs "${srcdir}/debs"
}
