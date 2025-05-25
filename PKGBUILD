# Maintainer: Jenny Danzmayr <mail@evilscientress.de>

pkgname="inferno-aoip"
pkgver=0.4.0
_tag=1f548b2f8dbe1bba4358e5cb056b22862d6c3040
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
b2sums=(
    'e3ba165c11580ff8d15c974fe9ea66ef882ce56a37586996f1e02b5096888ba4c24fa65d01b3875dc3c61a83c64f42de3815835107bfe672d605e3728ad5b124'
    'd640a3aa396b3ff3becd2ba7564ac7654b0ef0b678b4e628fde9c690a847a9a6dc62f2f42995c8c18730caa7c5471b0cdd6f8e78791df06753ffc80c6ebf5f12'
    'e2c9212395c6f7abfc0cb77288baf41fa89d200e5228a64008300f7cca382a714c70d37de8d26d973d0a91c41a1f215ae96f3f31bd956c0e9ec6fb1de232ec72'
)

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
    cargo build --frozen --release --all-features
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
