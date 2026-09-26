# Maintainer: Jenny Danzmayr <mail@evilscientress.de>

pkgname="inferno-aoip"
pkgver=0.5.4
_tag=04c0efe05aff5e3c90a22160c7f2da24160c3293
pkgrel=1
pkgdesc='Inferno - unofficial implementation of the Dante protocol'
url='https://gitlab.com/lumifaza/inferno'
license=('GPL' 'AGPL')
makedepends=('cargo')
depends=()
optdepends=(
    'statime: a modern PTP daemon for linux written in rust. (preferred)'
    'linuxptp: a older PTP daemon that also works with inferno'
)
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(
    "$pkgname"::"git+${url}.git#tag=$_tag"
    "pipewire-inferno.conf"
    "pipewire-override.conf"
)
b2sums=('d3d55150f2a2875a59cf9509cfb368030ac39aed43d446779939594b8a6bcfd7d71799b4cebfab74fa39db8258f59c306edb22b5812560fb44d054d4f41a1c29'
        '0bcaef1062d4f645c7e8a1120593cac40974fb6c7687ea2b2023368344e4b43cd3606555aa6b31ca3e7aa5e80460457e16af6a09fb22ce30c6fdc64c0f7504ff'
        'e2c9212395c6f7abfc0cb77288baf41fa89d200e5228a64008300f7cca382a714c70d37de8d26d973d0a91c41a1f215ae96f3f31bd956c0e9ec6fb1de232ec72')

prepare() {
    cd "$pkgname"
    git submodule update --init
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"
    cargo build --frozen --release
}

#check() {
#    cd "$pkgname"
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen --all-features
#}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/lib/alsa-lib/" "target/release/libasound_module_pcm_inferno.so"
    for f in "asoundrc" "restart_pw" "start_pipewire_sink" "start_pipewire_source" "stop_pipewire_nodes"; do
        install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname}/" "alsa_pcm_inferno/${f}"
    done
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" inferno_aoip/LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" inferno_aoip/LICENSE-GPL
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" inferno_aoip/LICENSE-AGPL

    cd "$srcdir"
    install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname}/" "pipewire-inferno.conf"
    install -Dm644 "pipewire-override.conf" "$pkgdir/etc/systemd/user/pipewire.service.d/override-inferno.conf"
}
