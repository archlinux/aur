# $Id$
# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>
# Contributor: Morgan <morganamilo@archlinux.org>
pkgname=paru-static
_pkgname=paru
pkgver=2.0.1
pkgrel=6
pkgdesc='Feature packed AUR helper'
url='https://github.com/morganamilo/paru'
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Morganamilo/paru/archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
license=('GPL3')
makedepends=('rustup' 'cargo' 'musl')
depends=('git' 'pacman' 'paru')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
sha256sums=('47cae94d227cc08f86706408d234444af6dda192ba24309c251a0b43a8aa7980')


_srcenv() {
  cd "$srcdir/$_pkgname-$pkgver"
  # musl build for openssl-sys
  export PKG_CONFIG_ALLOW_CROSS=1
  export RUSTUP_TOOLCHAIN=stable
  export TARGET="$CARCH-unknown-linux-musl"
  # If you prefer the settings in ~/.config/cargo.toml, comment out the following two lines to enable them.
  #source <(cargo +nightly -Z unstable-options rustc --print cfg|grep -E "target_(arch|vendor|os|env)")
  #export TARGET="${target_arch}-${target_vendor}-${target_os}-${target_env}"
}

prepare() {
  _srcenv
  rustup target add $TARGET
  cargo update
  cargo fetch --locked --target $TARGET
}

build () {
  _srcenv
  if pacman -T pacman-git > /dev/null; then
    _features+="git,"
  fi
  if [[ $TARGET =~ musl ]]; then
    _features+="static,"
  fi

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --frozen --features "${_features:-}" --release --target-dir target --target $TARGET
  #./scripts/mkmo locale/
}

package() {
  _srcenv
  install -Dm755 target/$TARGET/release/paru "${pkgdir}/usr/bin/paru-static"
  #install -Dm644 paru.conf "${pkgdir}/etc/paru.conf"

  #install -Dm644 man/paru.8 "$pkgdir/usr/share/man/man8/paru.8"
  #install -Dm644 man/paru.conf.5 "$pkgdir/usr/share/man/man5/paru.conf.5"

  #install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/paru.bash"
  #install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/paru.fish"
  #install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_paru"

  #install -d "$pkgdir/usr/share/"
  #cp -r locale "$pkgdir/usr/share/"
}
