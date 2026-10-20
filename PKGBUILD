# Maintainer: kekmacska

execname=isai

pkgname=isai-studio-pro-git
pkgver=0.0.1.r28.eeb7666
pkgrel=1
pkgdesc="An unofficial, native, cross-platform Proton Mail desktop client written in Rust"
arch=('any')
url="https://github.com/DhineshKrishnan1206/isai-studio-pro"
license=('GPL-3.0')
depends=(qt6-base qt6-declarative libxcb alsa-lib)
makedepends=('git' 'rust' 'cargo' 'clang' 'lld' 'imagemagick' 'oxipng')
source=("git+$url.git" "$execname.desktop")
b2sums=('SKIP'
        '9eb0f5158c9aae2b8480c3eab0e9ec7fe7d6cb6406f1bc269c14da2e05193fc70e7bf6d567fdcccd207132f986b5ea419b211b2dde5944c9b25d85f8b306a305')

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

prepare() {
  cd "${pkgname%-*}"

  magick crates/app/assets/brand/source/isai-studio-pro.png \
        -resize 256x256 \
        -gravity center \
        -background none \
        -extent 256x256 \
        crates/app/assets/brand/source/isai-studio-pro-256.png

  oxipng -o max -r -p -s -v -t "$(nproc)" -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 crates/app/assets/brand/source/isai-studio-pro-256.png
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

    cargo build --release || printf "\x1b[38;2;213;0;50mYou might need to update your system's LLVM and Rust version to match:\nsudo pacman -Syu cargo rustup llvm clang && rustup update\x1b[0m\n"
}

check() {
  cd "${pkgname%-*}"
  cargo test
}

package() {
    cd "${pkgname%-*}"

    # Install executable
    install -Dm755 "target/release/$execname" "$pkgdir/usr/bin/$execname"

    # Install desktop file
    install -Dm644 "$srcdir/$execname.desktop" "$pkgdir/usr/share/applications/$execname.desktop"

    # Install icon
    install -Dm644 "$srcdir/${pkgname%-*}/crates/app/assets/brand/source/${pkgname%-*}-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$execname.png"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$execname/LICENSE"
}
