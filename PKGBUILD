# Maintainer: kkernick <kkernick at protonmail dot com>
pkgname=antimony-sandbox
pkgdesc="Sandbox Applications"
pkgver=2.5.0
pkgrel=1

install=antimony.install
license=("Unlicense")
url="https://github.com/kkernick/antimony"
source=("git+https://github.com/kkernick/antimony#tag=${pkgver}")
b2sums=("SKIP")
depends=(findutils glibc bubblewrap libseccomp strace xdg-dbus-proxy sqlite libnotify)
makedepends=(git cargo)
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
  for binary in antimony antimony-monitor antimony-spawn; do
    install -Dm755 "target/release/$binary" "$pkgdir/usr/bin/$binary"
  done

  for profile in $(ls config/profiles); do
	  install -Dm644 "config/profiles/$profile" "$pkgdir/usr/share/antimony/profiles/$profile"
  done

  for feature in $(ls config/features); do
	  install -Dm644 "config/features/$feature" "$pkgdir/usr/share/antimony/features/$feature"
  done

  install -Dm644 "config/default.toml" "$pkgdir/usr/share/antimony/config/default.toml"
  install -Dm644 "config/new.toml" "$pkgdir/usr/share/antimony/config/new.toml"

  # Build the shell completions
  target/release/antimony_completions
  install -Dm644 "completions/antimony.bash" "$pkgdir/usr/share/bash-completion/antimony"
  install -Dm644 "completions/antimony.fish" "$pkgdir/usr/share/fish/vendor_completions.d/antimony.fish"
  install -Dm644 "completions/_antimony" "$pkgdir/usr/share/zsh/site-functions/_antimony"
}
