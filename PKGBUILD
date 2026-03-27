# Maintainer: Level1Techs Package Team <level1techspackageteam@gmail.com>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>
pkgname=siomon
pkgver=0.2.3
pkgrel=1
pkgdesc="Hardware information and real-time sensor monitoring tool"
arch=(x86_64 aarch64)
url="https://github.com/level1techs/siomon"
license=('MIT')
depends=('glibc'
         'libgcc')
optdepends=('nvidia-utils: GPU name, VRAM, clocks, temp, power, utilization'
            'dmidecode: Per-DIMM memory details'
            'msr-tools: CPU TDP, turbo ratios, C-states, perf limiters'
            'i2c-tools: SPD/XMP memory timing data'
            'hddtemp: SATA drive temperatures via hwmon')
makedepends=('git'
             'cargo')
options=()
_tag=5b345e9e1c0ae3676eab98d8da66238fa0fdd63f # git rev-parse "v$pkgver"
source=("siomon::git+https://github.com/level1techs/siomon.git#tag=$_tag")
b2sums=('fc28304202ed8f84d38f84ff3e3b62bfa500fa8601a7b25736802bcdd2020478f5468db26892e3c724781e76834c4a675068f758d7e8ac8d7a4a077c7846f5e0')

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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
