# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>

pkgname=chr
pkgver=1.0.0
pkgrel=1
pkgdesc=" A command-line tool that gives information about Unicode characters "
arch=(x86_64)
url="https://github.com/pemistahl/chr"
license=('Apache-2.0')
depends=(openssl)
makedepends=(cargo)
checkdepends=(cargo)
options=(!debug !lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pemistahl/chr/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('af361023b2bd3ed688fa7ff182774a31')
sha256sums=('a9aaaddeefd92ddff55dbe8123bd40082615a2ae0d5fe0968adefad9f99fe0d5')
b2sums=('9c5a0eeafbb2c6e37b23c8d50930060aa9d298b93675a42f0644645496621d211892d2db451c7d2d80e6e8eec2504e2c422acb327bd444ee88b0818b258cf0e2')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"

prepare() {
    cd "$pkgname-$pkgver"

    # fix openssl build error
    cargo update openssl --precise 0.10.68

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"

    cargo build --frozen --release --all-features --target-dir target
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm 755 -t "${pkgdir}/usr/bin" target/release/chr
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
