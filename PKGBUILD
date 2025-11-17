# Maintainer: Tehoor Marjan <tehoor.marjan@gmail.com>
# Maintainer: Link Mauve <linkmauve@linkmauve.fr>

pkgbase=laser-magic-git
_pkgname=laser_tool
pkgver=v0.1.36.r0.056c2a5
pkgrel=1
pkgdesc="A powerful, open-source tool designed for laser cutting and engraving, written in Rust. Development version."
arch=('x86_64' 'aarch64')
url="https://lasermagic.ci-yow.com/"
license=('GPL3')
makedepends=('cargo' 'git')
source=("git+https://gitlab.com/MadSquirrels/lasermagic/$_pkgname.git")
sha256sums=('SKIP')

# Define the packages
pkgname=('laser-magic-cli-git' 'inkscape-laser-magic-git')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$_pkgname"
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir="

  # Generate lock files for each crate without --locked
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname"
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir="
  cargo build --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir="
  cargo test --all-features
}

package_laser-magic-cli-git() {
  depends=('gtk3' 'gcc-libs' 'glibc')
  provides=('laser-magic-cli')
  conflicts=('laser-magic-cli')
  pkgdesc="$pkgdesc - CLI tool"

  cd "$_pkgname"

  # Install binary
  install -Dm755 target/release/laser-magic-cli "$pkgdir"/usr/bin/laser-magic-cli

  # Install documentation
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG.md

  # Install license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_inkscape-laser-magic-git() {
  depends=('inkscape' 'python')
  pkgdesc="$pkgdesc - Inkscape plugin"
  provides=('inkscape-laser-magic')
  conflicts=('inkscape-laser-magic')

  cd "$_pkgname"

  # Install Inkscape plugins (following the Makefile logic)
  # Create directories
  install -d "$pkgdir"/usr/share/inkscape/extensions/lasermagic
  install -d "$pkgdir"/usr/share/inkscape/palettes

  # Update version in the inx files
  VERSION=$(grep -m 1 '^version' lib/Cargo.toml | cut -d '=' -f2 | sed -E 's/.*"(.*).*"/\1/g')
  for inx in plugins/src/*.inx; do
    sed "s/#VERSION#/$VERSION/g" "$inx" > "$inx.tmp"
    install -Dm644 "$inx.tmp" "$pkgdir"/usr/share/inkscape/extensions/lasermagic/$(basename $inx)
    rm "$inx.tmp"
  done

  # Copy Python scripts
  for py in plugins/src/*.py; do
    install -Dm755 "$py" "$pkgdir"/usr/share/inkscape/extensions/lasermagic/$(basename $py)
  done

  # Copy shared libraries
  install -Dm644 target/release/libliblasermagic.so "$pkgdir"/usr/share/inkscape/extensions/lasermagic/

  # Copy palette
  install -Dm644 plugins/src/*.gpl "$pkgdir"/usr/share/inkscape/palettes/

  # Install documentation
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG.md

  # Install license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
