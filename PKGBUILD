# Maintainer: Tehoor Marjan <tehoor.marjan@gmail.com>

pkgbase=laser-magic
_pkgname=laser_tool
pkgver=0.1.36
pkgrel=1
pkgdesc="A powerful, open-source tool designed for laser cutting and engraving, written in Rust"
arch=('x86_64')
url="https://lasermagic.ci-yow.com/"
license=('GPL3')
makedepends=('cargo')
source=("https://gitlab.com/MadSquirrels/lasermagic/${_pkgname}/-/archive/v$pkgver/${_pkgname}-v$pkgver.tar.bz2")
sha256sums=('790a619c3c2b83442c7e25e72878a99e721d0997c1d03d63781b907be0402289')

# Define the packages
pkgname=("$pkgbase-cli" "inkscape-$pkgbase")

prepare() {
  cd "${_pkgname}-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}="
  
  # Generate lock files for each crate without --locked
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}="
  cargo build --release --all-features
}

check() {
  cd "${_pkgname}-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}="
  cargo test --all-features
}

package_laser-magic-cli() {
  depends=('gtk3' 'gcc-libs' 'glibc')
  pkgdesc="$pkgdesc - CLI tool"
  
  cd "${_pkgname}-v$pkgver"
  
  # Install binary
  install -Dm755 "target/release/laser-magic-cli" "$pkgdir/usr/bin/laser-magic-cli"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  
  # Install license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_inkscape-laser-magic() {
  depends=('inkscape' 'python')
  pkgdesc="$pkgdesc - Inkscape plugin"
  
  cd "${_pkgname}-v$pkgver"
  
  # Install Inkscape plugins (following the Makefile logic)
  # Create directories
  install -d "$pkgdir/usr/share/inkscape/extensions/lasermagic"
  install -d "$pkgdir/usr/share/inkscape/palettes"
  
  # Update version in the inx files
  VERSION=$(grep -m 1 '^version' lib/Cargo.toml | cut -d '=' -f2 | sed -E 's/.*"(.*).*"/\1/g')
  for inx in plugins/src/*.inx; do
    sed "s/#VERSION#/$VERSION/g" "$inx" > "${inx}.tmp"
    install -Dm644 "${inx}.tmp" "$pkgdir/usr/share/inkscape/extensions/lasermagic/$(basename $inx)"
    rm "${inx}.tmp"
  done
  
  # Copy Python scripts
  for py in plugins/src/*.py; do
    install -Dm755 "$py" "$pkgdir/usr/share/inkscape/extensions/lasermagic/$(basename $py)"
  done
  
  # Copy shared libraries
  install -Dm644 target/release/libliblasermagic.so "$pkgdir/usr/share/inkscape/extensions/lasermagic/"
  
  # Copy palette
  install -Dm644 plugins/src/*.gpl "$pkgdir/usr/share/inkscape/palettes/"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  
  # Install license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
