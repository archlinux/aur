# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=TermOx
pkgname=termox
pkgver=2.0.0
pkgrel=1
pkgdesc="C++20 Terminal User Interface(TUI) Library."
arch=('x86_64')
url="https://github.com/a-n-t-h-o-n-y/TermOx"
license=('MIT')
depends=('icu')
makedepends=('cmake')
source=(
    "${url}/archive/v$pkgver.tar.gz"
    "https://github.com/a-n-t-h-o-n-y/zzz/archive/9d7c047f47c81a95a5ea824075253618356593a2.tar.gz"
    "https://github.com/a-n-t-h-o-n-y/Escape/archive/f797e8194b531663f01873f43007d2439fa89276.tar.gz"
    "https://github.com/a-n-t-h-o-n-y/signals-light/archive/5b873d0aa515a2085138359e69746cd7d7a5362f.tar.gz"
)
sha256sums=(
    'b2143b870183fede6086773b628e32e0af9f692927fd740490087d5583b8dd10'
    'c6a4863e8b5703de07e5b65b9d4a18309a6a52b85c015b7f326f697c4d01d5df'
    '8656c767fb43d7b5e57a04235bdf27b6907e88a6f100ad53b9a0fb1aa296541c'
    'c993af6f8d5b9af200b159a7d7b981b89cdb206a9a2ed17c2d6652a8612f52cb'
)

prepare() {
    cd "$_pkgname-$pkgver"
    cmake -S . -B build \
      -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
      -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
      "-DFETCHCONTENT_SOURCE_DIR_ZZZ=$srcdir/zzz-9d7c047f47c81a95a5ea824075253618356593a2" \
      "-DFETCHCONTENT_SOURCE_DIR_ESCAPE=$srcdir/Escape-f797e8194b531663f01873f43007d2439fa89276" \
      "-DFETCHCONTENT_SOURCE_DIR_SIGNALS-LIGHT=$srcdir/signals-light-5b873d0aa515a2085138359e69746cd7d7a5362f"
}

build() {
    cd "$_pkgname-$pkgver"
    cmake --build build
}

check() {
    cd "$_pkgname-$pkgver"
    # tests are EXCLUDE_FROM_ALL; no default test target
}

package() {
    cd "$_pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/include"
    cp -r include/ox "$pkgdir/usr/include/"
    install -Dm644 build/libTermOx.a -t "$pkgdir/usr/lib"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set softtabstop=4 shiftwidth=4 expandtab:
