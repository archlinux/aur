# Maintainer: LIghtJUNction
pkgname=zcall-gui
pkgver=0.1.6
pkgrel=1
pkgdesc='Native Project Z control panel for the zcalld local AI gateway'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcall-gui'
license=('MIT')
optdepends=('xorg-xwayland: run on Wayland sessions' 'noto-fonts-cjk: Chinese and Japanese glyphs')
depends=('zcalld>=0.2.0' 'glibc' 'libgcc' 'libx11' 'libgl' 'freetype2' 'fontconfig' 'curl' 'hicolor-icon-theme')
# Cargo enforces rust-version; Arch rustup provides rust without a package version.
makedepends=('rust' 'pkgconf')
# Rust retains its own thin LTO; keep native C objects compatible with the linker.
options=('!lto')
source=("$pkgname-v$pkgver-source.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-source.tar.gz")
sha256sums=('e54822ffaf1681f311e7f54e3042c014e7f36bfa49defd4274cc545ba71c298c')

prepare() {
  cd "$srcdir/$pkgname-v$pkgver"

  # The verified release archive includes the exact library source, but its
  # development manifest names Git. Use only that bundled source for AUR.
  local staged=Cargo.toml.aur
  awk '
    function fail(message) {
      print "Bundled zgpui: " message > "/dev/stderr"
      failed = 1
      exit 1
    }
    function quoted(line, parts) {
      split(line, parts, "\"")
      return parts[2]
    }
    function finish_package() {
      if (name == "zgpui") {
        if (++locked != 1 || names != 1 || versions != 1 || sources != 1)
          fail("ambiguous lock entry")
        locked_version = version
        locked_source = source
      }
      name = version = source = ""
      names = versions = sources = 0
    }
    FILENAME == ARGV[1] {
      if ($0 ~ /^\[/) package_section = ($0 == "[package]")
      if (package_section && $0 ~ /^name[ \t]*=[ \t]*"[^"]+"[ \t]*$/) {
        if (++library_names != 1 || quoted($0) != "zgpui") fail("unexpected library name")
      }
      if (package_section && $0 ~ /^version[ \t]*=[ \t]*"[0-9]+\.[0-9]+\.[0-9]+"[ \t]*$/) {
        if (++library_versions != 1) fail("ambiguous library version")
        library_version = quoted($0)
      }
      next
    }
    FILENAME == ARGV[2] {
      if ($0 == "[[package]]") { finish_package(); next }
      if ($0 ~ /^name[ \t]*=[ \t]*"[^"]+"[ \t]*$/) { name = quoted($0); names++ }
      if ($0 ~ /^version[ \t]*=[ \t]*"[^"]+"[ \t]*$/) { version = quoted($0); versions++ }
      if ($0 ~ /^source[ \t]*=[ \t]*"[^"]+"[ \t]*$/) { source = quoted($0); sources++ }
      next
    }
    FNR == 1 { finish_package() }
    {
      line = $0
      if ($0 ~ /^\[/) dependencies = ($0 == "[dependencies]")
      if (dependencies && $0 ~ /^[ \t]*zgpui[ \t]*=/) {
        if (++declarations != 1 || !($0 ~ /^[ \t]*zgpui[ \t]*=[ \t]*\{[ \t]*version[ \t]*=[ \t]*"=([0-9]+\.[0-9]+\.[0-9]+)"[ \t]*,[ \t]*features[ \t]*=[ \t]*\["native"\][ \t]*,[ \t]*git[ \t]*=[ \t]*"https:\/\/github\.com\/LIghtJUNction\/zgpui\.git"[ \t]*\}[ \t]*$/))
          fail("unexpected dependency declaration")
        if (substr(quoted($0), 2) != library_version) fail("manifest and library versions differ")
        sub(/git[ \t]*=[ \t]*"https:\/\/github\.com\/LIghtJUNction\/zgpui\.git"/, "path = \"vendor/zgpui\"", line)
      }
      lines[++count] = line
    }
    END {
      if (failed) exit 1
      if (library_names != 1 || library_versions != 1 || locked != 1 || declarations != 1 ||
          locked_version != library_version ||
          locked_source !~ /^git\+https:\/\/github\.com\/LIghtJUNction\/zgpui\.git#[0-9a-f]{40}$/)
        fail("lock source, revision, or version differs")
      for (i = 1; i <= count; i++) print lines[i]
    }
  ' vendor/zgpui/Cargo.toml Cargo.lock Cargo.toml > "$staged" || {
    rm -f "$staged"
    return 1
  }
  mv "$staged" Cargo.toml
  rm -f rust-toolchain.toml
  cargo generate-lockfile --offline
}

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  cargo test --frozen
  cargo test --manifest-path vendor/zgpui/Cargo.toml --features native --frozen
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  install -Dm755 target/release/zcall-gui "$pkgdir/usr/bin/zcall-gui"
  install -Dm644 packaging/zcall-gui.desktop "$pkgdir/usr/share/applications/zcall-gui.desktop"
  install -Dm644 packaging/zcall-gui.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/zcall-gui.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vendor/zgpui/LICENSE "$pkgdir/usr/share/licenses/$pkgname/zgpui-LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/zcall-gui/README.md"
  cp -R docs "$pkgdir/usr/share/doc/zcall-gui/"

}
