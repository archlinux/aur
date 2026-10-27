# Maintainer: kekmacska

execname=ruston

pkgname=ruston-mail-git
pkgver=0.8.0.r640.7c466f5
pkgrel=1
pkgdesc="An unofficial, native, cross-platform Proton Mail desktop client written in Rust"
arch=('x86_64')
url="https://github.com/luiscuellar31/ruston-mail"
license=('MIT')
makedepends=('git' 'rust' 'cargo' 'clang' 'lld' 'oxipng')
source=("git+$url.git")
b2sums=('SKIP')

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
    oxipng -o max -r -p -s -v -t $(nproc) -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 assets/icons/hicolor/256x256
}

build() {
    cd "${pkgname%-*}"

    # explicitly set clang as the default compiler for c/c++ backends to prevent the infamous linker error
    export CC=clang
    export CXX=clang++
    export RUSTFLAGS="\
        -C opt-level=3 \
        -C target-cpu=x86-64-v4 \
        -C embed-bitcode=no \
        -C codegen-units=1 \
        -C lto=no \
        -C strip=symbols \
        -C relocation-model=pic \
        -C link-arg=-fuse-ld=lld \
        -C link-arg=-Wl,--icf=safe \
        -C link-arg=-Wl,--gc-sections \
        -C link-arg=-Wl,--as-needed \
        -C link-arg=-fno-plt \
    "

    cargo build --release
}

package() {
    cd "${pkgname%-*}"

    # Install executable
    install -Dm755 "target/release/$execname" "$pkgdir/usr/bin/$execname"

    # Install desktop file
    install -Dm644 "packaging/linux/com.luiscuellar.ruston-mail.desktop" "$pkgdir/usr/share/applications/com.luiscuellar.ruston-mail.desktop"

    # Install icon
    install -Dm644 "assets/icons/hicolor/256x256/apps/com.luiscuellar.ruston-mail.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.luiscuellar.ruston-mail.png"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
}
