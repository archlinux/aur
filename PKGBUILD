# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
pkgname=siomon
pkgver=0.2.0
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
_tag=70508291db88b1b20e2155ab61cf9a781210bbee # git rev-parse "v$pkgver"
source=("siomon::git+https://github.com/level1techs/siomon.git#tag=$_tag")
b2sums=('b162a62028e6549ce476cb603bd2633a6888b361a81f5fa32478e934369de6e6306496118e5c1287fea3aeda042a39790a284159fea413ce136f2f0814ce649b')

prepare() {
    cd "$srcdir/$pkgname"
    # workaround for inconsistent lock file
    rm Cargo.lock
    export RUSTUP_TOOLCHAIN=stable
    #cargo fetch --locked --target host-tuple
    cargo fetch --target host-tuple
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
