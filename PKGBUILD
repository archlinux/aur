# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
pkgname=siomon
pkgver=0.1.3
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
_tag=3d8a0a62fe69e0c348e94bd1d00010bbb69ac053 # git rev-parse "v$pkgver"
source=("siomon::git+https://github.com/level1techs/siomon.git#tag=$_tag")
b2sums=('59e74e032b294ea7bed3fad7dc104cb50169cef9e1e582417de03c0501b1d970ab6992338b53042b5e6b36f089c7681a23c25bca989636d6bbdc77b9dff59bb1')

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
