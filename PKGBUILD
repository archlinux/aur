# Maintainer: kekmacska

execname=ruston

pkgname=ruston-mail-git
pkgver=0.1.0.r116.4a0b4f5
pkgrel=1
pkgdesc="An unofficial, native, cross-platform Proton Mail desktop client written in Rust"
arch=('any')
url="https://github.com/luiscuellar31/ruston-mail"
license=('MIT')
makedepends=('git' 'rust' 'cargo' 'clang' 'lld')
source=("git+$url.git" "${pkgname%-*}.desktop" "${pkgname%-*}.svg")
b2sums=('SKIP'
        '2a2d02f79e0db80db80930b0362d7a4c743653ee11181a427213745452cc6bfc34d53bff1c3024fb31f039c10ccf49ea38e3fd575be79133fe2c16b0f048ba7b'
        'bba7a0fd138b674695b9a60f4b4f6060fb52cea1435aa12f5c8f2ba57ba54745ea9f5fada4cac25404b7291688c988510747c713521add6a149d37d5134254a0')

pkgver() {
  cd "${pkgname%-*}"

  # 1. Extract base version from Cargo.toml
  local _base_ver
  _base_ver=$(grep '^version =' Cargo.toml | head -1 | cut -d'"' -f2)

  # 2. Get git info
  local _commits
  _commits=$(git rev-list --count HEAD)

  local _hash
  _hash=$(git rev-parse --short HEAD)

  # 3. Combine them: base_version.rcommit_count.githash
  printf "${_base_ver}.r${_commits}.${_hash}"
}

build() {
    cd "${pkgname%-*}"

    # explicitly set clang as the default compiler for c/c++ backends to prevent the infamous linker error
    export CC=clang
    export CXX=clang++
    export RUSTFLAGS="\
        -C opt-level=3 \
        -C target-cpu=native \
        -C embed-bitcode=yes \
        -C codegen-units=1 \
        -C strip=symbols \
        -C relocation-model=pic \
        -C link-arg=-fuse-ld=lld \
        -C link-arg=-Wl,--icf=safe \
        -C link-arg=-Wl,--gc-sections \
        -C link-arg=-Wl,--as-needed \
        -C link-arg=-Wl,-O3 \
        -C link-arg=-fno-plt \
    "

    cargo build --release
}

package() {
    cd "${pkgname%-*}"

    # Install executable
    install -Dm755 "target/release/$execname" "$pkgdir/usr/bin/$execname"

    # Install desktop file
    install -Dm644 "$srcdir/${pkgname%-*}.desktop" "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"

    # Install icon
    install -Dm644 "$srcdir/${pkgname%-*}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-*}.svg"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
}
