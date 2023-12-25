# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>
pkgname=paru-static
_pkgname=paru
_openssl_ver=3.2.0
pkgver=2.0.1
pkgrel=3
pkgdesc='Feature packed AUR helper'
url='https://github.com/morganamilo/paru'
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Morganamilo/paru/archive/v$pkgver.tar.gz")
backup=("etc/paru.conf")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
makedepends=('cargo' 'musl' 'mold')
depends=('git' 'pacman')
conflicts=('paru')
provides=('paru')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
sha256sums=('47cae94d227cc08f86706408d234444af6dda192ba24309c251a0b43a8aa7980')

TARGET="x86_64-unknown-linux-musl"
export RUSTUP_TOOLCHAIN=stable
export PKG_CONFIG_ALLOW_CROSS=1

prepare() {
  cd "${srcdir}/$_pkgname-$pkgver"
  #cargo add openssl-src
  cargo fetch --locked --target $TARGET
}

build () {
  cd "$srcdir/$_pkgname-$pkgver"

  if pacman -T pacman-git > /dev/null; then
    _features+="git,"
  fi

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  rustflags="
  target-feature=+crt-static
  strip=symbols
  no-redzone=y
  overflow-checks=y
  lto=fat
  embed-bitcode=y
  codegen-units=1
  opt-level=z
  control-flow-guard=y
  link-self-contained=yes
  "
  link_args="-fuse-ld=mold -Wp,-D_FORTIFY_SOURCE=2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fPIE -fpie -Wl,-z,relro,-z,now -s"
  RUSTFLAGS="$(printf -- '-C%s ' $rustflags) $(printf -- '-Clink-arg=%s ' $link_args)"
  export RUSTFLAGS=$RUSTFLAGS" -L native=/usr/lib/musl/lib/"
  cargo build --frozen --features "static,${_features:-}" --release --target-dir target --target $TARGET
  ./scripts/mkmo locale/
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm755 target/$TARGET/release/paru "${pkgdir}/usr/bin/paru"
  install -Dm644 paru.conf "${pkgdir}/etc/paru.conf"

  install -Dm644 man/paru.8 "$pkgdir/usr/share/man/man8/paru.8"
  install -Dm644 man/paru.conf.5 "$pkgdir/usr/share/man/man5/paru.conf.5"

  install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/paru.bash"
  install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/paru.fish"
  install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_paru"

  install -d "$pkgdir/usr/share/"
  cp -r locale "$pkgdir/usr/share/"
}
