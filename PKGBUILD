# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=edirstat-git
_pkgname=edirstat
pkgver=1.1.0.r23.g33f7d83
pkgrel=1
pkgdesc="A fast, cross-platform disk usage analyzer with work-stealing multithreading, zero-copy snapshots, deduplication, and an interactive treemap GUI. (Development Git Version)"
arch=('x86_64')
url="https://github.com/Xangelix/edirstat"
license=('MIT')
provides=('edirstat')
conflicts=('edirstat')
makedepends=('cargo-nightly' 'rust-nightly' 'git')
source=(
  "${_pkgname}::git+${url}.git"
  "${_pkgname}.desktop"
)
sha512sums=('SKIP'
            '5cbf9075b721335159eb3317cd3f787ac406fa7c398a2dea114870d362688f67809bbaaede155d8e1ad3a2830c35132ae37a02e24d9dabd60326b2b7e66a02b3')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Generates a version string based on tags, commits since tag, and current hash.
  # Strips any leading 'v' to match Arch versioning standards.
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release --frozen
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$_pkgname"

  # Install the binary
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"

  # Install the documentation
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"

  # Install the raster PNG icons for standard desktop sizes
  local size
  for size in 16 32 48 64 128 256 512; do
    install -Dm 644 "assets/img/icon_${size}x.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
  done

  # Install the scalable SVG vector icon as a high-DPI fallback
  install -Dm 644 "assets/img/icon-transparent.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

  # Install the .desktop file
  install -Dm 644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
