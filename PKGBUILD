# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=edirstat-git
_pkgname=edirstat
pkgver=1.1.0.r149.ge051df8
pkgrel=1
pkgdesc="A fast, cross-platform disk usage analyzer with work-stealing multithreading, zero-copy snapshots, deduplication, and an interactive treemap GUI. (Development Git Version)"
arch=('x86_64')
url="https://github.com/Xangelix/edirstat"
license=('MIT')
provides=('edirstat')
conflicts=('edirstat')

depends=('glibc' 'gcc-libs' 'libxkbcommon' 'fontconfig' 'hicolor-icon-theme')

optdepends=(
  'wayland: For running natively on Wayland compositors'
  'libx11: For running on traditional X11/Xorg desktops'
)

makedepends=('cargo-nightly' 'rust-nightly' 'git')

# Disables makepkg's system-level C-LTO (which injects -flto into CFLAGS). 
# This prevents compiler mismatches (e.g. GCC GIMPLE vs LLVM Bitcode) when linking 
# compiled C dependencies like blake3 and mimalloc.
# This option does NOT affect the Rust-level ThinLTO defined in Cargo.toml.
options=(!lto)

source=(
  "${_pkgname}::git+${url}.git"
  "${_pkgname}.desktop"
)
sha512sums=('SKIP'
            '5cbf9075b721335159eb3317cd3f787ac406fa7c398a2dea114870d362688f67809bbaaede155d8e1ad3a2830c35132ae37a02e24d9dabd60326b2b7e66a02b3')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Generates a standard Arch VCS version string based on tags and commit distance
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Dynamically queries the host system's target tuple to fetch exactly what is required,
  # keeping the build locked to the lockfile's definitions.
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$_pkgname"
  # Explicitly defining the target directory prevents Cargo from utilizing any
  # globally configured CARGO_TARGET_DIR environment overrides.
  export CARGO_TARGET_DIR=target
  # Compiles without the default 'online' feature to remove networked dependencies (reqwest/semver)
  cargo build --release --frozen --no-default-features
}

check() {
  cd "$srcdir/$_pkgname"
  export CARGO_TARGET_DIR=target
  # Running tests without --release ensures assertions, integer overflow checks, 
  # and debug_assert!() macro evaluations are fully active during the verification.
  cargo test --frozen
}

package() {
  cd "$srcdir/$_pkgname"

  # Install the compiled binary
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"

  # Install the license file
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # Install documentation
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"

  # Install raster PNG icons across standard sizes for fallback compatibility
  local size
  for size in 16 32 48 64 128 256 512; do
    install -Dm 644 "assets/img/icon_${size}x.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
  done

  # Install the scalable SVG icon as a modern High-DPI/scalable option
  install -Dm 644 "assets/img/icon-transparent.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

  # Install the .desktop file
  install -Dm 644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
