# Maintainer: r3f <r3flector@pm.me>
#
# This package is built from upstream master HEAD.
# Because pkgver is computed at build time, paru/yay in normal mode WILL NOT notice new
# commits to master and will not offer updates. To receive fresh builds, enable devel mode:
#   paru -Syu --devel               (one-shot)
# or in ~/.config/paru/paru.conf:
#   [bin]
#   Devel = true                    (persistent)
# yay equivalent: `yay -Syu --devel`.
#
# Tip: rebuilding this package frequently? Install `sccache` and add to
# ~/.cargo/config.toml:
#   [build]
#   rustc-wrapper = "/usr/bin/sccache"

pkgname=rtk-git
_srcname=rtk
pkgver=0.39.0.r0.g2fbc751
pkgrel=1
pkgdesc="Rust Token Killer - high-performance CLI proxy to minimize LLM token consumption"
arch=('x86_64' 'aarch64')
url='https://github.com/rtk-ai/rtk'
license=('MIT')
depends=(
    'gcc-libs'
)
makedepends=(
    'cargo'
    'git'
)
provides=("rtk=${pkgver}")
conflicts=('rtk')
options=('!lto')
source=("${_srcname}::git+https://github.com/rtk-ai/rtk.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"
    local tag rev count
    if tag=$(git describe --long --tags --match 'v[0-9]*' --abbrev=7 2>/dev/null); then
        echo "${tag}" | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
    else
        count=$(git rev-list --count HEAD)
        rev=$(git rev-parse --short=7 HEAD)
        printf '0.r%s.g%s' "$count" "$rev"
    fi
}

prepare() {
    cd "${srcdir}/${_srcname}"
    export CARGO_HOME="${srcdir}/cargo-home"
    cargo fetch --locked
}

build() {
    cd "${srcdir}/${_srcname}"
    export CARGO_TARGET_DIR="${srcdir}/target"
    export CARGO_HOME="${srcdir}/cargo-home"
    export RUSTFLAGS="-C opt-level=3 --remap-path-prefix=${srcdir}=/build"
    cargo build --release --frozen
}

package() {
    cd "${srcdir}/${_srcname}"

    install -Dm755 "${srcdir}/target/release/rtk" \
        "${pkgdir}/usr/bin/rtk"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
