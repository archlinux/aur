# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
pkgname=siomon
pkgver=0.1.2
pkgrel=2
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
_tag=50d3aaf788e2a54f33791193080c1297929f65f8 # git rev-parse "v$pkgver"
source=("siomon::git+https://github.com/level1techs/siomon.git#tag=$_tag")
b2sums=('a8e0488ba2302e7b40aed5a54dd1334c1dc2302622129f7307c8474608807e4932b376fb570aaa1df4303514b2c0bbe22d47eb56d0b154078f77f0038025abcf')

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
