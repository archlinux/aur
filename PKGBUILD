# Maintainer: bananasjim <bananasjim1@gmail.com>
pkgname=padctl-git
pkgver=r629.gf910518
pkgrel=1
pkgdesc="HID gamepad daemon — declarative TOML device config, uinput output"
arch=('x86_64' 'aarch64')
url="https://github.com/BANANASJIM/padctl"
license=('LGPL-2.1-or-later')
depends=('libusb' 'systemd' 'gcc-libs' 'glibc')
makedepends=('git')
provides=('padctl')
conflicts=('padctl' 'padctl-bin')

_zig_version="0.15.2"
_zig_toml_rev="24e0deeceaad1b7f1b12027ebae1c65ff1d86e33"
_zig_toml_hash="toml-0.3.0-bV14BVqIAQANb68hDuVPZ72hrcIhT-fv_fcIbetQIAyg"

source=("git+${url}.git"
        "zig-toml::https://github.com/sam701/zig-toml/archive/${_zig_toml_rev}.tar.gz")
source_x86_64=("zig-${_zig_version}-x86_64-linux.tar.xz::https://ziglang.org/download/${_zig_version}/zig-x86_64-linux-${_zig_version}.tar.xz")
source_aarch64=("zig-${_zig_version}-aarch64-linux.tar.xz::https://ziglang.org/download/${_zig_version}/zig-aarch64-linux-${_zig_version}.tar.xz")
sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('02aa270f183da276e5b5920b1dac44a63f1a49e55050ebde3aecc9eb82f93239')
sha256sums_aarch64=('958ed7d1e00d0ea76590d27666efbf7a932281b3d7ba0c6b01b0ff26498f667f')

pkgver() {
    cd padctl
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Seed zig package cache so the build works offline
    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-cache"
    mkdir -p "${ZIG_GLOBAL_CACHE_DIR}/p"
    local _toml_src
    _toml_src="$(find "${srcdir}" -maxdepth 1 -type d -name 'zig-toml-*' | head -n1)"
    [ -n "${_toml_src}" ] || {
        echo "zig-toml source directory not found" >&2
        return 1
    }
    ln -sfn "${_toml_src}" "${ZIG_GLOBAL_CACHE_DIR}/p/${_zig_toml_hash}"
}

build() {
    cd padctl
    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-cache"
    local _zig_arch
    case "${CARCH}" in
        x86_64) _zig_arch="x86_64-linux" ;;
        aarch64) _zig_arch="aarch64-linux" ;;
        *) echo "unsupported architecture: ${CARCH}" >&2; return 1 ;;
    esac
    "${srcdir}/zig-${_zig_arch}-${_zig_version}/zig" build -Doptimize=ReleaseSafe
}

package() {
    cd padctl
    ./zig-out/bin/padctl install --destdir "$pkgdir" --prefix /usr --no-user-service

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
