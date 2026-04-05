# Maintainer: bananasjim <bananasjim1@gmail.com>
pkgname=padctl-git
pkgver=r0.unknown
pkgrel=1
pkgdesc="HID gamepad daemon — declarative TOML device config, uinput output"
arch=('x86_64' 'aarch64')
url="https://github.com/BANANASJIM/padctl"
license=('LGPL-2.1-or-later')
depends=('libusb' 'systemd-libs' 'gcc-libs' 'glibc')
makedepends=('zig>=0.15' 'git')
provides=('padctl')
conflicts=('padctl' 'padctl-bin')

_zig_toml_hash="toml-0.3.0-bV14Be6EAQDr0fkyURz4jYFyTAMPcwlNN0FEPVjDnXTR"

source=("git+${url}.git"
        "zig-toml::https://github.com/sam701/zig-toml/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd padctl
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Seed zig package cache so the build works offline
    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-cache"
    mkdir -p "${ZIG_GLOBAL_CACHE_DIR}/p"
    ln -sfn "${srcdir}/zig-toml-main" "${ZIG_GLOBAL_CACHE_DIR}/p/${_zig_toml_hash}"
}

build() {
    cd padctl
    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-cache"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd padctl
    ./zig-out/bin/padctl install --destdir "$pkgdir" --prefix /usr

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
