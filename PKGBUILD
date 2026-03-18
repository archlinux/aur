# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
pkgname=siomon
pkgver=0.2.2
pkgrel=1
pkgdesc="Hardware information and real-time sensor monitoring tool"
arch=(any)
url="https://github.com/level1techs/siomon"
license=('MIT')
optdepends=('nvidia-utils: GPU name, VRAM, clocks, temp, power, utilization'
            'dmidecode: Per-DIMM memory details'
            'msr-tools: CPU TDP, turbo ratios, C-states, perf limiters'
            'i2c-tools: SPD/XMP memory timing data'
            'hddtemp: SATA drive temperatures via hwmon')
makedepends=('git'
             'cargo')
options=()
_tag=2f0b399085de511ff14d8a8a2b69c71f7a40558c # git rev-parse "v$pkgver"
source=("siomon::git+https://github.com/level1techs/siomon.git#tag=$_tag")
b2sums=('745141ab3c7a789c271ffa4ed55fab1555ed312c3c2067b32be6b38cf03e0166bbb8aaebcff9957f9eff53dd2fccb91806df53a483752fcd66ce973af72d85a9')

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$srcdir/$pkgname"
    # no-op, cargo install builds for us
}

check() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable 
    cargo install --no-track --frozen --all-features --root "$pkgdir/usr/" --path .
}
