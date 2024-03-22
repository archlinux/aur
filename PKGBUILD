# $Id$
# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>
# Contributor: Morgan <morganamilo@archlinux.org>
pkgname=paru-static
_pkgname=paru
pkgver=2.0.3
pkgrel=1
pkgdesc='Feature packed AUR helper'
url='https://github.com/morganamilo/paru'
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Morganamilo/paru/archive/v$pkgver.tar.gz"
        git+https://aur.archlinux.org/pacman-static.git)
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
license=('GPL-3.0-or-later')
makedepends=('rustup' 'cargo' 'musl' 'meson' 'kernel-headers-musl' 'lld')
depends=('git' 'pacman')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
sha256sums=('ccf6defc4884d580a4b813cc40323a0389ffc9aa4bdc55f3764a46b235dfe1e0'
            'SKIP')


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
  cargo fetch --locked --target $TARGET
}

build () {
  # If pacman-static(6.1.0) is not installed, build and install it.
  cd $srcdir/pacman-static
  # disable lto
  sed "s/^options=(\(.*\))$/options=(\1 '\!lto')/" PKGBUILD -i
  # disable CFLAGS and CXXFLAGS and LDFLAGS of makepkg.conf
  #sed -r "/(export LDFLAGS=.*)/s/(.+)/unset CFLAGS\nunset CXXFLAGS\n\1/" PKGBUILD -i
  # pacman-static build & install
  [[ $(LC_ALL=C pacman -Qi pacman-static |grep "6.1.0") ]] || makepkg -si --skippgpcheck --noconfirm

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
  if [[ $CARCH == x86_64 ]]; then
    export RUSTFLAGS="-C link-self-contained=on -C strip=symbols -C no-redzone=y -C overflow-checks=y -C lto=fat -C embed-bitcode=y -C codegen-units=1 -C opt-level=z -C control-flow-guard=y -C link-arg=-fuse-ld=lld"
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
