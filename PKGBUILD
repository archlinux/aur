pkgname=legio-launcher-git
pkgver=0.2.2.r200.g2f22782
pkgrel=1
epoch=1
pkgdesc='Legio desktop game launcher (development sources)'
arch=('x86_64')
url='https://github.com/fraa2a/Legio'
license=('LicenseRef-SA-NC-PD-1.0')
depends=('glibc' 'gcc-libs' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'libarchive' 'librsvg' 'xdotool' 'umu-launcher' 'xdg-utils' 'desktop-file-utils')
makedepends=('git' 'rust>=1.98.1' 'nodejs>=22' 'pnpm' 'python' 'pkgconf')
provides=('legio-launcher')
conflicts=('legio-launcher')
# GCC LTO objects from bundled C libraries cannot be linked by Rust's LLD.
options=('!lto')
source=('legio::git+https://github.com/fraa2a/Legio.git#branch=main' 'legio-launcher')
sha256sums=('SKIP' 'e4749475518da35cf046c273c7802802d263f3018760c565c262cc838b9361df')

pkgver() {
  cd "$srcdir/legio"
  local version
  version=$(python -c 'import tomllib; print(tomllib.load(open("src-tauri/Cargo.toml", "rb"))["package"]["version"].replace("-", "."))')
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/legio"
  export CARGO_TARGET_DIR="$srcdir/target"
  pnpm install --frozen-lockfile
  pnpm tauri build --no-bundle --config '{"build":{"beforeBuildCommand":"pnpm build"},"bundle":{"createUpdaterArtifacts":false}}'
}

package() {
  cd "$srcdir/legio"
  install -Dm755 "$srcdir/target/release/legio" "$pkgdir/usr/lib/legio/legio"
  install -Dm755 "$srcdir/legio-launcher" "$pkgdir/usr/bin/legio-launcher"
  install -Dm644 packaging/aur/legio-launcher.desktop "$pkgdir/usr/share/applications/legio-launcher.desktop"
  install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/pixmaps/legio-launcher.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
  install -Dm644 src/assets/fonts/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/Inter-OFL.txt"
  install -Dm644 _meta/licenses/glow-icons.txt "$pkgdir/usr/share/licenses/$pkgname/glow-icons.txt"
  install -Dm644 src-tauri/vendor/flexsearch.LICENSE "$pkgdir/usr/share/licenses/$pkgname/flexsearch.LICENSE"
}
