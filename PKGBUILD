# Maintainer: kkernick <kkernick at protonmail dot com>
pkgname=antimony-sandbox
pkgdesc="Sandbox Applications"
pkgver=5.2.0
pkgrel=1

install=antimony.install
license=("Unlicense")
url="https://github.com/kkernick/antimony"
source=("git+$url#tag=$pkgver")
b2sums=("SKIP")
depends=(glibc bubblewrap libseccomp xdg-dbus-proxy sqlite dbus)
makedepends=(git cargo pkgconf zstd)
arch=("any")

prepare() {
  cd $srcdir/antimony
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $srcdir/antimony
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

check() {
  cd $srcdir/antimony
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test
}

package() {
  cd $srcdir/antimony
  install -Dm755 "target/release/antimony" "$pkgdir/usr/bin/antimony"

  for binary in antimony-monitor antimony-spawn antimony-dumper antimony-open antimony-tracer antimony-notify; do
    install -Dm755 "target/release/$binary" "$pkgdir/usr/share/antimony/utilities/$binary"
  done

  for profile in $(ls config/profiles); do
	  install -Dm644 "config/profiles/$profile" "$pkgdir/usr/share/antimony/config/profiles/$profile"
  done

  for feature in $(ls config/features); do
	  install -Dm644 "config/features/$feature" "$pkgdir/usr/share/antimony/config/features/$feature"
  done

  install -Dm644 "config/default.toml" "$pkgdir/usr/share/antimony/config/profiles/default.toml"
  install -Dm644 "config/profile.toml" "$pkgdir/usr/share/antimony/config/profile.toml"
  install -Dm644 "config/feature.toml" "$pkgdir/usr/share/antimony/config/feature.toml"

  install -Dm644 "config/config.toml" "$pkgdir/etc/antimony.toml"
  install -Dm644 "config/config.d/base.toml" "$pkgdir/etc/antimony.d/base.toml"


  # Build the shell completions
  target/release/antimony_completions
  install -Dm644 "completions/antimony.bash" "$pkgdir/usr/share/bash-completion/antimony"
  install -Dm644 "completions/antimony.fish" "$pkgdir/usr/share/fish/vendor_completions.d/antimony.fish"
  install -Dm644 "completions/_antimony" "$pkgdir/usr/share/zsh/site-functions/_antimony"
}
